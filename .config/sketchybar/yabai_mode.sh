yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[-1].type')
sketchybar -m --set yabai_mode label="$yabai_mode"
