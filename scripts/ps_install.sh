#!/bin/bash

source ./scripts/general.sh
source ./scripts/ps_desktop.sh

launcherFunc() {
    show_message_info "Photoshop is starting..."
    notify-send "Photoshop is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$PHOTOSHOP"
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop_2018.tar.xz"
    local ARCHIVE_NAME="photoshop_2018.tar.xz"
    local TAR_SHA256="fcd675e046766f62cbe88cea9ea37a20b1b95efc13c6860263e52bd495eb3075"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAR_SHA256"

    sleep 5

    show_message_info "Photoshop is installing now. It will take a couple of minutes. Wait..."
    notify-send "Photoshop is installing now. It will take a couple of minutes. Wait..."

    sleep 5

    WINEPREFIX="${WINE_PREF_PATH}" wine "${SCRIPT_DOWNLOADS}/setup.exe" /VERYSILENT

    sleep 5

    if [ -f "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop" ]; then
        rm "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop"
    fi

    createDesktopFunc

    sleep 5

    launcherFunc
}
