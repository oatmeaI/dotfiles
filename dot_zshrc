##################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
##################################

##################################
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
##################################

##################################
# Setup alias to control config syncing
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
##################################

##################################
# We use Neovim
export EDITOR='nvim'
export VISUAL='nvim'
##################################

##################################
# Set up environment variables, if the file exists; this way we don't sync these secrets to git.
if [[ -r "$HOME/secretvars.sh" ]]; then
    source "$HOME/secretvars.sh"
    export PATH=~/.local/bin:$PATH
fi
##################################

##################################
# Set up NVM
# This needs to be updated / streamlined - it's currently copy/pasted from the brew install directory. For example, line 33 will break if nvm gets updated
# $NVM_DIR should be "$HOME/.nvm" by default to avoid user-installed nodes destroyed every update
# [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
#
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#\. /opt/homebrew/Cellar/nvm/0.39.5/libexec/nvm.sh

# "nvm exec" and certain 3rd party scripts expect "nvm.sh" and "nvm-exec" to exist under $NVM_DIR
#[ -e "$NVM_DIR" ] || mkdir -p "$NVM_DIR"
#[ -e "$NVM_DIR/nvm.sh" ] || ln -s /opt/homebrew/opt/nvm/libexec/nvm.sh "$NVM_DIR/nvm.sh"
#[ -e "$NVM_DIR/nvm-exec" ] || ln -s /opt/homebrew/opt/nvm/libexec/nvm-exec "$NVM_DIR/nvm-exec"
##################################

##################################
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
##################################

##################################
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
##################################

##################################
# https://github.com/marlonrichert/zsh-autocomplete
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style complete-word

source ~/.fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
##################################

##################################
# https://github.com/jarun/nnn
alias dotinstall='config pull && ~/dotfiles/install.sh'
alias dotupdate='~/dotfiles/update.sh'
alias ls="eza"
export PATH="/usr/local/sbin:$PATH"
##################################
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/villanih/.bun/_bun" ] && source "/Users/villanih/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
