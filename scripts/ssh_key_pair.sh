#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: No SSH key name provided."
	exit 1
fi
SSH_KEY_NAME="ed25519_$1_ssh_key_name"

SSH_KEY_COMMENT=""
if [ -n "$2" ]; then
	SSH_KEY_COMMENT=$2
fi

echo -e "\n\n***Generating SSH key pair***\n"
echo -e "Starting ssh-agent\n\n" 
eval "$(ssh-agent -s)"
if [ $? -ne 0 ]; then
	echo "Error starting ssh-agent! .. exiting"
	exit 1
fi

ssh-keygen -q -t ed25519 -f ./$SSH_KEY_NAME -C "$SSH_KEY_COMMENT" -N ''
if [ $? -ne 0 ]; then
	echo "Error generating ssh key pair! .. exiting"
	exit 1
fi

ssh-add ./$SSH_KEY_NAME
if [ $? -ne 0 ]; then
	echo "Error adding ssh key to ssh-agent! .. exiting"
	exit 1
fi

PUBLIC_KEY=$(cat ./$SSH_KEY_NAME.pub)
echo -e "Public key file: ./$SSH_KEY_NAME.pub \n\n"
echo -e "Public key: $PUBLIC_KEY \n\n"

exit 0
