#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

echo -e "\nUpdating the system\n"
apt-get update -y

echo "Installing OpenJDK8"
add-apt-repository -y ppa:openjdk-r/ppa 2>&1
apt-get update
apt-get install -y openjdk-8-jdk
update-alternatives --config java
update-alternatives --config javac

echo "Installing stuff"
apt-get install -y git unzip docker.io

env | grep JAVA

echo -e "\nInstalling Gradle\n"
mkdir -p /usr/local/gradle
gradle --stop 2>&1 | true
wget https://services.gradle.org/distributions/gradle-3.2.1-bin.zip -O /tmp/gradle-3.2.1-bin.zip --no-verbose
unzip -o /tmp/gradle-3.2.1-bin.zip -d /usr/local/gradle
cat > /etc/profile.d/gradle.sh << 'EOF'
export PATH=$PATH:/usr/local/gradle/gradle-3.2.1/bin
EOF
/usr/local/gradle/gradle-3.2.1/bin/gradle

echo -e "\nInstalling Maven\n"
mkdir -p /opt/maven
wget http://mirror.catn.com/pub/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O /tmp/apache-maven-3.3.9-bin.tar.gz --no-verbose
tar xvzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/maven
cat > /etc/profile.d/maven.sh << 'EOF'
export PATH=$PATH:/opt/maven/apache-maven-3.3.9/bin
EOF
/opt/maven/apache-maven-3.3.9/bin/mvn -v
