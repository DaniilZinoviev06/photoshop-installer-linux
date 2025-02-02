#!/bin/bash

WINE_PREF_PATH="$HOME/photoshop"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
PLAIN="\e[0m"

show_message_bad() {
    echo -e "${RED}[ bad ]${PLAIN} $1"
}

show_message_ok() {
    echo -e "${GREEN}[ ok ]${PLAIN} $1"
}

show_message_info() {
    echo -e "${YELLOW}[ info ]${PLAIN} $1"
}

show_question() {
    echo -e "${BLUE}[ question ]${PLAIN} $1"

}
