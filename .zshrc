export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git gitfast vi-mode)
source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export EDITOR='nvim'
export VISUAL='nvim'

autoload -Uz compinit && compinit

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_DISABLE_RETURN_CODE=true
export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="# "

eval $(thefuck --alias)

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
