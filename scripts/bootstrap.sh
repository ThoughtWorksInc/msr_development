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

echo -e "\nInstalling Gradle..."
mkdir -p /usr/local/opt/gradle
if which gradle 2> /dev/null ; then
	gradle --stop 2>&1
fi
wget https://services.gradle.org/distributions/gradle-3.2.1-bin.zip -O /tmp/gradle-3.2.1-bin.zip --no-verbose
unzip -o /tmp/gradle-3.2.1-bin.zip -d /usr/local/opt/gradle
cat > /etc/profile.d/gradle.sh << 'EOF'
export PATH=$PATH:/usr/local/opt/gradle/gradle-3.2.1/bin
EOF