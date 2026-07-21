function brewup  --description 'brew update (itself), upgrade (all packages), cleanup, and dump bundle'
    brew update
    brew upgrade
    brew cleanup
    brew bundle dump --global -f       
end
