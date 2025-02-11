#!/bin/bash

source ./scripts/general.sh

wine_setup() {
    show_message_info "Сreate files and directories"

    mkdir -p "$WINE_PREF_PATH"
    touch "$WINE_PREF_PATH/winetricks_install.log"

    show_message_info "Select 'Windows 7' in the window that appears"

    sleep 5

    WINEPREFIX="$WINE_PREF_PATH" winecfg
    if [ $? -eq 0 ]; then
        show_message_ok "Winecfg completed successfully"
    else
        show_message_bad "Winecfg failed"
    fi

    sleep 5

    show_message_info "Install the necessary components. Wait..."

    sleep 5

    # vcrun 2005 2017 in theory they should have been there too, but I didn’t notice any difference
    WINEPREFIX="$WINE_PREF_PATH" winetricks --unattended atmlib fontsmooth=rgb gdiplus vcrun2008 vcrun2010 vcrun2012 vcrun2013 msxml3 msxml6 corefonts 2>&1 | tee "$LOG_FILE"
    if [ $? -eq 0 ]; then
        show_message_ok "The command was executed successfully..."
    else
        show_message_bad "The command failed."
    fi

    sleep 5

    show_message_info "The result of the previous command will be written in the ${LOG_FILE} file."
}
