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

    sudo touch "/home/$USER/.local/share/applications/photoshop.desktop"

    show_message_info "File created in \e[93m/home/$USER/.local/share/applications/\e[0m..."
}


