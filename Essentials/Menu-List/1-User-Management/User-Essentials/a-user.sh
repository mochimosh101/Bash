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

while true; do
    # Create username
    echo -e "Please enter the username:"
    read -r CUSTOM_USERNAME

    # Check if the username already exists
    if id "$CUSTOM_USERNAME" &>/dev/null; then
        echo "Username already exists."
        echo -e "Continue or choose a different username? [C/d]"
        read -r CHOICE

        # If the user chooses to skip, then exit the loop
        if [[ "$CHOICE" != "d" ]]; then
            echo "Skipping..."
            done
        fi
    else
        # If the username doesn't exist, exit the loop
        break
    fi
done

# Proceed if the username is unique or if the user chooses to continue with a different username
echo -e "\n$LINE\nUsername: $CUSTOM_USERNAME\n$LINE\n"

# Add user description #
echo -e "Would you like to add a description to this user? [Y/n]"
read -r DESCRIPTION_ANSWER

if [[ $DESCRIPTION_ANSWER != "n" ]]; then
    echo -e "\nDescription for user:"
    read -r USER_DESCRIPTION
    echo -e "\n$LINE\nThe Description will be: $USER_DESCRIPTION\n$LINE\n"
else
    echo "No description provided."
fi

sudo useradd -m -s "$SHELL" -c "\"$USER_DESCRIPTION\"" "$CUSTOM_USERNAME"
sleep 1

echo -e "\n$LINE\nYou have successfully created a new user!
Username: $CUSTOM_USERNAME
User shell: $SHELL
User discription: $USER_DESCRIPTION\n$LINE\n"

sleep 1

# Add or create password for the user #
echo -e "Would you like to set $CUSTOM_USERNAME's password? [Y/n]"
read -r PASSWORD_ANSWER

if [[ $PASSWORD_ANSWER != "n" ]]; then

    sudo passwd "$CUSTOM_USERNAME"

fi

sleep 1

# Function to display group descriptions in a box
show_group_descriptions() {
    # Define box drawing characters
    local HORIZONTAL_LINE="=============================="
    local VERTICAL_LINE="||"
    local EMPTY_LINE="||                              ||"

    # Define group descriptions
    local DESCRIPTIONS=(
        "root: The superuser or administrator group, which has full access to the system."
        "sudo or wheel: A group that grants sudo (superuser) privileges to its members."
        "adm: Group used for system monitoring tasks, such as viewing log files."
        "users: A group that includes all regular users on the system."
        "docker: A group used for managing Docker containers and images."
        "staff: A group commonly used on macOS systems, sometimes also found on Linux systems."
    )

    # Calculate the width of the box
    local BOX_WIDTH=$((${#HORIZONTAL_LINE} - 4))

    # Print the top border of the box
    echo "${HORIZONTAL_LINE}"

    # Print group descriptions inside the box
    for description in "${DESCRIPTIONS[@]}"; do
        local EMPTY_SPACE=$((BOX_WIDTH - ${#description}))
        printf "%s %s %-${EMPTY_SPACE}s %s\n" "${VERTICAL_LINE}" "${description}" "" "${VERTICAL_LINE}"
    done

    # Print the bottom border of the box
    echo "${HORIZONTAL_LINE}"
}

# Add user to a group #
echo -e "\nWould you like to add $CUSTOM_USERNAME to a group? [Y/n]"
read -r GROUP_ANSWER

if [[ $GROUP_ANSWER != "n" ]]; then
    echo -e "Which group would you like to add $CUSTOM_USERNAME to:"
    read -r CUSTOM_GROUP

    # Display group descriptions in a box
    echo -e "\nGroup Descriptions:"
    show_group_descriptions

    sudo usermod -aG "$CUSTOM_GROUP" "$CUSTOM_USERNAME"
    sleep 1

    echo -e "\n$LINE\nYou have successfully added $CUSTOM_USERNAME to $CUSTOM_GROUP.
    Username: $CUSTOM_USERNAME
    User shell: $SHELL
    User discription: $USER_DISCRIPTION
    User Group: $CUSTOM_GROUP\n$LINE\n"
    sleep 1
    exit 0

elif [[ $GROUP_ANSWER == "n" ]]; then

    echo -e "\nUsername: $CUSTOM_USERNAME
    User shell: $SHELL
    User discription: $USER_DISCRIPTION
    User Group: $CUSTOM_GROUP\n$LINE\n"
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
