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

    tar -xJvf "$(pwd)/$ARCHIVE_NAME" -C "$(pwd)"

    if [[ $? -ne 0 ]]; then
        show_message_error "Error when opening archive. Exit..."
        exit
    fi
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"

    installArchivesFunc "$ARCHIVE_NAME" "$ARCHIVE"

    sleep 5

    show_message_info "Unpacking the archive. It may take time"
    echo "-----------------------------"
    echo "$(pwd)/photoshop.tar.xz"
    echo "-----------------------------"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" wine "$(pwd)/setup.exe"

    sleep 5

    # settings for photoshop
    installArchivesFunc "Adobe.tar.xz" "https://iusearchbtw.isgood.host/files/Adobe.tar.xz"

    sleep 5

    mv "$(pwd)/Adobe" "${HOME}/photoshop/drive_c/users/$(whoami)/AppData/Roaming/"
    WINEPREFIX=~/photoshop wine "${HOME}/photoshop/drive_c/Program Files (x86)/photoshop/Photoshop.exe"
}
