# Oatmeal's Dots

## Contains configs for:

- [Neovim](https://neovim.io/)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Neofetch](https://github.com/dylanaraps/neofetch)
- [btop](https://github.com/aristocratos/btop)
- [SketchyBar](https://felixkratz.github.io/SketchyBar/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

I'm also using [Amethyst](https://ianyh.com/amethyst/), but it's configured via the app. I'll make a config file for it eventually and add it here.

## First time install

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/oatmeaI/dotfiles/main/dotfiles/install.sh)"
```

## Updates

- `config pull` to download latest configs
- `dotinstall` to update dependencies, etc

## Keymaps
I use Karabiner-Elements to remap the Caps Lock key to Shift+Cmd+Ctrl+Opt, and then configure the following shortcuts:
- Caps-F: Spotlight / Alfred
- Caps-Space: [Contexts] Switch apps / windows
- Caps-D: [Amethyst] Cycle Layout
- Caps-A: [Amethyst] Shrink main pane
- Caps-S: [Amethyst] Grow main pane
- Caps-W: [Amethyst] Move window to other pane
- Caps-{1-4}: [Amethyst] Move window to space
- Caps-E: [Amethyst] Float window
- Caps-Tilde: [Amethyst] Relaunch Amethyst
- Caps-R: [Amazing Marvin] Quick add todo
- Caps: Esc
- Shift x2: Turn on caps lock

## Apps:
The main applications I use for my workflow every day:
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) (key remapping)
- [Contexts](https://contexts.co/) (better app switcher)
- [Bartender](https://www.macbartender.com/) (menu bar cleanup & search)
- [SketchyBar](https://felixkratz.github.io/SketchyBar/) (status bar)
- [Amethyst](https://ianyh.com/amethyst/) (window management)
- [Amphetamine](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12) (keep-awake)
- [Alfred](https://www.alfredapp.com/) (spotlight replacement - I'm still evaluating this one)
- [Marvin](https://amazingmarvin.com/) (todo list)

## Various macOS Settings:
I have my dock and menu bar set to auto show & hide, and have the margins on Amethyst set to keep the space open for each. I set my menu bar to have as little as possible in it, and use Bartender's "Show For Updates" feature show a couple things in my menubar when needed (ie. if my VPN disconnects, the VPN item will show in my menubar).

## Notes
- The icon I use for Kitty is in the `dotfiles` directory.
- There are also a few wallpapers that I've collected, as well as the one I'm currently using.
