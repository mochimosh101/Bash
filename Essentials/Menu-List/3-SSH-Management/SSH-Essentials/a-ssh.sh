#!/usr/bin/env bash
############## Menu 3 #####################

export "USERHOME=$(echo -e "$HOME")"
export "CURRENTUSER"="$(echo -e "$USER")"
export "LINE===================================================="

################
################

mkdir "$USERHOME"/.ssh
chmod 0700 "$USERHOME"/.ssh
echo "Making your .ssh folder..."
sleep 2
echo "MochiBot has successfully created .ssh folder into your home directory!"
sleep 1
echo "$LINE"
ls -al "$USERHOME"
echo "$LINE"

echo -e "\nWould you like to choose another option? [Y/n]: "
read -r OPTION

if [[ $OPTION != "n" ]]; then

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/3-menu.sh)"

else

    exit 0

fi