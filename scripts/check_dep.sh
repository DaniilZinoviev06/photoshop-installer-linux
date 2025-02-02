#!/bin/bash

source ./scripts/paths.sh

check_dep() {
    $1 --version &> /dev/null || which $1 &> /dev/null
    local res=$?

    if [ $res -eq 0 ]; then
        show_message_ok "Package $1 is installed"
        sleep 1
    else
        show_message_bad "Package $1 isnt installed"
        sleep 1
        show_question ""
    fi
}


