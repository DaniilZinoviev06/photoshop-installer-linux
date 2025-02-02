#!/bin/bash

source ./scripts/conf_wine.sh
source ./scripts/ps_install.sh
source ./scripts/paths.sh
source ./scripts/check_dep.sh

ver_req() {
    dependencies=("curl" "wine" "winetricks")

    show_message_info "Checking the availability of packages"

    for dep in "${dependencies[@]}"; do
        check_dep $dep
    done

    exit
}

main() {
    ver_req

    sleep 5

    wine_setup

    sleep 5

    installPSFunc
}

main
