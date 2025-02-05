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
            if [ -f "${SCRIPT_DOWNLOADS}/$1" ]; then
                show_message_ok "File uploaded"

                local file_checksum=$(sha256sum "${SCRIPT_DOWNLOADS}/$1" | awk '{print $1}')

                show_message_info "sha256..."

                if [ $file_checksum == $3 ]; then
                    show_message_ok "Checksum ok..."
                    return 0
                else
                    show_message_bad "Checksum problem. Re-try..."
                    rm "${SCRIPT_DOWNLOADS}/$1"
                fi
            else
                curl -o "${SCRIPT_DOWNLOADS}/$1" "$2"
            fi
            ((count++))
        fi
    done

    tar -xJvf "${SCRIPT_DOWNLOADS}/$ARCHIVE_NAME" -C "${SCRIPT_DOWNLOADS}"

    if [[ $? -ne 0 ]]; then
        show_message_error "Error when opening archive. Exit..."
        exit
    fi
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"
    local EXE_SHA256="f21c9e793077b618fafa2191b7312c7532fad8c1c062e91e237d98b4faaa078b"
    #   local SETTINGS_SHA256=""

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchivesFunc "$ARCHIVE_NAME" "$ARCHIVE" "$EXE_SHA256"

    sleep 5

    show_message_info "Unpacking the archive. It may take time"
    echo "-----------------------------"
    echo "$(pwd)/photoshop.tar.xz"
    echo "-----------------------------"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" wine "${SCRIPT_DOWNLOADS}/setup.exe"

    sleep 5

    # settings for photoshop
    installArchivesFunc "Adobe.tar.xz" "https://iusearchbtw.isgood.host/files/Adobe.tar.xz"

    sleep 5

    mv "${SCRIPT_DOWNLOADS}/Adobe" "${HOME}/photoshop/drive_c/users/$(whoami)/AppData/Roaming/"
    WINEPREFIX="$WINE_PREF_PATH" wine "$PHOTOSHOP"
}
