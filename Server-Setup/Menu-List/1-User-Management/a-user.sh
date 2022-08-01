#!/usr/bin/env bash
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