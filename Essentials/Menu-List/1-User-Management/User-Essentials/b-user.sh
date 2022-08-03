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

function user_list() {

    gawk -F: '{ print $1 }' /etc/passwd | grep "$INPUT_USER"

}

# Choose user #
echo -e "\nPlease choose a user: "
read -r INPUT_USER

if [[ $INPUT_USER == $(user_list) ]]; then
    
    cyan "Checking if $INPUT_USER exist..."
    sleep 1
    cyan "User $INPUT_USER exist"
    sleep 1

else
    cyan "Checking if $INPUT_USER exist..."
    sleep 1
    die "User does not exist! Please create $INPUT_USER and try again"

fi

# Add user to a group #
echo -e "Please choose a group: "
read -r INPUT_GROUP

echo -e "\n$LINE\n\n$LINE\nYou will be adding $INPUT_USER to group $INPUT_GROUP\n$LINE\n\n$LINE\n"
echo -e "Do you wish to continue? [Y/n]"
read -r CONTINUE

if [[ $CONTINUE != "n" ]]; then

    sudo usermod -aG "$INPUT_GROUP" "$INPUT_USER"

else

    die "\nMochiBot will now be exiting..."
    sleep 1
    exit 0

fi

sleep 1

echo -e "\n$LINE\nYou have successfully added $INPUT_USER to $INPUT_GROUP.
Username: $INPUT_USER
User Group: $INPUT_GROUP\n$LINE\n"
