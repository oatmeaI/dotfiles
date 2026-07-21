function binstall --wraps='brew install' --description 'add to global .Brewfile and install'
    brew bundle --global add $argv
    brew bundle --global

end
