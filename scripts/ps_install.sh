#!/bin/bash

source ./scripts/general.sh
source ./scripts/camera_raw.sh
source ./scripts/ps_desktop.sh

launcherFunc() {
    show_message_info "Photoshop is starting..."
    notify-send "Photoshop is starting..."
    WINEPREFIX="$WINE_PREF_PATH" wine "$PHOTOSHOP"
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"
    local ARCHIVE_SETTINGS="https://iusearchbtw.isgood.host/files/Adobe.tar.xz"
    local ARCHIVE_NAME_SETTINGS="Adobe.tar.xz"
    local TAREXE_SHA256="f83ebbf7c23c1ba3578bb853acaf9439c5168da2374a16b5cdb5a8214c29c0a4"
    local SETTINGS_SHA256="1b2f3a6d3537342c676a9eca8e0547ba77180a77c62076831c64d662266d352c"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAREXE_SHA256"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" wine "${SCRIPT_DOWNLOADS}/setup.exe"

    sleep 5

    # settings for photoshop
    installArchiveFunc "$ARCHIVE_NAME_SETTINGS" "$ARCHIVE_SETTINGS" "$SETTINGS_SHA256"

    sleep 5

    mv "${SCRIPT_DOWNLOADS}/Adobe" "${HOME}/photoshop/drive_c/users/$(whoami)/AppData/Roaming/"

    sleep 5

    show_question "Do you want to install the Camera Raw plugin (To open image formats like .NEF, .ARW)? P.S. You can do it later" "y"
    if [ "$enter_res" == "no" ]; then

        show_message_info "OK. Continue without the Camera Raw plugin..."

    else
        show_message_info "OK. Starting to download the Camera Raw plugin..."

        install_cr
    fi

    sleep 5

    if [ -f "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop" ]; then
        rm "$HOME/.local/share/applications/wine/Programs/photoshop/photoshop.desktop"
    fi

    createDesktopFunc

    sleep 5

    launcherFunc
}
