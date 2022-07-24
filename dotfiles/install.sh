#!/bin/zsh

# Oh My ZSH
# check for installation first
if ! [ -d "$HOME/.oh-my-zsh" ]; then # mkcd is an alias that omz installs
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Homebrew
# check for installation first
if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install nvim thefuck yarn nvm
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

if ! [ -d "/Applications/kitty.app" ]; then
    brew install kitty
fi

if ! [ -d "$HOME/.zsh/typewritten" ]; then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"
fi

if ! [ -d "$HOME/.config-backup"]; then
    mkdir "$HOME/.config-backup"
fi

if [ -d "$HOME/.config/kitty" ]; then
    mv "$HOME/.config/kitty" "$HOME/.config-backup"
fi

if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config-backup"
fi

if [ -f "$HOME/.vimrc" ]; then
    mv "$HOME/.vimrc" "$HOME/.config-backup"
fi

if [ -f "$HOME/.zprofile" ]; then
    mv "$HOME/.zprofile" "$HOME/.config-backup"
fi

if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.config-backup"
fi

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/oatmeaI/dotfiles.git $HOME/.dotfiles
config checkout
