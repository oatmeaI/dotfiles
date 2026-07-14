YABAI_SCRIPT=$(yabai -m query --spaces --space | jq -r '.type' | awk "{print toupper(\$0)}")

if [[ "$YABAI_SCRIPT" == "" ]]; then
    echo "MODE: OFF"
else
    echo "MODE: $YABAI_SCRIPT"
fi
