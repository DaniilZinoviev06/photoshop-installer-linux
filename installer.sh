#!/bin/bash

source scripts/conf_wine.sh
source scripts/ps_install.sh
source scripts/paths.sh

ver_req() {

}

main() {

    wine_setup
    sleep 5
    installPSFunc
}

main
