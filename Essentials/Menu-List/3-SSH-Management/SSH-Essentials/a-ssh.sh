#!/usr/bin/env bash
############## Menu 3 #####################
export "USERHOME=$(echo -e "$HOME")"
export "CURRENTUSER"="$(echo -e "$USER")"
export "LINE===================================================="
mkdir "$USERHOME"/.ssh
chmod 0700 "$USERHOME"/.ssh
echo "Making your .ssh folder..."
sleep 2
echo "MochiBot has successfully created .ssh folder into your home directory!"
sleep 1
echo "$LINE"
ls -al "$USERHOME"
echo "$LINE"