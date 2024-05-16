#!/bin/bash


sonar_analysis() {
    # Configuration variables
    SONAR_IP=$1
    SONAR_TOKEN="squ_9e4e156d70cd1caa4657005150d2466fd6f247a4"
    SONAR_PROJECT_NAME="shopping-cart"
    SONAR_BINARIES="."
    SONAR_PROJECT_KEY="shopping-cart"

    # Maven sonarQube analysis
    mvn sonar:sonar \
    -Dsonar.host.url="http://${SONAR_IP}:9000/" \
    -Dsonar.login="${SONAR_TOKEN}" \
    -Dsonar.projectName="${SONAR_PROJECT_NAME}" \
    -Dsonar.java.binaries="${SONAR_BINARIES}" \
    -Dsonar.projectKey="${SONAR_PROJECT_KEY}"
}

# Copy this file into /home/GitOps-CI
copy_file() {
    cp /home/scripts/sonar_analysis.sh /home/GitOps-CI
}

# Check first argument and call function accordingly
if [ "$1" == "sonar_analysis" ]; then
    sonar_analysis "$2"
elif [ "$1" == "copy_file" ]; then
    copy_file
fi