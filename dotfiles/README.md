`alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
`echo ".dotfiles" >> .gitignore`
`git clone --bare <git-repo-url> $HOME/.dotfiles`
`config checkout`
