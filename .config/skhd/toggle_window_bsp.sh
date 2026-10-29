YABAI_SCRIPT=$(yabai -m query --windows --window | jq -r '.["is-floating"]' | awk "{print toupper(\$0)}")
yabai -m window --toggle float

# Move to Space 2 if we're adding to BSP; Space 1 if we're floating
if [[ "$YABAI_SCRIPT" == "FALSE" ]]; then
    yabai -m window --grid 1:1:0:0:1:1
    yabai -m window --space 1
    yabai -m space --focus 1
else
    yabai -m window --space 2
    yabai -m space --focus 2
fi
