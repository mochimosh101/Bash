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

    echo -e "$A\n"
    

fi