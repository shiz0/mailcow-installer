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
    yellowMessage "      Mailcow Installer by MinenIntros Systems       "
    yellowMessage "        Version 1.0 - Stable - for Debian 9          "
	kekMessage "#/////////////////////////////////////////////////////#"
    sleep 3.0


    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    magentaMessage "1.  Starte Installer"
    magentaMessage "2.  Verlasse Installer"
    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    read -p "Welche Funktion möchtest du triggern?: " num

       if [ "$num" = "1" ]; then

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

       if [ "$num" = "2" ]; then
    exit 0
       fi    
