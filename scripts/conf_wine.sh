#!/bin/bash

source ./scripts/paths.sh

wine_setup_dir() {
    mkdir -p "$WINE_PREF_PATH"
    touch "$WINE_PREF_PATH/winetricks_install.log"
    LOG_FILE="$WINE_PREF_PATH/winetricks_install.log"
}

wine_setup() {
    show_message_info "Сreate files and directories"
    wine_setup_dir
    show_message_info "Select 'Windows 7' in the window that appears"
    sleep 5
    WINEPREFIX="$WINE_PREF_PATH" winecfg
    sleep 5
    show_message_info "Сonfiguration setting"
    sleep 5
    WINEPREFIX="$WINE_PREF_PATH" winetricks --unattended corefonts fontsmooth=rgb gdiplus atmlib msxml3 msxml6 vcrun2008 vcrun2010 vcrun2012 vcrun2013 vcrun2015 2>&1 | tee "$LOG_FILE"
    sleep 5
    show_message_info "The result of the previous command will be written in the ${LOG_FILE} file"
}
