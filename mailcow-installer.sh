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
	whiteMessage "                   MinenIntros Systems                      "
	whiteMessage "        YouTube: https://youtube.com/c/MinenIntros          "
    kekMessage "#/////////////////////////////////////////////////////#"
    whiteMessage "      Mailcow Installer by MinenIntros Systems       "
    whiteMessage "        Version 1.2.6 - Stable - for Debian 9        "
	kekMessage "#/////////////////////////////////////////////////////#"
    greenMessage "Important! Before you install on a Hetzner Cloud server:"
    greenMessage "        https://bit.ly/hetzner-cloud-mailcow            "
    kekMessage "#/////////////////////////////////////////////////////#"
    whiteMessage "                 © MinenIntros Systems              "
    kekMessage "#/////////////////////////////////////////////////////#"
    sleep 3.0


    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    magentaMessage "1.  Start installer"
    magentaMessage "2.  Start uninstaller"
    magentaMessage "3.  Leave installer"
    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    read -p "Which function do you want to trigger?: " mailcow_installer_function

       if [ "$mailcow_installer_function" = "1" ]; then

    clear
    clear
    clear

    greenMessage "Dein Server wird geupdated. Bitte Warten!"
    sleep 2
    apt-get update
    magentaMessage "Der Server wurde erfolgreich geupdated!"
    echo ""
    greenMessage "Dein Server wird geupgradet. Bitte Warten!"
    sleep 2
    apt-get upgrade -y
    magentaMessage "Der Server wurde erfolgreich geupgradet!"
    echo ""
    sleep 2
    clear
    greenMessage "Docker wird installiert"
    curl -sSL https://get.docker.com/ | CHANNEL=stable sh
    systemctl enable docker.service
    systemctl start docker.service
    magentaMessage "Docker erfolgreich installiert"
    echo ""
    greenMessage "Docker Compose wird installiert!"
    curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo ""
    yellowMessage "Folgende Docker Compose Version wurde installiert:"
    docker-compose --version
    echo ""
    magentaMessage "Docker Compose wurde installiert!"
    clear
    clear
    clear
    greenMessage "Mailcow wird jetzt installiert!"
    apt install git -y
    apt purge postfix -y
    netstat -tulpn | grep -E -w '25|80|110|143|443|465|587|993|995'
    umask
    cd /opt
    git clone https://github.com/mailcow/mailcow-dockerized
    cd mailcow-dockerized
    clear
    yellowMessage "Sie müssen gleich ihren FQDN angeben (Hostname)."
    sleep 5.5
    ./generate_config.sh
	sleep 2.0
	docker-compose pull
	docker-compose up -d
    magentaMessage "Mailcow wurde installiert!"
    clear 3.0
    yellowMessage "Wenn Sie einen Reverse-Proxy verwenden möchten, können Sie beispielsweise HTTPS an 127.0.0.1 an Port 8443 und HTTP an 127.0.0.1 an Port 8080 binden."
    whiteMessage "-> nano /opt/mailcow-dockerized/mailcow.conf"
    echo ""
    greenMessage "Vielen Dank für das Nutzen meines Scriptes!"
    sleep 2.5
    exit 0

    fi

   

    if [ "$mailcow_installer_function" = "2" ]; then
magentaMessage "Danger! You are about to uninstall Mailcow!"
yellowMessage "To uninstall write 'uninstall mailcow' in the console."

read -p "-> " mailcow_uninstaller
echo ""

if [ "$mailcow_uninstaller" = "uninstall mailcow" ]; then
yellowMessage "The uninstaller is under development!"
greenMessage "Thanks for use my Script!"
fi

fi
    

    if [ "$mailcow_installer_function" = "3" ]; then
    exit 0
       fi
