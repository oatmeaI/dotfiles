function bremove --description 'remove from global .Brewfile and uninstall'
    brew bundle --global remove $argv
    brew bundle --global -f cleanup

end
