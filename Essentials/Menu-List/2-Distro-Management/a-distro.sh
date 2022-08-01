#!/usr/bin/env bash
export "LINE===================================================="
echo "Would you like to update and upgrade your Distro? [Y/n]"
read -r confirmation

if [[ $confirmation == "n" ]]; then
    echo "You have chosen not to upgrade your Distro."

elif [[ $confirmation != "n" ]]; then
    echo -e "Getting ready to upgrade your Distro...\n"
    sleep 2
    sudo apt update && sudo apt upgrade -y
    sleep 2
    echo -e "\n$LINE\nMochiBot is finishing some final touches...\n$LINE"
    sleep 1
    echo -e "\n$LINE\nMochiBot has successfully upgraded your Distro\n$LINE\n"
fi