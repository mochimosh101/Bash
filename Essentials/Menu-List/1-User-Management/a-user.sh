#!/usr/bin/env bash
export "LINE==========================================================="
echo "Note: This will add a /bin/bash shell to the user."
echo "Would you like to start making the new user? (Y/n)"
read -r USERINPUT

if [[ $USERINPUT  != "n" ]]; then
    printf "Please enter the username:\n"
    read -r custom_user

    echo -e "\n$LINE\nThe User Name will be: $custom_user\n$LINE\n"
    
    echo -e "Would you like to add a discription to this user? (Y/n)"
    read -r discription_answer
        if [[ $discription_answer != "n" ]]; then
            echo "What discription do you want to add to this user?"
            read -r discription
        else [[ $discription_answer == "n" ]]
            $discription -eq "" 
        fi
    useradd -m -s /bin/bash -c "\"$discription\"" "$custom_user"
fi

echo "useradd -m -s /bin/bash -c $discription $custom_user"