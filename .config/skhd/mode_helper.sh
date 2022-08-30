function normal_mode() {
#    hs -c "setMode('normal')"
    sketchybar -m --set modal icon="[n]"
}

function move_mode() {
#    hs -c "setMode('window_move')"
    sketchybar -m --set modal icon="[m]"
}

function window_mode() {
#    hs -c "setMode('window_navigation')"
    sketchybar -m --set modal icon="[w]"
}

if [ $1 = '-w' ]; then
    window_mode
elif [[ $1 == '-n' ]]; then
    normal_mode
elif [[ $1 == '-m' ]]; then
    move_mode

fi

