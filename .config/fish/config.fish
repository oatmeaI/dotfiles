eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source

set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
