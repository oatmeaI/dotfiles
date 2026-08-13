#!/usr/bin/env python3
import os

layout = os.popen("yabai -m query --spaces --space | jq -r '.type'").read().rstrip()

if layout == "stack":
    os.popen("yabai -m space --layout bsp")
elif layout == "bsp":
    os.popen("yabai -m space --layout float")
else:
    os.popen("yabai -m space --layout stack")
