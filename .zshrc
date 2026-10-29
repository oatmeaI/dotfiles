##### Basics
alias ls="eza -al"
alias brewup="brew bundle -g & brew autoremove && brew cleanup"
alias brewadd="brew bundle -g add"
alias brewme="brew bundle --file=$HOME/.Brewfile.local add"
alias unbrew="brew bundle -g remove"
export XDG_CONFIG_HOME=~/.config
export PATH="$PATH:/opt/homebrew/bin:$HOME/.local/bin"

##### Work stuff
if [ -e ~/secretvars.zsh ]
then
    source ~/secretvars.zsh
fi

##### Antigen
source /opt/homebrew/share/antigen/antigen.zsh
antigen init ~/.config/antigen/.antigenrc

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
