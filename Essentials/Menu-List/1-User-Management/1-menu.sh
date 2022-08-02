#!/usr/bin/env bash

export A="Add new user"
export B="Add user to a group"
export C="Add/Change Password for user"

################
################

clear
echo -e "I will be helping you with User Management!" 
echo -e "What would you like to start with?\n"
echo -e "=================================
a. | Add new user                  |
b. | Add user to a group           |
c. | Add/Change Password for user  |
x. | Exit Menu                     |
   =================================\n"
   read -r SELECTION

if [[ $SELECTION == "a" ]]; then

    echo -e "\n$A\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/4Custom-Management/Custom-Essentials/a-custom.sh)"

elif [[ $SELECTION == "b" ]]; then

    echo -e "\n$B\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/4Custom-Management/Custom-Essentials/b-custom.sh)"

elif [[ $SELECTION == "c" ]]; then

    echo -e "\n$C\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/4Custom-Management/Custom-Essentials/c-custom.sh)"
    

elif [[ $SELECTION == "x" ]]; then

    echo -e "\nExiting User Management Menu..."
    sleep 1
    exit 0

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi
   