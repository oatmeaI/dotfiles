#!/usr/bin/env fish
function seticons
    set haschanged 0
    for file in ~/icons/*
        if not test -e "$file"
            continue
        end

        # Get just the filename (strip directory path)
        set basename (string replace -r '.*/' '' -- $file)

        # Replace the file extension with .app
        set newname (string replace -r '\.[^.]+$' '.app' -- $basename)

        set appname "/Applications/$newname"
    
        if not fileicon test $appname
            sudo fileicon set $appname $file
            set haschanged 1
        end
    end
    if test $haschanged -eq 1
        echo restarting dock
        rm /var/folders/*/*/*/com.apple.dock.iconcache
        rm -r /var/folders/*/*/*/com.apple.iconservices*
        killall Dock
    end
end
