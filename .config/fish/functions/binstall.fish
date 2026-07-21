function binstall --wraps='brew install' --description 'add to global .Brewfile and install'
    echo "Running custom binstall command to add to Brewfile as well"
    og_brew bundle --global add $argv[2]
    og_brew install $argv[2]

end
