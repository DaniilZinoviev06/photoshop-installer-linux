#!/bin/bash

source ./scripts/conf_wine.sh
source ./scripts/ps_install.sh
source ./scripts/paths.sh
source ./scripts/check_dep.sh

main() {
    while true; do

cat <<< "
/// (\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)
/// (/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)
/// (\o/)                                                                      (\o/)
/// (/|\)                                                                      (/|\)
/// (\o/)    ######                                                            (\o/)
/// (/|\)    #     # #    #  ####  #####  ####   ####  #    #  ####  #####     (/|\)
/// (\o/)    #     # #    # #    #   #   #    # #      #    # #    # #    #    (\o/)
/// (/|\)    ######  ###### #    #   #   #    #  ####  ###### #    # #    #    (/|\)
/// (\o/)    #       #    # #    #   #   #    #      # #    # #    # #####     (\o/)
/// (/|\)    #       #    # #    #   #   #    # #    # #    # #    # #         (/|\)
/// (\o/)    #       #    #  ####    #    ####   ####  #    #  ####  #         (\o/)
/// (/|\)                                                                      (/|\)
/// (\o/)                                                                      (\o/)
/// (/|\)    # #    #  ####  #####   ##   #      #      ###### #####           (/|\)
/// (\o/)    # ##   # #        #    #  #  #      #      #      #    #          (\o/)
/// (/|\)    # # #  #  ####    #   #    # #      #      #####  #    #          (/|\)
/// (\o/)    # #  # #      #   #   ###### #      #      #      #####           (\o/)
/// (/|\)    # #   ## #    #   #   #    # #      #      #      #   #           (/|\)
/// (\o/)    # #    #  ####    #   #    # ###### ###### ###### #    #          (\o/)
/// (/|\)                                                                      (/|\)
/// (\o/)                                                                      (\o/)
/// (/|\)                                                                      (/|\)
/// (\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)(\o/)
/// (/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)(/|\)
"

        echo -e "\n\e[34m|\e[0m 1 - Install Photoshop\n"
        echo -e "\e[34m|\e[0m 2 - Install Camera Raw\n"
        echo -e "\e[34m|\e[0m 3 - Info\n"
        read -p "Enter: " choice

        case $choice in
            1)
                ver_req

                sleep 5

                wine_setup

                sleep 5

                installPSFunc
            ;;

            2)
                cr_installer
            ;;

            3)
                while true; do
                    clear
                    echo -e "Author: "

                    echo -e "\n\e[34m|\e[0m 1 - Back\n"
                    read -p "Enter: " choice

                    case $choice in
                        1)
                            clear
                            break
                        ;;

                        *)
                            clear
                            echo -e "\n-------------------------"
                            echo "Bad enter..."
                            echo "-------------------------"
                        ;;
                    esac

                done
            ;;

            *)
                clear
                echo -e "\n-------------------------"
                echo "Bad enter..."
                echo "-------------------------"
            ;;

        esac

    done
}

main
