#!/bin/bash
# If you run jenkins in docker container and use host docker dekstop
# Run this with root user


apt update && apt upgrade -y
apt install docker.io -y
apt install sudo -y
echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
sudo docker --version