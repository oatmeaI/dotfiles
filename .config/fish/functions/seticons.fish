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

        if not test -e "$appname"
            echo "$appname not installed, skipping..."
            continue
        end
    
        if not fileicon test $appname
            sudo fileicon set $appname $file
            set haschanged 1
        end
    end

    if test $haschanged -eq 1
        set files /var/folders/*/*/*/com.apple.dock.iconcache
        if test (count $files) -gt 0
            echo clearing dock icon cache
            rm /var/folders/*/*/*/com.apple.dock.iconcache
        end

        set files /var/folders/*/*/*/com.apple.iconservices*
        if test (count $files) -gt 0
            echo clearing icon service cache
            rm -r /var/folders/*/*/*/com.apple.iconservices*
        end

        echo restarting dock
        killall Dock
    end
end
