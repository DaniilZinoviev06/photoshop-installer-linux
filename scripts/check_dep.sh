#!/bin/bash

source ./scripts/paths.sh
source /etc/os-release

check_dep() {
    $1 --version &> /dev/null || which $1 &> /dev/null
    local res=$?

    if [ $res -eq 0 ]; then
        show_message_ok "Package $1 is installed"
        sleep 1
    else
        show_message_bad "Package $1 is not installed"
        sleep 1

        if [[ "$ID" == "arch" || "$ID" == "ubuntu" ]]; then
            show_question "Your distribution is ${ID}. Download library ${1}?"
        else
            show_message_bad "Install the missing dependencies via the package manager on your distribution!"
            exit
        fi
    fi
}

ver_req() {
    dependencies=("curl" "wine" "winetricks")

    show_message_info "Checking the availability of packages"

    for dep in "${dependencies[@]}"; do
        check_dep $dep
    done

    exit
}


