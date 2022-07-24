#!/bin/zsh

# Oh My ZSH
# check for installation first
if ! [ -x "$(command -v mkcd)" ]; then # mkcd is an alias that omz installs
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Homebrew
# check for installation first
if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install nvim kitty thefuck yarn nvm
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

mkdir -p "$HOME/.zsh"
git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/kvillaniholland/dotfiles $HOME/.dotfiles
config checkout
