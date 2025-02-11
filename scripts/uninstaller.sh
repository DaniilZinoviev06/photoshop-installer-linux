#!/bin/bash

source ./scripts/general.sh

deleteFunc(){
    if [ -d "$1" ]; then
        show_message_ok "$1 found"
        show_message_info "Uninstalling \e[93m$2\e[0m"
        rm -r "$1" || show_message_bad "Couldn't remove $1"
    else
        show_message_bad "$1 not found"
    fi
}

uninstallFunc() {
    show_question "Do you really want to remove Photoshop?" "N"
    if [ "$enter_res" == "no" ]; then
        show_message_ok "Ok. Do not remove photoshop"
    else
        show_message_ok "Ok. Uninstalling Photoshop"

        deleteFunc "$HOME/photoshop" "Prefix path"
        deleteFunc "/home/$USER/.local/share/applications" "Shortcut"
        deleteFunc "/home/$USER/.local/share/icons/photoshop_icon.png" "Icon"
    fi
}
