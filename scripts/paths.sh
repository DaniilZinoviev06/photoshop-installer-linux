#!/bin/bash

WINE_PREF_PATH="$HOME/photoshop"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PLAIN="\e[0m"

show_message_bad() {
    echo -e "${RED}[ bad ]${PLAIN} $1\n"
}

show_message_ok() {
    echo -e "${GREEN}[ ok ]${PLAIN} $1\n"
}

show_message_info() {
    echo -e "${YELLOW}[ info ]${PLAIN} $1\n"
}

show_question() {
    enter_res=""
    echo -e "${BLUE}[ question ]${PLAIN} $1 [y/n] "
    read -r enter
    if [[ "$enter" =~ $(locale noexpr) ]]; then
        enter_res="no"
    else
        enter_res="yes"
    fi
}
