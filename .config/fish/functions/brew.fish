function brew --wraps='brew' --description 'override some homebrew commands'
    echo "Using brew alias; use og_brew to access actual brew binary"

    if test "$argv[2]" = "-h"
        og_brew $argv
        return
    end

    if test "$argv[1]" = "install"
        binstall $argv
        return
    end

    if test "$argv[1]" = "uninstall"
        bremove $argv
        return
    else
        og_brew $argv
    end

end
