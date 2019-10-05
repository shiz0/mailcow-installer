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
<<<<<<< HEAD
    yellowMessage "        Version 1.2.8 - Beta - for Debian 9        "
	kekMessage "#/////////////////////////////////////////////////////#"
=======
    yellowMessage "        Version 1.2.7 - Beta - for Debian 9        "
    kekMessage "#/////////////////////////////////////////////////////#"
    greenMessage "Important! Before you install on a Hetzner Cloud server:"
    greenMessage "        https://bit.ly/hetzner-cloud-mailcow            "
    kekMessage "#/////////////////////////////////////////////////////#"
>>>>>>> c7f715d07240edafc2dfb0b7a8000b283a89b007
    greenMessage "        New: Roundcube installer for mailcow         "
    kekMessage "#/////////////////////////////////////////////////////#"
    whiteMessage "                 © MinenIntros Systems              "
    kekMessage "#/////////////////////////////////////////////////////#"
    sleep 3.0


    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    magentaMessage "1.  Start installer"
    magentaMessage "2.  Start uninstaller"
    magentaMessage "3.  Install roundcube to mailcow"
    magentaMessage "4.  Leave installer"
    echo ""
    whiteMessage "______________________________________________________"
    echo ""
    read -p "Which function do you want to trigger?: " mailcow_installer_function

       if [ "$mailcow_installer_function" = "1" ]; then

    clear
    clear
    clear

    greenMessage "Your server is being updated. Please wait!"
    sleep 2
    apt-get update
    magentaMessage "The server was successfully updated!"
    echo ""
    greenMessage "Your server will be upgraded. Please wait!"
    sleep 2
    apt-get upgrade -y
    magentaMessage "The server has been successfully upgraded!"
    echo ""
    sleep 2
    clear
    greenMessage "Docker becomes installed"
    curl -sSL https://get.docker.com/ | CHANNEL=stable sh
    systemctl enable docker.service
    systemctl start docker.service
    magentaMessage "Docker successfully installed"
    echo ""
    greenMessage "Docker Compose becomes installed"
    curl -L https://github.com/docker/compose/releases/download/$(curl -Ls https://www.servercow.de/docker-compose/latest.php)/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo ""
    yellowMessage "The following Docker Compose version has been installed:"
    docker-compose --version
    echo ""
    magentaMessage "Docker Compose has been installed!"
    clear
    clear
    clear
    greenMessage "Mailcow becomes installed!"
    apt install git -y
    apt purge postfix -y
    netstat -tulpn | grep -E -w '25|80|110|143|443|465|587|993|995'
    umask
    cd /opt
    git clone https://github.com/mailcow/mailcow-dockerized
    cd mailcow-dockerized
    clear
    yellowMessage "You must enter your FQDN immediately (host name)."
    sleep 5.5
    ./generate_config.sh
	sleep 2.0
	docker-compose pull
	docker-compose up -d
    magentaMessage "Mailcow installed!"
    clear
    echo ""
    whiteMessage "German:"
    yellowMessage "Wenn Sie einen Reverse-Proxy verwenden möchten, können Sie beispielsweise HTTPS an 127.0.0.1 an Port 8443 und HTTP an 127.0.0.1 an Port 8080 binden."
    whiteMessage "-> nano /opt/mailcow-dockerized/mailcow.conf"
    echo ""
    whiteMessage "English"
    yellowMessage "Wenn Sie einen Reverse-Proxy verwenden möchten, können Sie beispielsweise HTTPS an 127.0.0.1 an Port 8443 und HTTP an 127.0.0.1 an Port 8080 binden."
    whiteMessage "-> nano /opt/mailcow-dockerized/mailcow.conf"
    echo ""
    greenMessage "Thanks for using my script!"
    echo ""
    whiteMessage "Webinterface: https://fqdn.domain.tld"
    whiteMessage "Username: admin"
    whiteMessage "Password: moohoo (Change this!)"
    sleep 2.5
    echo ""
    exit 0

    fi

    if [ "$mailcow_installer_function" = "2" ]; then
    magentaMessage "Danger! You are about to uninstall Mailcow!"
    yellowMessage "To uninstall write 'uninstall mailcow' in the console."

    read -p "-> " mailcow_uninstaller
    echo ""

    if [ "$mailcow_uninstaller" = "uninstall mailcow" ]; then
    cd /opt/mailcow-dockerized/
    docker-compose down -v --rmi all --remove-orphans
    rm -r /opt/mailcow-dockerized/
    rm -r /opt/containerd/
    sleep 2.5
    clear
    yellowMessage "Mailcow uninstalled!"
    greenMessage "Thanks for use my Script!"
    sleep 5.0    
    exit 0
    fi

    fi
    
    if [ "$mailcow_installer_function" = "3" ]; then
    greenMessage "Your server is being updated. Please wait!"
    sleep 2
    apt-get update
    magentaMessage "The server was successfully updated!"
    echo ""
    greenMessage "Your server will be upgraded. Please wait!"
    sleep 2
    apt-get upgrade -y
    magentaMessage "The server has been successfully upgraded!"
    echo ""
    cd /opt/mailcow-dockerized/data/web/
    wget -O - https://github.com/roundcube/roundcubemail/releases/download/1.4-rc2/roundcubemail-1.4-rc2-complete.tar.gz | tar xfvz -
    mv roundcubemail-1.4-rc2/ rc
    chown -R root: rc/
    wget https://get.install-helper.de/mailcow-installer/roundcube/config-roundcube.zip
    apt install unzip zip -y
    unzip config-roundcube.zip
    rm -r config-roundcube.zip
    mv config-roundcube.php config.inc.php
    mv config.inc.php rc/config/
    clear

    echo ""
    yellowMessage "Roundcube installed!"
    echo ""
    magentaMessage "Important note!"
    yellowMessage "You must now complete the installation at: https://subdomain.domain.tld/rc/install/"
    echo ""
    whiteMessage "After completing the installation, execute the following command: rm -r /opt/mailcow-dockerized/data/web/rc/installer"
    echo ""
    greenMessage "Thanks for use my Script!"
    sleep 5.0
    
    exit 0
       fi

    if [ "$mailcow_installer_function" = "4" ]; then
    exit 0
       fi
