#!/bin/bash

source ./scripts/general.sh

uninstallFunc() {
    show_qustion "Do you really want to remove Photoshop?" "N"
    if [ $enter_res == "no" ]; then
        show_message_ok "Ok. Do not remove photoshop"
    else
        show_message_ok "Ok. Uninstalling Photoshop"
    fi
}
