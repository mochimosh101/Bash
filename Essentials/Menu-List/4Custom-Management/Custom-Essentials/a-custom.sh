#!/usr/bin/env bash

export "LINE======================================================================================="
readonly LINE

export "LINE1=============================================================="
readonly LINE1

################
################

clear
echo -e "$LINE1\nMochi's Terminal Config consists of both Starship and Kitty\n$LINE1\n"
echo "Please note that this will only work with apt package manager"
sleep 2
echo -e "\n$LINE1\nNote: This may not work if you don't have a \nDISPLAY environment or Desktop View\n$LINE1\n"
echo -e "Would you like to install Mochi's Terminal Configs [Y/n]"
sleep 1
read -r USERINPUT
sudo echo

if [[ $USERINPUT != "n" ]]; then

    #### Installation of Kitty ####
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
    
    sleep 5

    #### Installation of Starship ####
    echo -e "Mochibot will need to install JetBrainsMono Font...
    This could take a while...\n"
    
    sleep 2

    # JetbrainsMono Github Manual Installation
    sudo apt install fontconfig -y; sudo apt install unzip -y
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
    
    echo -e "\n$LINE1\nMochibot has finished installing JetBrains\n$LINE1\n"
    sleep 1

    echo -e "\n$LINE\nMochibot will now be installing starship...\n$LINE\n"
    sleep 1

    curl -sS https://starship.rs/install.sh | sh
    echo -e "\n# This is for Starship Config" >> "$HOME"/.bashrc
    echo "eval \"\$(starship init bash)\"" >> "$HOME"/.bashrc

    wget -P "$HOME"/.config/ https://raw.githubusercontent.com/mochimosh101/Prettier-Terminal/main/My-Terminal/starship/starship.toml
    
    echo -e "\n$LINE\nMochibot has finished installing Mochi's Terminal Configs
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