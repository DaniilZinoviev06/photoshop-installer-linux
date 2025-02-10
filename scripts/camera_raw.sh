#!/bin/bash

source ./scripts/general.sh

source ./scripts/ps_desktop.sh

install_cr() {
    local ARCHIVE_CR="https://iusearchbtw.isgood.host/files/camera_raw_12.tar.xz"
    local ARCHIVE_NAME_CR="camera_raw_12.tar.xz"
    local CR_SHA256="d290554ea3984a7ea98ffeb86f2fab7d6f25b525c84a303613c7307d5ca169b6"

    sleep 5

    installArchiveFunc "$ARCHIVE_NAME_CR" "$ARCHIVE_CR" "$CR_SHA256"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" wine "${SCRIPT_DOWNLOADS}/CameraRaw_12_2_1.exe"

    sleep 5
}


check_ps() {
    if ([ -d "$PHOTOSHOP" ] && [ -d "$WINE_PREF_PATH" ]); then
        show_message_ok "Photoshop is already installed..."
    else
        show_message_bad "First install photoshop..."
        exit
    fi
}

cr_installer() {
    check_ps

    sleep 5

    show_message_info "OK. Starting to download the Camera Raw plugin..."

    sleep 5

    install_cr
}
