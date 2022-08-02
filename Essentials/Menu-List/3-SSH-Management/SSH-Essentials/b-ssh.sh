#!/usr/bin/env bash

echo "Would you like to use Nano(n) or Vim(v)?"
read -r response
if [[ $response = "n" ]]; then
    nano "$HOME"/.ssh/config

elif [[ $response = "v" ]]; then
    vim "$HOME"/.ssh/config

else

   sleep 1
   echo -e "\nYou have selected something that I have not been program to do!"
      
fi
