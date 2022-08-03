#!/usr/bin/env bash
export "LINE==========================================================="
readonly LINE

export "SHELL=/bin/bash"

################
################

clear
echo -e "\n$LINE\nNote: Defualt shell will be /bin/bash\n$LINE\n"
sudo echo

# Could add new shell to the user #
echo -e "Would you like to add a custom shell? [y/N]"
read -r CUSTOM_SHELL_ANSWER

if [[ $CUSTOM_SHELL_ANSWER == "y" ]]; then

    echo -e "\nShell for the user:"
    read -r SHELL

    echo -e "\n$LINE\nThe Shell will be: $SHELL\n$LINE\n"

fi

# Create usernmae #
echo -e "Please enter the username:"
read -r CUSTOM_USERNAME

echo -e "\n$LINE\nThe User Name will be: $CUSTOM_USERNAME\n$LINE\n"

# Add user discription #
echo -e "Would you like to add a discription to this user? [Y/n]"
read -r DISCRIPTION_ANSWER

if [[ $DISCRIPTION_ANSWER != "n" ]]; then
    echo -e "\nDiscription for user:"
    read -r USER_DISCRIPTION
    echo -e "\n$LINE\nThe User Name will be: $USER_DISCRIPTION\n$LINE\n"

elif [[ $DISCRIPTION_ANSWER == "n" ]]; then
    
    $USER_DISCRIPTION -eq "" 

fi  

sudo useradd -m -s "$SHELL" -c "\"$USER_DISCRIPTION\"" "$CUSTOM_USERNAME"
sleep 1

echo -e "\n$LINE\nYou have successfully created a new user!
Username: $CUSTOM_USERNAME
User shell: $SHELL
User discription: $USER_DISCRIPTION\n$LINE\n"

sleep 1

# Add or create password for the user #
echo -e "Would you like to set $CUSTOM_USERNAME's password? [Y/n]"
read -r PASSWORD_ANSWER

if [[ $PASSWORD_ANSWER != "n" ]]; then

    sudo passwd "$CUSTOM_USERNAME"

fi

sleep 1

# Add user to a group #
echo -e "\nWould you like to add $CUSTOM_USERNAME to a group? [Y/n]"
read -r GROUP_ANSWER

if [[ $GROUP_ANSWER != "n" ]]; then

    echo -e "Which group would you like to add $CUSTOM_USERNAME to:"
    read -r CUSTOM_GROUP

    sudo usermod -aG "$CUSTOM_GROUP" "$CUSTOM_USERNAME"
    sleep 1

    echo -e "\n$LINE\nYou have successfully added $CUSTOM_USERNAME to $CUSTOM_GROUP.
    Username: $CUSTOM_USERNAME
    User shell: $SHELL
    User discription: $USER_DISCRIPTION
    User Group: $CUSTOM_GROUP\n$LINE\n"

else

    echo "EERRROOORRRRRRRR"
    sleep 1
    echo -e "You have selected something that I have not been program to do!"
    sleep 1
    echo -e "Plrease try again and select another option..."
    exit 1

fi