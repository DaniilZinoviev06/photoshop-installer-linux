#!/bin/bash

source ./scripts/general.sh

INFO="[Desktop Entry]
Version=1.0
Type=Application
Name=Photoshop CC 2018
StartupNotify=true
Comment=Advanced image editing application
Exec=env WINEPREFIX=\"$WINE_PREF_PATH\" wine \"$PHOTOSHOP\"
Icon=$HOME/.local/share/icons/photoshop_icon.png
StartupWMClass=photoshop.exe
"

# StartupWMClass: i spotted this from Gictorbit. Thanks to him for this

createDesktopFunc() {
    cp "$(pwd)/photoshop-installer/images/photoshop_icon.png" "$HOME/.local/share/icons/"

    touch "$HOME/.local/share/applications/photoshop.desktop"

    "$HOME/.local/share/applications/photoshop.desktop" << $INFO

    show_message_info "File created in \e[93m${HOME}/.local/share/applications/\e[0m..."
}


