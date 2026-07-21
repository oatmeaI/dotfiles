function brewup  --description 'brew update (itself), upgrade (all packages), cleanup, and dump bundle'
    og_brew bundle --global
    og_brew update
    og_brew upgrade
    og_brew autoremove
    og_brew cleanup
    og_brew bundle dump --global -f --no-npm --no-uv
end
