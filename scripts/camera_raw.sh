#!/bin/bash



check_ps() {

}

cr_installer() {
    check_ps

    sleep 5

    show_message_info "OK. Starting to download the Camera Raw plugin..."

    sleep 5

    installArchiveFunc "$ARCHIVE_NAME_CR" "$ARCHIVE_CR" "$CR_SHA256"
}
