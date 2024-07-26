eval "$(/opt/homebrew/bin/brew shellenv)"
starship init fish | source

export EDITOR='nvim'
export VISUAL='nvim'


if status is-interactive
    # Commands to run in interactive sessions can go here
end
