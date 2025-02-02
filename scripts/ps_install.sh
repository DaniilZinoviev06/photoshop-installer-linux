#!/bin/bash

source ./scripts/paths.sh

# 2 params: archive name and url
installArchivesFunc() {
    local count=0
    show_message_info "Download the archive. It may take time"

    while true; do
        if [ $count -ge 5 ]; then
            show_message_bad "Failed to upload file $1"
            exit
        else
            if [ -f "$(pwd)/$1" ];then
                show_message_ok "File uploaded"
                return 0
            else
                curl -o "$(pwd)/$1" "$2"
            fi
            ((count++))
        fi
    done
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"

    installArchivesFunc "$ARCHIVE_NAME" "$ARCHIVE"

    sleep 5

    show_message_info "Unpacking the archive. It may take time"
    tar -xJvf "$(pwd)/$1" -C "$pwd"

    WINEPREFIX="$WINE_PREF_PATH" wine "$(pwd)/setup.exe"

    sleep 5

    # settings for photoshop
    curl -o "$HOME/Загрузки/Adobe.tar.xz" "https://iusearchbtw.isgood.host/files/Adobe.tar.xz"
    tar -xJvf "$HOME/Загрузки/Adobe.tar.xz" -C "$HOME/Загрузки/"
    mv "$HOME/Загрузки/Adobe" "${HOME}/photoshop/drive_c/users/daniil/AppData/Roaming/"
    WINEPREFIX=~/photoshop wine "${HOME}/photoshop/drive_c/Program Files (x86)/photoshop/Photoshop.exe"
}
