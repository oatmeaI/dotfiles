# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup Oh My ZSH
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME=""
# plugins=(git gitfast vi-mode)
# source $ZSH/oh-my-zsh.sh

# Setup alias to control config syncing
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# We use Neovim
export EDITOR='nvim'
export VISUAL='nvim'

# Git completion
# autoload -Uz compinit && compinit

# Configure & load Typewritten prompt
# export TYPEWRITTEN_CURSOR="block"
# export TYPEWRITTEN_DISABLE_RETURN_CODE=true
# export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "
# fpath+=$HOME/.zsh/typewritten
# autoload -U promptinit; promptinit
# prompt typewritten

# Set up adobe environment variables, if the file exists; this way we don't sync these secrets to git.
if [[ -r "$HOME/adobevars.sh" ]]; then
  source "$HOME/adobevars.sh"
fi

# Turn on TheFuck
eval $(thefuck --alias)

# Set up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# eval "kitty @ set-colors -c $HOME/base16-kitty/colors/$(cat $HOME/.config/.base16_theme.conf).conf"

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# https://github.com/marlonrichert/zsh-autocomplete
source ~/.zsh/auto-complete/zsh-autocomplete.plugin.zsh

# https://github.com/jarun/nnn
alias ls='nnn -de'
