#!/usr/bin/env bash

export "LINE======================================================================================="
echo "Please note that this will only work with apt package manager"
sleep 2
echo "Would install Mochi's Terminal Configs (Y/n)"
read -r USERINPUT
sudo echo

if [[ "$USERINPUT" != "n" ]]; then
    
    sudo apt install awk -y; sudo apt install fontconfig -y; sudo apt install unlink; sudo apt install unzip -y
    echo -e "Mochibot will need to install JetBrainsMono Font...
    This could take a while...\n"
    sleep 1
    ./Customs/Fonts/JetBrains.sh
    sleep 2
    echo -e "$LINE\nMochibot has finished installing JetBrains\n$LINE"
    sleep 1
    echo -e "$LINE\nMochibot will now be installing starship...\n$LINE"
    sleep 1
    curl -sS https://starship.rs/install.sh | sh
    sudo apt install starship
    echo -e "eval \"$(starship init bash)\"" >> "$HOME"/.bashrc
    cat ./Customs/starship.txt > "$HOME"/.config/starship.toml
    echo -e "$LINE\nMochibot has finished installing Mochi's Terminal Configs
    Please press ENTER to refresh your terminal.\n$LINE"
else [[ "$USERINPUT" == "n" ]]
    echo -e "\nYou have cancelled Mochi's Terminal Configs installation"
    exit 0

fi