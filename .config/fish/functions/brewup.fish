function brewup  --description 'brew update (itself), upgrade (all packages), cleanup, and dump bundle'
    og_brew update                                      # Update Homebrew
    og_brew bundle --global -f cleanup                  # Delete deps removed from brewfile
    og_brew bundle --global upgrade                     # Install & upgrade from Brewfile
    og_brew autoremove                                  # Remove unneeded deps
    og_brew cleanup                                     # General cleanup
    og_brew bundle dump --global -f --no-npm --no-uv --no-vscode    # Update Brewfile
end
