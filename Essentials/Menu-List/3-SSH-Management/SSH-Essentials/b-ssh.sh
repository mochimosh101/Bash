#!/usr/bin/env bash

echo "Would you like to use Nano(n) or Vim(v)?"
read -r response
if [[ $response = "n" ]]; then
    nano "$HOME"/.ssh/config

elif [[ $response = "v" ]]; then
    vim "$HOME"/.ssh/config

else

   sleep 1
   echo -e "\nYou have selected something that I have not been program to do!"
      
fi

echo -e "\nWould you like to choose another option? [Y/n]: "
read -r OPTION

if [[ $OPTION != "n" ]]; then

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/3-menu.sh)"

else

    exit 0

fi
