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

check_if_dir() {
    echo "→ Bitte gebe ein Verzeichnis an:"
    read DEST
    if [ -d "$DEST" ]; then 
        if [ -L "$DEST" ]; then
            # It is a symbolic links #
            echo "Symbolic link found and doing something on it ..."
        else
            # It is a directory #
            echo "Directory found and doing nothing here ..."
        fi
    fi
}
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "Minecraft Server Installer:"

echo "[1] - Minecraft Vanilla 1.18"
echo "[2] - Minecraft Spigot 1.18"


read number

if [ $number -eq 1 ]; then
echo "Installation wird ausgeführt, dies kann einen moment dauern!"
check_if_dir()
sudo wget "https://launcher.mojang.com/v1/objects/3cf24a8694aca6267883b17d934efacc5e44440d/server.jar"
echo "eule=true">> eula.txt
echo "java -Xmx1024M -Xms1024M -jar server.jar nogui">> start.sh
sudo chmod 777 start.sh
echo "Installation abgeschlossen!"
fi