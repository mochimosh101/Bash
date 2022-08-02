#!/usr/bin/env bash

export A="Adds .ssh directory into: $HOME"
export B="Configure: $HOME/.ssh/config | Create $HOME/.ssh/config"
export C="Configure sshd_config"
export D="Restarts SSHD"

################
################

clear
printf "I will be helping you with SSH Management!\n" 
echo -e "What would you like to start with?"
echo -e "   ============================================================
a. | Adds .ssh directory into: $HOME                          |
b. | Configure: $HOME/.ssh/config | Create $HOME/.ssh/config  |
c. | Configure sshd_config                                    |
d. | Restarts SSHD                                            |
x. | Exit Menu                                                |
   ============================================================\n"
read -r SELECTION


if [[ $SELECTION == "a" ]]; then

    echo -e "\n$A\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/SSH-Essentials/a-ssh.sh)"

elif [[ $SELECTION == "b" ]]; then

    echo -e "\n$B\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/SSH-Essentials/b-ssh.sh)"

elif [[ $SELECTION == "c" ]]; then

    echo -e "\n$C\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/SSH-Essentials/c-ssh.sh)"
    
elif [[ $SELECTION == "d" ]]; then

    echo -e "\n$D\n"
    sleep 1
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mochimosh101/MochiBot/main/Essentials/Menu-List/3-SSH-Management/SSH-Essentials/d-ssh.sh)"
    

elif [[ $SELECTION == "x" ]]; then

    echo -e "\nExiting SSH Management Menu..."
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