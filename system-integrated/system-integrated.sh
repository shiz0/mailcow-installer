#!/bin/bash


function magentaMessage() {
echo -e "\\033[35;1m${@}\033[0m"
}

function greenMessage() {
	echo -e "\\033[32;1m${@}\033[0m"
}


function kekMessage() {
	echo -e "\\033[36;1m${@}\033[0m"
}

function yellowMessage() {
	echo -e "\\033[33;1m${@}\033[0m"
}

function whiteMessage() {
	echo -e "\033[0;37m${@}\033[0m"
}

function grayMessage() {
  echo -e "\033[0;30m${@}\033[0m"
}
    clear
    sleep 1.0
    kekMessage "#/////////////////////////////////////////////////////#"
	yellowMessage "                   MinenIntros Systems                      "
	yellowMessage "        YouTube: https://youtube.com/c/MinenIntros          "
    kekMessage "#/////////////////////////////////////////////////////#"
    sleep 3.0


    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    yellowMessage "Here you can deposit the Mailcow installer as a direct command on your server."
    echo ""
    magentaMessage "1) Activate"
    magentaMessage "2) Deactivate"
    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    read -p "Which function do you want to trigger?: " mailcow_installer_function

    if [ "$mailcow_installer_function" = "1" ]; then
        wget https://get.install-helper.de/mailcow-installer/system-integrated/activate.sh
        chmod 755 activate.sh 
        sed -i -e 's/\r$//' activate.sh
        ./activate.sh
        rm -r activate.sh
        clear
        echo ""
        yellowMessage "To use the Mailcow installer, execute the following command:"
        whiteMessage "Command:  mailcow-installer"
        echo ""
	exit 0

    if [ "$mailcow_installer_function" = "2" ]; then
        wget https://get.install-helper.de/mailcow-installer/system-integrated/deactivate.sh
        chmod 755 deactivate.sh 
        sed -i -e 's/\r$//' deactivate.sh
        ./deactivate.sh
        rm -r deactivate.sh
        clear
        echo ""
        yellowMessage "The command was successfully deactivated."
        echo ""
        exit 0
    fi

