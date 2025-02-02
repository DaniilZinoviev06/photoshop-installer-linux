#!/bin/bash

source ./scripts/conf_wine.sh
source ./scripts/ps_install.sh
source ./scripts/paths.sh
source ./scripts/check_dep.sh

main() {
    ver_req

    sleep 5

    wine_setup

    sleep 5

    installPSFunc
}

main
