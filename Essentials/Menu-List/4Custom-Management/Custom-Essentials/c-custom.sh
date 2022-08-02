#!/usr/bin/env bash

export "LINE======================================================================================="
readonly LINE

export "LINE1=================================================="
readonly LINE1

################
################

clear
echo "Please note that this will only work with apt package manager"
sleep 2
echo "Would install Mochi's Starship Terminal Configs [Y/n]"
read -r USERINPUT
sudo echo

if [[ "$USERINPUT" != "n" ]]; then
    
    sudo apt install fontconfig -y; sudo apt install unzip -y
    echo -e "Mochibot will need to install JetBrainsMono Font...
    This could take a while...\n"
    sleep 2
    # JetbrainsMono Github Manual Installation
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
    
    echo -e "\n$LINE1\nMochibot has finished installing JetBrains\n$LINE1\n"
    sleep 1

    echo -e "\n$LINE\nMochibot will now be installing starship...\n$LINE\n"
    sleep 1

    curl -sS https://starship.rs/install.sh | sh
    echo -e "\n# This is for Starship Config" >> "$HOME"/.bashrc
    echo "eval \"\$(starship init bash)\"" >> "$HOME"/.bashrc

    wget -P "$HOME"/.config/ https://raw.githubusercontent.com/mochimosh101/Prettier-Terminal/main/My-Terminal/starship/starship.toml
    
    echo -e "\n$LINE\nMochibot has finished installing Mochi's Starship Terminal Configs
    Please press exit the session and return to refresh your terminal.\n$LINE\n"

elif [[ "$USERINPUT" == "n" ]]; then
    
    echo -e "\nYou have cancelled Mochi's Starship Terminal Configs installation"
    exit 0

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi