YABAI_SCRIPT=$(yabai -m query --spaces --space | jq -r '.["type"]' | awk "{print toupper(\$0)}")
SPACE_NUM=$(yabai -m query --spaces --space | jq -r '.["index"]' | awk "{print toupper(\$0)}")
echo "SPACE: $SPACE_NUM [$YABAI_SCRIPT]"
