#!/usr/bin/env bash

export "LINE======================================================================================="
readonly LINE

export "LINE1======================================================================================="
readonly LINE1

################
################

clear
echo "Please note that this will only work with apt package manager"
sleep 2
echo -e "Would install Mochi's Kitty Terminal Configs (Y/n)"
echo -e "\n$LINE1\nNote: This will not work if you don't have a DISPLAY environment or Desktop View\n$LINE1\n"
sleep 1
read -r USERINPUT
sudo echo

if [[ "$USERINPUT" != "n" ]]; then

    echo -e "\nMochibot will now be installing kitty packages\n
    This could take a while...\n"
    sudo apt update; sudo apt upgrade -y
    curl -sS https://starship.rs/install.sh | sh
    sudo apt install kitty -y
    
    wget -P "$HOME"/.local/share/fonts/caskaydia/ https://github.com/mochimosh101/Prettier-Terminal/raw/main/My-Terminal/kitty/CascadiaCode-Fonts/Caskaydia-Cove-Nerd-Font-Complete-Mono-Windows-Compatible.ttf
    sleep 1
    wget -P "$HOME"/.local/share/fonts/caskaydia/ https://github.com/mochimosh101/Prettier-Terminal/raw/main/My-Terminal/kitty/CascadiaCode-Fonts/Caskaydia-Cove-Nerd-Font-Complete-Mono.ttf
    sleep 1
    wget -P "$HOME"/.local/share/fonts/caskaydia/ https://github.com/mochimosh101/Prettier-Terminal/raw/main/My-Terminal/kitty/CascadiaCode-Fonts/Caskaydia-Cove-Nerd-Font-Complete-Windows-Compatible.ttf
    sleep 1
    wget -P "$HOME"/.local/share/fonts/caskaydia/ https://github.com/mochimosh101/Prettier-Terminal/raw/main/My-Terminal/kitty/CascadiaCode-Fonts/Caskaydia-Cove-Nerd-Font-Complete.ttf
    sleep 1
    wget -P "$HOME"/.config/kitty/ https://raw.githubusercontent.com/mochimosh101/Prettier-Terminal/main/My-Terminal/kitty/kitty.conf
    
    echo -e "$LINE\nMochibot has finished installing Mochi's Kitty Terminal Configs
    Please press exit the session and return to refresh your terminal.\n$LINE"


elif [[ "$USERINPUT" == "n" ]]; then
    echo -e "\nYou have cancelled Mochi's Kitty Terminal Configs installation"
    exit 0

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi