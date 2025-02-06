#!/bin/bash

source ./scripts/paths.sh

# 2 params: archive name and url
installArchiveFunc() {
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

                    tar -xJvf "${SCRIPT_DOWNLOADS}/$1" -C "${SCRIPT_DOWNLOADS}"

                    if [[ $? -ne 0 ]]; then
                        show_message_error "Error when opening archive. Exit..."
                        exit
                    fi

                    break
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
}

installPSFunc() {
    local ARCHIVE="https://iusearchbtw.isgood.host/files/photoshop.tar.xz"
    local ARCHIVE_NAME="photoshop.tar.xz"
    local TAREXE_SHA256="f83ebbf7c23c1ba3578bb853acaf9439c5168da2374a16b5cdb5a8214c29c0a4"
    local SETTINGS_SHA256="1b2f3a6d3537342c676a9eca8e0547ba77180a77c62076831c64d662266d352c"

    mkdir -p "$SCRIPT_DOWNLOADS"

    installArchiveFunc "$ARCHIVE_NAME" "$ARCHIVE" "$TAREXE_SHA256"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" wine "${SCRIPT_DOWNLOADS}/setup.exe"

    sleep 5

    # settings for photoshop
    installArchiveFunc "Adobe.tar.xz" "https://iusearchbtw.isgood.host/files/Adobe.tar.xz" "$SETTINGS_SHA256"

    sleep 5

    mv "${SCRIPT_DOWNLOADS}/Adobe" "${HOME}/photoshop/drive_c/users/$(whoami)/AppData/Roaming/"
    WINEPREFIX="$WINE_PREF_PATH" wine "$PHOTOSHOP"
}
