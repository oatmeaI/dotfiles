yabai -m space --layout stack

yabai -m rule --add title="^.*$" manage=on
yabai -m rule --apply

yabai -m rule --add title="^.*$" manage=off
yabai -m rule --apply

yabai -m space --layout bsp
