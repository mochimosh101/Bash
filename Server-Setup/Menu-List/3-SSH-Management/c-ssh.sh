#!/usr/bin/env bash
echo "Would you like to use Nano(y) or Vim(n)?"
read -r response
if [[ $response = "y" ]]; then
    sudo nano /etc/ssh/sshd_config

elif [[ $response = "n" ]]; then
    sudo vim /etc/ssh/sshd_config

else [[ $response != "y" ]] && [[ $response != "n" ]]
   sleep 1
   echo -e "\nYou have selected something that I have not been program to do!"
      

fi
