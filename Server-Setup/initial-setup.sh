#!/usr/bin/env bash

export "NAME=$(whoami)"
export BOT=MochiBot

printf "\nWelcome, %s\n" "$NAME!"
printf "My name is %s\n" "$BOT"
sleep 1
printf "\nI will be helping you with your initial server set up!\n" 
echo -e "What would you like to start with?"
echo -e "   ---------------------------------
1. | User Management               |
2. | Distro Update                 |
3. | SSH Configs                   |
4. | Custom Installation           |
5. | Exit Menu                     |
   ---------------------------------
For help option try \"1 -h\" or \"2 -h\" and so on.
"

export one="User Management"
export two="Distro Management"
export three="SSH Configs"
export four="Custom Configuration"
export five="Exit Menu"

read -r USERINPUT

# MochiBot Help Commands
if [[ $USERINPUT == "1 -h" ]]; then
    echo -e "User Management:
    - Adds a new user (Optional Inputs: Add Home Dir | Add Shell | Add User Discription)
    - Add to a new group (this could be for the sudo group)
    - Add or Change Password for the user"
elif [[ $USERINPUT == "2 -h" ]]; then
    echo -e "Distro Update:
    - Update the full distro
    - (Optional) Upgrade the distro"
fi
# MochiBot telling the user his/her option
if [[ $USERINPUT == "1" ]]; then
    echo -e "You have selected: $one\n"
elif [[ $USERINPUT == "2" ]]; then
    echo -e "You have selected: $two\n"
elif [[ $USERINPUT == "3" ]]; then
    echo -e "You have selected: $three\n"
elif [[ $USERINPUT == "4" ]]; then
    echo -e "You have selected: $four\n"
elif [[ $USERINPUT == "5" ]]; then
    echo -e "You have selected: $five\n"
elif [[ $USERINPUT -le "5" ]]; then
    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "Why you no select the numbersssssssss"
    sleep 1
    echo -e "Plrease try again and select another option.."
fi

sleep 1

# This "if" statement is used for User Management Option
if [[ $USERINPUT  == "1" ]]; then
    printf "Please Enter A User Name\n"
    read -r custom_user
    echo -e "The User Name will be: $custom_user"
    sleep 1
    echo -e "Would you like to add a discription to this user? (y\\\n)"
    read -r discription_answer
        if [[ $discription_answer == "y" ]]; then
            printf "What discription do you want to add to this user?"
            read -r discription
        fi
    useradd -m -s /bin/bash -c "$discription" "$custom_user"
fi