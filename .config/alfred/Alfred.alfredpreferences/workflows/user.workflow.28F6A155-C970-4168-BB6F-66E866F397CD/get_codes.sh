#!/usr/bin/env bash

# Usage
#  get_codes.sh [--test] [--newline]
#     --test: Run the script in test mode.
#     --newline: Print a newline after the output.
#  To keep the script simple, the arguments are expected to be in these exact positions.

ROW_REGEX='^\[?\{"ROWID"\:([[:digit:]]+),"sender"\:"([^"]+)","service"\:"([^"]+)","message_date"\:"([^"]+)","text"\:"([[:print:]][^\\]+)"\}.*$'

NUMBER_MATCH_REGEX='([G[:digit:]-]{3,})'

# Print the first argument if in Alfred debug mode.
function debug_text() {
	if [[ $alfred_debug == "1" ]]; then
		>&2 echo $1
	fi
}

output=''
lookBackMinutes=${lookBackMinutes:-15}

# Check if alfred has full disk access.
if [[ "$1" != "--ignore-full-disk-check" && ! -r ~/Library/Messages/chat.db ]]; then
	echo '{
	  "items": [
	    {
	      "type": "default",
	      "valid": true,
	      "icon": {"path": "icon.png"},
	      "subtitle": "Launch System Preferences and turn this on.",
	      "title": "Full Disk Access Required for Alfred",
		  "variables": {
			"launch_full_disk": 1
		  }
	    },
	    {
	      "type": "default",
	      "valid": true,
	      "icon": {"path": "icon.png"},
	      "subtitle": "See a short explanation of why full disk access is required.",
	      "title": "Why is full disk access required?",
		  "variables": {
			"launch_url": 1,
			"url": "https://github.com/thebitguru/alfred-simple-2fa-paste/wiki/Full-Disk-Access"
		  }
	    }
	  ]
	}'
	exit 1
fi

debug_text "Lookback minutes: $lookBackMinutes"

if [[ "$2" == "--test" ]]; then
	echo "Running in test mode."
	response=`cat test_messages.txt`
else
	debug_text "Lookback minutes: $lookBackMinutes"

	sqlQuery="select
		message.rowid,
		ifnull(handle.uncanonicalized_id, chat.chat_identifier) AS sender,
		message.service,
		datetime(message.date / 1000000000 + strftime('%s', '2001-01-01'), 'unixepoch', 'localtime') AS message_date,
		message.text
	from
		message
			left join chat_message_join on chat_message_join.message_id = message.ROWID
			left join chat on chat.ROWID = chat_message_join.chat_id
			left join handle on message.handle_id = handle.ROWID
	where
		message.is_from_me = 0
		and message.text is not null
		and length(message.text) > 0
		and (
			message.text glob '*[0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9][0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9]-[0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9][0-9][0-9][0-9][0-9]*'
			or message.text glob '*[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]*'
		)
		  and datetime(message.date / 1000000000 + strftime('%s', '2001-01-01'), 'unixepoch', 'localtime')
		          >= datetime('now', '-$lookBackMinutes minutes', 'localtime')
	order by
		message.date desc
	limit 10;"
	debug_text "SQL Query: $sqlQuery"

	response=$(sqlite3 ~/Library/Messages/chat.db -json "$sqlQuery" ".exit")
	debug_text "SQL Results: '$response'"
fi


if [[ -z "$response" ]]; then
	output+='{
		"rerun": 1,
		"items": [
			{
				"type": "default", 
				"valid": "false", 
				"icon": {"path": "icon.png"}, 
				"arg": "", 
				"subtitle": "Searched messages in the last '"$lookBackMinutes"' minutes.", 
				"title": "No codes found"
			}
		]
	}'
else
	while read line; do
		debug_text "Line: $line"
		if [[ $line =~ $ROW_REGEX ]]; then
		 	sender=${BASH_REMATCH[2]}
			message_date=${BASH_REMATCH[4]}
			message=${BASH_REMATCH[5]}
			debug_text " Found sender: $sender"
			debug_text " Found message_date: $message_date"
			debug_text " Found message: $message"

			remaining_message=$message
			message_quoted=${message//[\"]/\\\"}

			while [[ $remaining_message =~ $NUMBER_MATCH_REGEX ]]; do
				debug_text " -- Message: $message"
				debug_text " -- Found-1 ${BASH_REMATCH[1]}"
				code=${BASH_REMATCH[1]}

				if [[ -z "$output" ]]; then
					output='{"rerun": 1, "items":['
				else
					output+=','
					if [[ "$3" == "--newline" ]]; then
						output+="\n"
					fi
				fi
				# >&2 echo "Original $message"
				# >&2 echo "Quoted $message_quoted"
				# >&2 echo
				item="{\"type\":\"default\", \"icon\": {\"path\": \"icon.png\"}, \"arg\": \"$code\", \"subtitle\": \"${message_date}: ${message_quoted}\", \"title\": \"$code\"}"
				# >&2 echo $item
				output+=$item
				# >&2 echo "New output: $output"

				# Trim to the remaining message
				# >&2 echo "REMATCH: ${BASH_REMATCH[0]}"
				# >&2 echo "Before truncating message: $remaining_message"
				remaining_message=${remaining_message##*${BASH_REMATCH[0]}}
				# >&2 echo "Remaining message: $remaining_message"
			done
		else
			>&2 echo "No match for $line"
		fi

		continue
	done <<< "$response"
	output+=']}'
fi

debug_text "Final Output: '$output'"
echo -e $output
