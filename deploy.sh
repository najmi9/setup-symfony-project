#!/bin/bash

# Set the IP address of the remote server
SERVER_IP="170.187.190.221"

# Set the SSH username and password for the remote server
SSH_USER="root"
SSH_PASS="strong-password0404"

echo "Copy the configuration file to the remote server";
sshpass -p "$SSH_PASS" scp -o StrictHostKeyChecking=no ./nginx.config $SSH_USER@$SERVER_IP:~
sshpass -p "$SSH_PASS" scp -o StrictHostKeyChecking=no ./symfony.sh $SSH_USER@$SERVER_IP:~

echo "Connect to the remote server via SSH and execute the commands";
sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no -t $SSH_USER@$SERVER_IP "chmod +x ~/symfony.sh && ~/symfony.sh" | tee -a ~/symfony.log
