#!/usr/bin/env bash

export "LINE==========================================================="
readonly LINE

CYAN=$(echo -en '\033[00;36m')
readonly CYAN

RED=$(echo -en '\033[00;31m')
readonly RED

RESTORE=$(echo -en '\033[0m')
readonly RESTORE

################
################

# Cool Cyan Color :P #
function cyan() {

    echo -e >&2 "\n${CYAN}$*${RESTORE}\n"

}

# Print error message #
function die() {

  echo -e >&2 "\n${RED}$*${RESTORE}"
  exit 1
}

# Checks users input to users system users #
function user_list() {

    gawk -F: '{ print $1 }' /etc/passwd | grep "$INPUT_USER"

}

################
################

clear
echo -e "\n$LINE\nNote: User has to exist to change its password\n$LINE\n"
sudo echo

# Chooses and check if user exist #
echo -e "\nPlease choose a user: "
read -r INPUT_USER

if [[ $INPUT_USER == $(user_list) ]]; then
    
    cyan "Checking if $INPUT_USER exist..."
    sleep 1
    cyan "User $INPUT_USER exist"
    sleep 1
    sudo passwd "$INPUT_USER"

else

    cyan "Checking if $INPUT_USER exist..."
    sleep 1
    die "User does not exist! Please create $INPUT_USER and try again"

fi

sleep 1

echo -e "\n$LINE\nYou have successfully change $INPUT_USER's password.\n$LINE\n"
