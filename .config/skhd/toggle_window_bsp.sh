YABAI_SCRIPT=$(yabai -m query --windows --window | jq -r '.["space"]' | awk "{print toupper(\$0)}")

# Move to Space 2 if we're adding to BSP; Space 1 if we're floating
if [[ "$YABAI_SCRIPT" == "2" ]]; then
    yabai -m window --space 1
    yabai -m space --focus 1
else
    yabai -m window --space 2
    yabai -m space --focus 2
fi
