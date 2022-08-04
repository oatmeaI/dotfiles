#!/bin/zsh

# Install Oh My ZSH if we don't have it already
if ! [ -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew if we don't have it already
if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Neovim, TheFuck, Yarn, NVM and the Fira Code Nerd Font
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font nvim thefuck yarn nvm

# Brew can't seem to tell if KiTTY is installed already, so we check by hand
if ! [ -d "/Applications/kitty.app" ]; then
    brew install kitty
fi

# Install Typewritten shell prompt, if we don't have it yet.
if ! [ -d "$HOME/.zsh/typewritten" ]; then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/reobin/typewritten.git "$HOME/.zsh/typewritten"
fi

# Make backups of everything before pulling all the files down
if ! [ -d "$HOME/.config-backup" ]; then
    mkdir "$HOME/.config-backup"
fi

if [ -d "$HOME/.config/kitty" ]; then
    mv "$HOME/.config/kitty" "$HOME/.config-backup/kitty"
fi

if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config-backup/nvim"
fi

if [ -d "$HOME/.dotfiles" ]; then
    mv "$HOME/.dotfiles" "$HOME/.config-backup/dotfiles"
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

# Set up the `config` alias, and clone the repo!
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
if ! [-d "$HOME/.dotfiles"]; then
    git clone --bare https://github.com/oatmeaI/dotfiles.git $HOME/.dotfiles
fi
config checkout
