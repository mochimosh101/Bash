#!/usr/bin/env bash
export "LINE======================================================================================="
echo "Would you like to restart SSHD? (Y/n)"
read -r USERINPUT
if [[ "$USERINPUT" != "n" ]]; then
    echo "Are you sure you want to restart SSHD?(Y/n)"
    read -r CONTINUE
    if [[ "$CONTINUE" != "n" ]]; then
        echo "Restarting SSHD..."
        sleep 2
        sudo systemctl restart sshd
        echo "MochiBot has successfully restarted SSHD"
        sleep 2
        echo "$LINE"
        sudo systemctl status sshd
        echo "$LINE"
    fi    
else [[ "$USERINPUT" = "n" ]]
    echo "Aborting SSHD Restart..."
    sleep 2
    exit 0
fi
