#!/bin/bash


apt update
apt install maven -y # Install maven
cd /home/GitOps-CI
mvn clean compile