function normal_mode() {
    hs -c "setMode('normal')"
    hs -c "skhd_help.hide()"
    sketchybar -m --set modal label="[n]"
    yabai -m config active_window_border_color 0xFFA0ABF5
}

function move_mode() {
    hs -c "setMode('window_move')"
    hs -c "skhd_help.show('window_move')"
    sketchybar -m --set modal label="[m]"
    yabai -m config active_window_border_color 0xFFf5bde5
}

function window_mode() {
    hs -c "setMode('window_navigation')"
    sketchybar -m --set modal label="[w]"
}

if [ $1 = '-w' ]; then
    window_mode
elif [[ $1 == '-n' ]]; then
    normal_mode
elif [[ $1 == '-m' ]]; then
    move_mode

fi
