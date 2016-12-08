#!/usr/bin/env bash

if [[ $FAST_PROVISION == "true" ]]; then
	echo "Fast provision is done"
	exit 0
fi

export DEBIAN_FRONTEND=noninteractive

echo -e "\nUpdating the system..."
apt-get update -y

echo "Installing OpenJDK8..."
add-apt-repository -y ppa:openjdk-r/ppa 2>&1
apt-get update
apt-get install -y openjdk-8-jdk
update-alternatives --config java
update-alternatives --config javac

echo "Installing git, unzip and docker..."
apt-get install -y git unzip docker.io

sudo groupadd docker
sudo gpasswd -a vagrant docker
