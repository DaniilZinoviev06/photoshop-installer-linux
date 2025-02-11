#!/bin/bash

source ./scripts/check_dep.sh
source ./scripts/conf_wine.sh
source ./scripts/ps_install.sh


source ./scripts/general.sh

main() {
    while true; do

        echo -e "\e[94m######"
        echo -e "#     # #    #  ####  #####  ####   ####  #    #  ####  #####"
        echo -e "#     # #    # #    #   #   #    # #      #    # #    # #    #"
        echo -e "######  ###### #    #   #   #    #  ####  ###### #    # #    #"
        echo -e "#       #    # #    #   #   #    #      # #    # #    # #####"
        echo -e "#       #    # #    #   #   #    # #    # #    # #    # #"
        echo -e "#       #    #  ####    #    ####   ####  #    #  ####  #\e[0m"


        echo -e "\n \e[91m!\e[0m \e[92mMake sure you have the following dependencies installed:\e[0m"
        echo -e " \e[34m-\e[0m \e[93m wine \e[0m"
        echo -e " \e[34m-\e[0m \e[93m winetricks \e[0m"
        echo -e " \e[34m-\e[0m \e[93m curl \e[0m"

        echo -e "\n \e[91m!\e[0m \e[92mDo not change the location of the generated prefix\e[0m"

        echo -e "\n \e[91m!\e[0m \e[92mThere are useful links in paragraph 3('info') :)\e[0m"

        echo -e "\n\e[97m-------------------------------------------------------\e[0m"

        echo -e "\n\e[34m|\e[0m \e[92m1 - Install Photoshop\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m2 - Install Camera Raw\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m3 - Info\e[0m\n"
        echo -e "\e[34m|\e[0m \e[92m4 - Delete Photoshop\e[0m\n"

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

            4)
                echo "delete"
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
