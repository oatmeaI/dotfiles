yabai -m space 1 --layout stack
yabai -m query --windows |
    jq -r '.[] | select(."is-floating" == true) | .id' |
    while read id; do
        yabai -m window "$id" --toggle float
    done
