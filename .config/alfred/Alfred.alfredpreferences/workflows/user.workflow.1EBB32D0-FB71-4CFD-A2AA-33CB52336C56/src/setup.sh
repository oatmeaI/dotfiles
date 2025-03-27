#!/bin/zsh --no-rcs

get_store() {
	if [[ -n $pad_store ]]; then
		echo "$pad_store"
		return
	fi
	echo "$alfred_workflow_data"
}

readonly store="$(get_store)"
readonly pads=({1..${pad_count}})

[[ -d "$store" ]] || mkdir "$store"

for num in $pads; do
	local pad="${store}/${num}.${pad_extension}"
	if [[ ! -a "$pad" ]]; then
		touch "$pad"
		case $num in
			1) echo "# First Pad\n"   > "$pad";;
			2) echo "# Second Pad\n"  > "$pad";;
			3) echo "# Third Pad\n"   > "$pad";;
			4) echo "# Fourth Pad\n"  > "$pad";;
			5) echo "# Fifth Pad\n"   > "$pad";;
			6) echo "# Sixth Pad\n"   > "$pad";;
			7) echo "# Seventh Pad\n" > "$pad";;
			8) echo "# Eighth Pad\n"  > "$pad";;
			9) echo "# Ninth Pad\n"   > "$pad";;
			*) echo "Invalid number"  >&2     ;;
		esac
	fi
done