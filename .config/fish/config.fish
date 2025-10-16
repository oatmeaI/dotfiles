eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source

set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"

if test -f ~/secretvars.fish
    source ~/secretvars.fish
end

if status is-interactive
    atuin init fish | source
end

# Created by `pipx` on 2025-04-02 20:30:38
set PATH $PATH /Users/oatmeal/.local/bin
