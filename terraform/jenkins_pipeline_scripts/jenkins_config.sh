#!/bin/bash
# If you run jenkins in docker container and use host docker dekstop


apt update && apt upgrade -y
apt install docker.io -y
docker --version