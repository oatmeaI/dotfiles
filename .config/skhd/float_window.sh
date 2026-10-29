YABAI_SCRIPT=$(yabai -m query --windows --window | jq -r '.["is-floating"]' | awk "{print toupper(\$0)}")
if [[ "$YABAI_SCRIPT" == "FALSE" ]]; then
    yabai -m window --toggle float
fi
