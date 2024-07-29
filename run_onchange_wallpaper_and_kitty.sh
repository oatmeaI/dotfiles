#! /bin/bash

osascript -e 'tell application "Finder" to set desktop picture to alias ((path to pictures folder as text) & "wallpaper.png")'
rm /var/folders/*/*/*/com.apple.dock.iconcache
killall Dock
