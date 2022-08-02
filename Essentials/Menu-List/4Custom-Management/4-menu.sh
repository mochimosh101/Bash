#!/usr/bin/env bash

export A="Install Mochi's Terminal Configs"
export B="Install Mochi's Kitty Terminal Configs"
export C="Install Mochi's Starship Terminal Configs"

printf "I will be helping you with Custom Installation!\n" 
echo -e "What would you like to start with?"
echo -e "   ===============================================
a. | Install Mochi's Terminal Configs            |
b. | Install Mochi's Kitty Terminal Configs      |
c. | Install Mochi's Starship Terminal Configs   |
x. | Exit Menu                                   |
   ===============================================\n"
read -r SELECTION

if [[ $SELECTION == "a" ]]; then

    echo -e "\n$A\n"

elif [[ $SELECTION == "b" ]]; then

    echo -e "\n$B\n"

elif [[ $SELECTION == "c" ]]; then

    echo -e "\n$C\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/4Custom-Management/a-custom.sh
)"
    

elif [[ $SELECTION == "x" ]]; then

    echo -e "\nExiting Custom Management Menu..."
    sleep 1
    exit 0

else [[ $SELECTION != "a|b|c|x" ]]

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option.."
    exit 1

fi