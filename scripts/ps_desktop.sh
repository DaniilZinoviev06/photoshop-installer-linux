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
    PS_DESKTOP="$(pwd)/photoshop.desktop"

    cp "$(pwd)/photoshop-installer/images/photoshop_icon.png" "$HOME/.local/share/icons/"

    echo "$INFO" > "$PS_DESKTOP"

    show_message_info "Create a shortcut. Enter your password..."

    sudo mv "$PS_DESKTOP" "/usr/share/applications/photoshop.desktop"

    show_message_info "File created in \e[93m/usr/share/applications/photoshop.desktop\e[0m..."
}


