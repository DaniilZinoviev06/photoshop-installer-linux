#!/bin/bash

WINE_PREF_PATH="$HOME/photoshop"
# for exe
SCRIPT_DOWNLOADS="$(pwd)/script_downloads"

PHOTOSHOP="${HOME}/photoshop/drive_c/Program Files (x86)/photoshop/Photoshop.exe"
LOG_FILE="$WINE_PREF_PATH/winetricks_install.log"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PLAIN="\e[0m"

show_message_bad() {
    echo "-----------------------------"
    echo -e "${RED}[ bad ]${PLAIN} $1"
    echo "-----------------------------"
}

show_message_ok() {
    echo "-----------------------------"
    echo -e "${GREEN}[ ok ]${PLAIN} $1"
    echo "-----------------------------"
}

show_message_info() {
    echo "-----------------------------"
    echo -e "${YELLOW}[ info ]${PLAIN} $1"
    echo "-----------------------------"
}

show_question() {
    local default_display
    local no_expr=$(locale noexpr)
    local yes_expr=$(locale yesexpr)

    if [[ "$2" == "y" ]]; then
        default_display="Y/n"
    else
        default_display="y/N"
    fi

    local enter=""
    echo -e "${BLUE}[ question ]${PLAIN} "$1" [$default_display] "
    read -r enter

    if [[ -z "$enter" ]]; then
        enter="$2"
    fi

    if [[ "$enter" =~ $no_expr ]]; then
        enter_res="no"
    elif [[ "$enter" =~ $yes_expr ]]; then
        enter_res="yes"
    else
        enter_res="invalid"
    fi
}
