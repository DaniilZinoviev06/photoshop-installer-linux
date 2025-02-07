#!/bin/bash

source ./scripts/paths.sh
source /etc/os-release

check_arch() {
    arch="$(getconf LONG_BIT)"
    if [ $arch != "64" ]; then
        show_message_bad "Your distribution is not 64-bit. Exit..."
        exit
    else
        show_message_ok "All is well. Continue..."
    fi
}

check_dep() {
    $1 --version &> /dev/null || which $1 &> /dev/null

    local res=$?
    declare -A pkg_managers

    if [ $res -eq 0 ]; then
        show_message_ok "Package $1 is installed"
        sleep 1
    else
        show_message_bad "Package $1 is not installed"
        sleep 1

        if [[ "$ID" == "arch" || "$ID" == "ubuntu" ]]; then
            show_question "Your distribution is ${ID}. Download ${1} library?" "y"
            if [ "$enter_res" == "no" ]; then
                sleep 3
                show_message_bad "The program is completed."
                exit
            else
                pkg_managers=( ["arch"]="pacman -S" ["ubuntu"]="apt install" )

                if [[ -v pkg_managers["$ID"] ]]; then
                    p_manager=${pkg_managers["$ID"]}
                    sudo $p_manager $1
                fi
            fi
        else
            show_message_bad "Install the missing dependencies(${1}) via the package manager on your distribution! Then re-run the script."
            exit
        fi
    fi
}

ver_req() {
    show_message_info "Checking the OS arch"
    check_arch

    sleep 2

    dependencies=("curl" "wine" "winetricks")

    show_message_info "Checking the availability of packages"

    for dep in "${dependencies[@]}"; do
        check_dep $dep
    done
}


