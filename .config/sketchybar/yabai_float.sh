case "$(yabai -m query --windows --window | jq '."is-floating"')" in
    false)
    sketchybar -m --set yabai_float label=""
    ;;
    true)
    sketchybar -m --set yabai_float label=""
    ;;
esac
