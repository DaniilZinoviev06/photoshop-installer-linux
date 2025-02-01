#!/bin/bash

source ./conf_wine.sh
source ./ps_install.sh
source ./paths.sh

main() {
    wine_setup
    sleep 5
    installPSFunc
}

main
