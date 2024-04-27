#!/usr/bin/env bash

export A="Update the full distro"

################
################

clear
printf "I will be helping you with Distro Management!\n" 
echo -e "What would you like to start with?"
echo -e "   ============================
a. | Update the full distro   |
x. | Exit Menu                |
   ============================\n"
read -r SELECTION

if [[ $SELECTION == "a" ]]; then

    echo -e "\n$A\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/2-Distro-Management/Distro-Essentials/a-distro.sh)"

else

    echo "EERRROOORRRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/1-User-Management/2-menu.sh)"

fi
