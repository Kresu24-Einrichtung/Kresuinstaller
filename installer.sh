#!/bin/bash

#https://raw.githubusercontent.com/Kresu24-Einrichtung/Kresuinstaller/master/installer.sh
#bash <(curl -s https://raw.githubusercontent.com/Kresu24-Einrichtung/Kresuinstaller/master/installer.sh)

if [[ $EUID -ne 0 ]]; then
  echo "→ Dieser Installer muss mit root oder sudo rechten ausgeführt werden!" 1>&2
  exit 1
fi

# check for curl
if ! [ -x "$(command -v curl)" ]; then
  echo "→ Curl wird für diesen Installer benötgt bitte installiere es mit: `apt install curl -y`"
  exit 1
fi

apt install toilet
toilet -f mono12 -F metal Kresu
echo ""
echo "
██╗░░██╗██████╗░███████╗░██████╗██╗░░░██╗
██║░██╔╝██╔══██╗██╔════╝██╔════╝██║░░░██║
█████═╝░██████╔╝█████╗░░╚█████╗░██║░░░██║
██╔═██╗░██╔══██╗██╔══╝░░░╚═══██╗██║░░░██║
██║░╚██╗██║░░██║███████╗██████╔╝╚██████╔╝
╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═════╝░░╚═════╝░"

echo ""

echo ""


echo "Bitte wähle aus was du machen möchtest:"
echo ""
echo "[1] - Grundinstallation"
echo "[2] - Pterodactyl Installation"
echo "[3] - Installation von PHP 7.4"
echo "[4] - Installation von PHP 8"
echo "[5] - Installation von Apache 2 - Nesting nicht aktiv!"
echo "[6] - Installation von Apache 2 - Nesting aktiv!"
echo "[7] - Installation von Java 8"
echo "[8] - Installation von Java 16"
echo "[9] - Installation von Java 17"
echo "[10] - Installation von Node.JS 16"
echo "[11] - Installation von Nginx Webserver"
echo "[12] - Installation von Docker - Nesting muss Aktiv sein!"
echo "[13] - Minecraft Server Installer"

read number
if [ $number -eq 1 ]; then
echo "Du hast [1] Ausgewählt!"
echo "Bitte beachte folgende Dinge:"
echo "Die Grundinstallation ändert nur die Zeitzone, Updatet den Server und Installiert Sudo, Screen und Htop!"
apt update -y
apt upgrade -y
sudo ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
sudo dpkg-reconfigure -f noninteractive tzdata
apt install sudo screen htop
echo "→ Die Grundinstallation ist abgeschlossen! This Shell Script was made by Kresu | Maxi - Einrichtungsteam Leitung."
echo "Bitte beachte das die Serverconfig noch nicht geändert wurde und der Server einen reboot benötigt!."
elif [ $number -eq 2 ]; then
echo "Du hast [2] Ausgewählt!"
echo "Pterodactyl wird nun Installiert bitte beachte die nachfolgenden anweisungen! - Disclaimer: Der nachfolgende Installer ist nicht von Maxi!"
apt install bash curl
bash <(curl -s https://pterodactyl-installer.se)
elif [ $number -eq 3 ]; then
echo "Du hast [3] Ausgewählt!"
echo "→ PHP (Personal Home Page) in der Version 7.4 wird nun Installiert!"
apt update
apt upgrade -y
apt install ca-certificates apt-transport-https lsb-release gnupg curl nano unzip -y
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update
apt install php7.4 php7.4-cli php7.4-common php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 -y
echo "→ PHP (Personal Home Page) wurde erfolgreich in der Version 7.4 Installiert!"
elif [ $number -eq 4 ]; then
echo "Du hast [4] Ausgewählt!"
echo "→ PHP (Personal Home Page) in der Version 8 wird nun Installiert!"
apt update
apt upgrade -y
apt install ca-certificates apt-transport-https lsb-release gnupg curl nano unzip -y
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt update
apt install php8 php8-cli php8-common php8-curl php8-gd php8-intl php8-json php8-mbstring php8-mysql php8-opcache php8-readline php8-xml php8-xsl php8-zip php8-bz2 libapache2-mod-php8 -y
echo "→ PHP (Personal Home Page) wurde erfolgreich in der Version 8 Installiert!"
elif [ $number -eq 5 ]; then
apt install apache2 -y
sudo sed -i -e 's,PrivateTmp=true,PrivateTmp=false\nNoNewPrivileges=yes,g' /lib/systemd/system/apache2.service
sudo systemctl daemon-reload
sudo systemctl start apache2.service
sudo systemctl status apache2.service
echo "→ Wenn Apache Grün angezeigt ist, hat alles funktioniert, wenn nicht bitte wende dich an den Kresu24 Support!"
elif [ $number -eq 6 ]; then
apt install apache2 -y
systemctl status apache2
echo "→ Wenn Apache Grün angezeigt ist, hat alles funktioniert, wenn nicht bitte wende dich an den Kresu24 Support!"
elif [ $number -eq 7 ]; then
sudo apt update
sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-8-hotspot
echo "→ Java 8 wurde erfolgreich Installiert!"
elif [ $number -eq 8 ]; then
sudo apt update
sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-16-hotspot
echo "→ Java 16 wurde erfolgreich Installiert!"
elif [ $number -eq 9 ]; then
sudo apt update
sudo apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install openjdk-17-jdk
echo "→ Java 17 wurde erfolgreich Installiert!"
elif [ $number -eq 10 ]; then
sudo apt update
sudo apt install curl software-properties-common 
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt install nodejs
node -v
npm -v
echo "→ Node.JS 16 wurde erfolgreich Installiert!"
elif [ $number -eq 11 ]; then
apt update
apt upgrade -y
apt install nginx
systemctl status nginx
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 'Nginx FULL'
sudo ufw enable
echo "→ Nginx Webserver wurde erfolgreich Installiert!"
elif [ $number -eq 12 ]; then
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
echo "→ Docker wurde erfolgreich Installiert!"
elif [ $number -eq 13 ]; then
bash <(curl -s https://raw.githubusercontent.com/Kresu24-Einrichtung/Kresuinstaller/master/installations/minecraft.sh)
fi