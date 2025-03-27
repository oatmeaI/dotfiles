#!/bin/zsh --no-rcs

get_store() {
	if [[ -n $pad_store ]]; then
		echo "$pad_store"
		return
	fi
	echo "$alfred_workflow_data"
}

# Get the first non empty line from a scratchpad, or
# Get the first matching line if second argument exists
get_preview() {
  local str="$1"
  local lines=("${(f@)str}")
  for line in ${lines}; do
	# Get first line that matches query
	if [[ -n "${2+1}" && "$line:l" =~ "$2" ]]; then
	  # Return first matching line
      echo "$line"
      return
	
	# Check if line is not empty
    elif [[ -n "$line" && -z "$2" ]]; then
		# Return the first non-empty line
		echo "$line"
		return
    fi
  done
}

# Escape double quotes
escaped() {
	str="$1"
	#str="${str//\\/ABSURD}"
	str="${str//\"/\\\"}"
	echo "$str"
}

# Trim whitespaces and newlines
trimmed() {
	local s2 s="$1"
	until s2="${s#[[:space:]]}"; [ "$s2" = "$s" ]; do s="$s2"; done
	until s2="${s%[[:space:]]}"; [ "$s2" = "$s" ]; do s="$s2"; done
  echo "$s"
}

# Remove leading octothorp symbols and trim
stripped() {
	str="$1:gs/\#/"
	#echo "$(trimmed "$str")"
	trimmed "$str"
}

# Preprocess the user query
# Some symbols seem to require special attention
prepared() {
	q="$1:l" # lowercased
	# FIXME: Backslash matching... 
	# echo \\\\ > \
	# echo \\\\\\\\ > \\
	# Replacing backslash with a fake version for preview: \u29F5
	q="${q//\\/⧵}"

	q="${q//\$/\\$}"
    q="${q//\(/\\(}"
	q="${q//\?/\\?}"
	q="${q//\|/\\|}"
	q="${q//\[/\\[}"
	q="${q//\^/\\^}"
	q="${q//\-/\\-}"
	q="${q//\*/\\*}"
	q="${q//\./\\.}"
	q="${q//\+/\\+}"

	echo "$(trimmed "$q")"
}


readonly store="$(get_store)"
readonly pads=({1..${pad_count}})
readonly query="$(prepared "$1")"
response="{\"skipknowledge\":true,\"items\":["
items=""

for num in $pads; do
	
	local file_path="$store/${num}.${pad_extension}"

	local dot=""
	case $num in
		1) dot="🟡";;
		2) dot="🟠";;
		3) dot="🔴";;
		4) dot="🟣";;
		5) dot="🔵";;
		6) dot="🟢";;
		7) dot="⚪️";;
		8) dot="⚫️";;
		9) dot="🟤";;
		*) dot="⭕️";;
	esac

	# Load the contents of the scratchpad
	local pad_content=$(<"$file_path")
	# Replace backslash with a fake version for preview: \u29F5
	pad_content="${pad_content//\\/⧵}" 
	# Get first non-empty line for the title
	local title="$(get_preview "$pad_content")"

	#  Filter against query if provided
	if [[ ! -z $query ]]; then
		if [[ "${pad_content:l}" =~ $query ]]; then
			# Get the first line that contains $query
			local preview="$(get_preview "$pad_content" "$query")" 
			preview="$(escaped "$preview")"
			preview="$(trimmed "$preview")"

			local _title="$(stripped "$title")"
			_title="$(escaped "$_title")" 

			items+="{\"title\":\"${_title}\",\"subtitle\":\"$preview\",\"arg\":\"$file_path\",\"type\":\"file\",\"variables\":{\"active_pad\":\"$num\",\"dot\":\"$dot\"},\"icon\":{\"path\":\"icons/${num}.png\"},\"text\":{\"largetype\":\"$preview\"}},"
		fi
	else
		local _title="$(stripped "$title")"
		_title="$(escaped "$_title")" 

		items+="{\"title\":\"${_title}\",\"arg\":\"$file_path\",\"type\":\"file\",\"variables\":{\"active_pad\":\"$num\",\"dot\":\"$dot\"},\"icon\":{\"path\":\"icons/${num}.png\"}},"
	fi
done

# Guard $items is not empty
[[ -z "$items" ]] && items="{\"title\":\"No Results.\",\"valid\":false,\"icon\":{\"path\":\"icons/info.png\"}},"

items="${items%,}" # drop last comma
response+="$items"
response+="]}"
echo -n $response