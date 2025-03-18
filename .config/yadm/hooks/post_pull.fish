#! /opt/homebrew/bin/fish

osascript -e 'tell application "Finder" to set desktop picture to alias ((path to pictures folder as text) & "wallpaper.png")'
rm /var/folders/*/*/*/com.apple.dock.iconcache
killall Dock

brew bundle --global
brew cleanup
brew update
brew upgrade
brew bundle dump --global
yadm add ~/.Brewfile
yadm commit -m "Update Brewfile"
yadm push

# Update:
# - Check app bundles / install
#
# Install / Bootstrap:
# - Install YADM + pull branch
# - Install Homebrew + packages
#
#
# check_app() {
#     if [ -d "/Applications/$1.app" ]; then
#         echo "✅ $1 is already installed."
#         return
#     else
#         echo "‼️ $1 is not installed. Get it here: $2"
#         open "$2"
#     fi
# }
#
# # TODO: these won't stay up to date...
# check_app "Alfred 5" "https://cachefly.alfredapp.com/Alfred_5.5_2257.dmg"
#
# check_app Contexts "https://contexts.co/releases/Contexts-3.9.0.dmg"
#
# check_app BatFi "https://app.gumroad.com/d/9ed109a120b9e2ec59f0dc0c80ccb66f"
#
# check_app Firefox "https://www.mozilla.org/firefox/download/thanks/"
#
# check_app Plexamp "https://plexamp.plex.tv/plexamp.plex.tv/desktop/Plexamp-4.11.1-x64.dmg"
#
# check_app Plex "https://downloads.plex.tv/plex-desktop/1.98.2.208-0cf517e0/macos/Plex-1.98.2.208-0cf517e0-universal.zip"
#
# check_app Obsidian "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/Obsidian-1.6.7.dmg"
#
# check_app Anki "https://github.com/ankitects/anki/releases/download/24.06.3/anki-24.06.3-mac-intel-qt6.dmg"
#
# check_app HEY "https://hey-desktop.s3.amazonaws.com/HEY-arm64.dmg"
