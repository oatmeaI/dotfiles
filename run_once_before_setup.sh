#! /bin/bash

# Install Homebrew
if ! [ -x "$(command -v git)" ]; then
    echo "Homebrew is not installed, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    ) >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed, skipping..."
fi

check_app() {
    if [ -d "/Applications/$1.app" ]; then
        echo "✅ $1 is already installed."
        return
    else
        echo "‼️ $1 is not installed. Get it here: $2"
        open "$2"
    fi
}

check_app "Alfred 5" "https://cachefly.alfredapp.com/Alfred_5.5_2257.dmg"

check_app "Contexts" "https://contexts.co/releases/Contexts-3.9.0.dmg"

check_app "BatFi" "https://app.gumroad.com/d/9ed109a120b9e2ec59f0dc0c80ccb66f"

check_app "Firefox" "https://www.mozilla.org/firefox/download/thanks/"
