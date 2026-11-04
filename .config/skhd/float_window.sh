YABAI_SCRIPT=$(yabai -m query --windows --window | jq -r '.["is-floating"]' | awk "{print toupper(\$0)}")
YABAI_SPACE=$(yabai -m query --windows --window | jq -r '.["space"]' | awk "{print toupper(\$0)}")

if [[ "$YABAI_SPACE" == "2" ]]; then
    yabai -m window --space 1
    yabai -m space --focus 1
fi

if [[ "$YABAI_SCRIPT" == "FALSE" ]]; then
    yabai -m window --toggle float
fi
