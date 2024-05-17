#!/bin/bash


# Check if SonarQube IP was provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <SonarQube IP>"
    exit 1
fi

# Change dir
cd /home/GitOps-CI

# Configuration variables
SONAR_IP=$1
SONAR_TOKEN="squ_9e4e156d70cd1caa4657005150d2466fd6f247a4"
SONAR_PROJECT_NAME="shopping-cart"
SONAR_BINARIES="."
SONAR_PROJECT_KEY="shopping-cart"

# Run Maven SonarQube analysis
mvn sonar:sonar \
    -Dsonar.host.url="http://${SONAR_IP}:9000/" \
    -Dsonar.login="${SONAR_TOKEN}" \
    -Dsonar.projectName="${SONAR_PROJECT_NAME}" \
    -Dsonar.java.binaries="${SONAR_BINARIES}" \
    -Dsonar.projectKey="${SONAR_PROJECT_KEY}"
