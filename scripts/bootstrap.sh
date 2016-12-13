#!/usr/bin/env bash

echo -e "\nUpdating the system..."
apt-get update -y

echo "Installing OpenJDK8..."
add-apt-repository -y ppa:openjdk-r/ppa 2>&1
apt-get update
apt-get install -y openjdk-8-jdk=8u111\*
update-alternatives --config java
update-alternatives --config javac

echo "Installing git, unzip and docker..."
apt-get install -y git=1:1.9.1\* unzip=6.0\* docker.io=1.6.2\*

echo "Spinning up docker container from Mongo image..."
docker run --name mongo -p 27017:27017 -d mongo:latest