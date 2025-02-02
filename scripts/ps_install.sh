#!/bin/bash

source ./scripts/paths.sh

installArchivesFunc() {

}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"

    show_message_info "Download the archive. It may take time"
    curl -o "$HOME/Загрузки/$ARCHIVE_NAME" "$ARCHIVE"

    show_message_info "Unpacking the archive. It may take time"
    tar -xJvf "$HOME/Загрузки/$ARCHIVE_NAME" -C "$HOME/Загрузки/"

    WINEPREFIX="$WINE_PREF_PATH" wine "$HOME/Загрузки/setup.exe"

    sleep 5

    # settings for photoshop
    curl -o "$HOME/Загрузки/Adobe.tar.xz" "https://iusearchbtw.isgood.host/files/Adobe.tar.xz"
    tar -xJvf "$HOME/Загрузки/Adobe.tar.xz" -C "$HOME/Загрузки/"
    mv "$HOME/Загрузки/Adobe" "/home/daniil/photoshop/drive_c/users/daniil/AppData/Roaming/"
    WINEPREFIX=~/photoshop wine "/home/daniil/photoshop/drive_c/Program Files (x86)/photoshop/Photoshop.exe"
}
