#!/usr/bin/env bash

NAME="$(whoami)"
readonly NAME

BOT="\"MochiBot\""
readonly BOT

#LOOPEND=""

clear
printf "\nWelcome, %s\n" "$NAME!"
printf "My name is %s\n" "$BOT"
sleep 1

######## Need To Redo This ########
#printf "\nWould you like to save me as a shell command? [y/N]\n"
#read -r COMMAND
#until [[ $LOOPEND == true ]]; do

#if [[ "$COMMAND" == "y" ]]; then
#    alias mochibot='$MOCHIHOME'
#  
#else [[ "$COMMAND" != "y" ]];
#    echo "You have selected something that I have not been program to do!"
#    sleep 1
#    "$LOOPEND=true"
#fi
#
#done

printf "I will be helping you with your initial server set up!\n" 
echo -e "What would you like to start with?"
echo -e "   =================================
1. | User Management               |
2. | Distro Management             |
3. | SSH Management                |
4. | Custom Management             |
5. | Exit Menu                     |
   ================================="

export one="User Management"
export two="Distro Management"
export three="SSH Management"
export four="Custom Configuration"
export five="Exit Menu"

read -r USERINPUT

############## Menu 1 ##############
if [[ $USERINPUT == "1" ]]; then
    echo -e "You have selected: $one\n"
    sleep 1
    echo -e "User Management:
    - (a) Adds a new user (Optional Inputs: Add Home Dir | Add Shell | Add User Discription)
    - (b) Add to a new group (this could be for the sudo group)
    - (c) Add or Change Password for the user"
    
    if [[ $USERINPUT == "a" ]]; then
        # Redirect the user to the 1st Menu List
        ./Essentials/Menu-List/a-user.sh
    fi

############## Menu 2 #####################
elif [[ $USERINPUT == "2" ]]; then

    echo -e "You have selected: $two\n"
    sleep 2
    echo -e "Distro Update:
    - (a) Update the full distro"

    if [[ $USERINPUT == "a" ]]; then
        # Redirect the user to the 2nd Menu List Folder (Option A)
        ./Essentials/Menu-List/a-distro.sh
    fi

############## Menu 3 #####################
elif [[ $USERINPUT == "3" ]]; then

    echo -e "You have selected: $three\n"
    sleep 2
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/3-menu.sh)"

############## Menu 4 #####################
elif [[ $USERINPUT == "4" ]]; then

    echo -e "You have selected: $four\n"
    sleep 2
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/4Custom-Management/4-menu.sh)"

############## Menu 5 #####################
elif [[ $USERINPUT == "5" ]]; then

    echo -e "You have selected: $five\n"
    sleep 1
    # Work In Progress
    echo "Hope to see you again!"
    sleep 2
    exit 0
    fi

############## Error Message Exit 1########
elif [[ $USERINPUT -le "6" ]]; then

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option.."
    exit 1

fi