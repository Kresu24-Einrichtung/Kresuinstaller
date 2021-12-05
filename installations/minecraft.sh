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
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#Functions

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
apt install toilet
toilet -f mono12 -F metal Kresu

echo ""

echo ""
echo "Minecraft Server Installer:"

echo "[1] - Minecraft Vanilla 1.18"
echo "[2] - Minecraft Spigot 1.18"


read number

if [ $number -eq 1 ]; then
echo "Installation wird ausgeführt, dies kann einen moment dauern! - Bitte beachte das die Installation in dem Verzeichnis sein muss!"
sleep 5
wget "https://launcher.mojang.com/v1/objects/3cf24a8694aca6267883b17d934efacc5e44440d/server.jar"
echo "eula=true">> eula.txt
echo "screen -AmdS Server -d java -Xmx1024M -Xms1024M -jar server.jar nogui">> start.sh
chmod 777 start.sh
bash start.sh
echo "Installation abgeschlossen!"
elif [ $number -eq 2 ]; then
echo "Installation wird ausgeführt, dies kann einen moment dauern! - Bitte beachte das die Installation in dem Verzeichnis sein muss!"
sleep 5
wget "https://download.getbukkit.org/spigot/spigot-1.18.jar"
echo "eula=true">> eula.txt
echo "screen -AmdS Server java -Xmx1024M -Xms1024M -jar spigot-1.18.jar nogui">> start.sh
chmod 777 start.sh
bash start.sh
echo "Installation abgeschlossen!"
fi