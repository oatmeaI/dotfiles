function brewup  --description 'brew update (itself), upgrade (all packages), cleanup, and dump bundle'
    brew bundle --global
    brew update
    brew upgrade
    brew autoremove
    brew cleanup
    brew bundle dump --global -f --no-npm --no-uv
end
