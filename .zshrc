##### Basics
alias ls="eza -al"
export XDG_CONFIG_HOME=~/.config
export PATH="$PATH:/opt/homebrew/bin:$HOME/.local/bin"

##### Work stuff
source ~/secretvars.zsh

##### Antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen init ~/.config/antigen/.antigenrc
# source ~/.antigen/init.zsh

##### zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

##### Custom Prompt
eval "$(starship init zsh)"

##### fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi
