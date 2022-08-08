#!/usr/bin/env bash

export "LINE1=================================================="
readonly LINE1

################
################

clear
echo "Please note that this will only work with apt package manager"
sleep 1
echo -e "\nWould you like to install NPN (Nginx Proxy Manager)? [Y/n]"
read -r NPM

echo -e "Would you like to install Portainer? [Y/n]"
read -r PORTAINER

# Nginx Proxy Manager and Portainer #
if [[ "$NPM" != "n" ]] && [[ $PORTAINER != "n" ]]; then
    
    sudo mkdir /home/docker; sudo mkdir /home/docker/nginxproxymanager; sudo mkdir /home/docker/portainer; mkdir "$HOME"/temp
    mkdir "$HOME"/temp/portainer; mkdir "$HOME"/temp/nginxproxymanager
    
    # Nginx Proxy Manager YML #
    wget -P "$HOME"/temp/nginxproxymanager https://raw.githubusercontent.com/mochimosh101/Docker/main/nginxproxymanager/docker-compose.yml
    # Portainer YML #
    wget -P "$HOME"/temp/portainer https://raw.githubusercontent.com/mochimosh101/Docker/main/portainer/docker-compose.yml
    
    # Making a network called proxy #
    sudo docker network create proxy

    #Nginx Proxy Manager #
    sudo mv "$HOME"/temp/nginxproxymanager/docker-compose.yml /home/docker/nginxproxymanager
    
    # Portainer #
    sudo mv "$HOME"/temp/portainer/docker-compose.yml /home/docker/portainer

    rm -rf "$HOME"/temp

    sudo docker network create proxy

    sudo docker-compose --project-directory /home/docker/nginxproxymanager/ up -d
    echo -e "$LINE1\nNginx Proxy Manager is up and running\n$LINE1\n"
    
    sudo docker-compose --project-directory /home/docker/portainer/ up -d
    echo -e "$LINE1\nPortainer is up and running\n$LINE1\n"

    echo -e "$LINE1\nNginx Proxy Managers defualt logins are:
    Email: admin@example.com
    Password: changeme\n$LINE1\n"

    echo -e "$LINE1\nPortainer should tell you to make a new account once you open you portainer website\n$LINE1\n"

# Nginx Proxy Manager #
elif [[ "$NPM" != "n" ]] && [[ $PORTAINER == "n" ]]; then

    # Nginx Proxy Manager Dir #
    sudo mkdir /home/docker; sudo mkdir /home/docker/nginxproxymanager
    mkdir "$HOME"/temp; mkdir "$HOME"/temp/nginxproxymanager
    
    # Nginx Proxy Manager YML #
    wget -P "$HOME"/temp/nginxproxymanager https://raw.githubusercontent.com/mochimosh101/Docker/main/nginxproxymanager/docker-compose.yml
    sudo mv "$HOME"/temp/nginxproxymanager/docker-compose.yml /home/docker/nginxproxymanager
    sudo docker-compose --project-directory /home/docker/nginxproxymanager/ up -d
    
    # Removing Temp Dir #
    rm -rf "$HOME"/temp

    echo -e "$LINE1\nNginx Proxy Manager is up and running\n$LINE1\n"
    
    echo -e "$LINE1\nNginx Proxy Managers defualt logins are:
    Email: admin@example.com
    Password: changeme\n$LINE1\n"

# Portainer #
elif [[ "$NPM" == "n" ]] && [[ $PORTAINER != "n" ]]; then

    # Portainer Dir #
    sudo mkdir /home/docker; sudo mkdir /home/docker/portainer
    mkdir "$HOME"/temp; mkdir "$HOME"/temp/portainer
    
    # Portainer YML #
    wget -P "$HOME"/temp/portainer https://raw.githubusercontent.com/mochimosh101/Docker/main/portainer/docker-compose.yml
    sudo docker-compose --project-directory /home/docker/nginxproxymanager/ up -d
    sudo mv "$HOME"/temp/portainer/docker-compose.yml /home/docker/portainer

    # Removing Temp Dir #
    rm -rf "$HOME"/temp

    echo -e "$LINE1\nPortainer is up and running\n$LINE1\n"
    echo -e "$LINE1\nPortainer should tell you to make a new account once you open you portainer website\n$LINE1\n"
    
else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi