#!/usr/bin/env bash
export "MOCHIHOME=$(pwd)/test.sh" # PLEASE RE EDIT THIS EVN PLEASE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
export "NAME=$(whoami)"
export BOT="\"MochiBot\""
export LOOPEND=""
clear
printf "\nWelcome, %s\n" "$NAME!"
printf "My name is %s\n" "$BOT"
sleep 1
printf "\nWould you like to save me as a shell command? [y/N]\n"
read -r COMMAND
while [[ $LOOPEND == true ]]; 
do
if [[ "$COMMAND" == "y" ]]; then
    alias mochibot='$MOCHIHOME'
else 
    $LOOPEND -eq true
fi
done


printf "I will be helping you with your initial server set up!\n" 
echo -e "What would you like to start with?"
echo -e "   =================================
1. | User Management               |
2. | Distro Management             |
3. | SSH Management                |
4. | Custom Management             |
5. | Exit Menu                     |
   =================================
For help option try \"1 -h\" or \"2 -h\" and so on.
"

export one="User Management"
export two="Distro Management"
export three="SSH Management"
export four="Custom Configuration"
export five="Exit Menu"

read -r USERINPUT

# MochiBot Help Commands
while [[ $LOOPEND == true ]]; do
if [[ $USERINPUT == "1 -h" ]]; then

    echo -e "User Management:
    - (1 -a) Adds a new user (Optional Inputs: Add Home Dir | Add Shell | Add User Discription)
    - (1 -b) Add to a new group (this could be for the sudo group)
    - (1 -c) Add or Change Password for the user"
elif [[ $USERINPUT == "2 -h" ]]; then
    echo -e "Distro Update:
    - (2 -a) Update the full distro
    - (2 -b) Upgrade the distro"
elif [[ $USERINPUT == "3 -h" ]]; then
    echo -e "SSH Management
    - (3 -a) Adds .ssh into:  $HOME 
    - (3 -b) Vim into: $HOME/.ssh
    - (3 -c) Configure sshd_config
    - (3 -d) Restarts SSHD"
elif [[ $USERINPUT == "4 -h" ]]; then
    echo -e "WIP"
else
    $LOOPEND -eq true
fi
done
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
elif [[ $USERINPUT -le "6" ]]; then
    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option.."
    exit 1
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
        else return
        fi
    useradd -m -s /bin/bash -c "$discription" "$custom_user"
fi