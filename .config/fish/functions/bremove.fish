function bremove --wraps='brew uninstall' --description 'remove from global .Brewfile and uninstall'
    echo "Running custom bremove command to remove from Brewfile as well"
    og_brew uninstall $argv[2]
    og_brew bundle dump --global -f --no-npm --no-uv --no-vscode    # Update Brewfile

end
