#!/usr/bin/env bash

export "LINE1=================================================="
readonly LINE1

################
################

clear
echo "Please note that this will only work with apt package manager"
sleep 2
echo "Would you like to install Docker? [Y/n]"
read -r DOCKER

echo "Would you like to install Docker Compose? [Y/n]"
read -r DOCKER_COMPOSE

sudo echo

if [[ "$DOCKER" != "n" ]] && [[ $DOCKER_COMPOSE != "n" ]]; then
    
    sudo apt-get update; sudo apt-get upgrade -y
    
    echo -e "\n$LINE1\nMochibot will now install Docker...\n$LINE1\n"
    
    # Install Docker #
    sudo apt-get remove docker docker-engine docker.io
    sleep 1
    sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
    sleep 1
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    sleep 1
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sleep 1
    sudo apt install docker-ce -y
    sleep 1

    echo -e "\n$LINE1\nMochibot has successfully installed Docker...\n$LINE1\n"
    sudo mkdir /home/docker
    echo -e "\n$LINE1\nMochibot placed docker directory at /home/docker\n$LINE1\n"

    # Installing Docker Compose #
    mkdir -p ~/.docker/cli-plugins/
    sleep 1
    curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    sleep 1
    chmod +x ~/.docker/cli-plugins/docker-compose
    sleep 1
    sudo apt install docker-compose -y

    echo -e "\n$LINE1\nMochibot has successfully installed Docker Compose...\n$LINE1\n"
    sleep 1
    docker compose version

elif [[ "$DOCKER" != "n" ]] && [[ $DOCKER_COMPOSE == "n" ]]; then
    
    sudo apt-get update; sudo apt-get upgrade -y
    
    echo -e "\n$LINE1\nMochibot will now install Docker...\n$LINE1\n"
    
    # Install Docker #
    sudo apt-get remove docker docker-engine docker.io
    sleep 1
    sudo apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
    sleep 1
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    sleep 1
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sleep 1
    sudo apt install docker-ce -y
    sleep 1

    echo -e "\n$LINE1\nMochibot has successfully installed Docker...\n$LINE1\n"
    sudo systemctl status docker
    sleep 1

elif [[ "$DOCKER" == "n" ]] && [[ $DOCKER_COMPOSE != "n" ]]; then

    # Installing Docker Compose #
    mkdir -p ~/.docker/cli-plugins/
    sleep 1
    curl -SL https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
    sleep 1
    chmod +x ~/.docker/cli-plugins/docker-compose
    sleep 1
    sudo apt install docker-compose

    echo -e "\n$LINE1\nMochibot has successfully installed Docker Compose...\n$LINE1\n"
    sleep 1
    docker compose version

elif [[ "$DOCKER" == "n" ]] && [[ "$DOCKER_COMPOSE" == "n" ]]; then
    
    echo -e "\nYou have cancelled Docker and Docker-Compose installation"
    exit 0

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi