#!/usr/bin/env bash

echo "Installing MySQL..."
sudo dpkg -i .setup/mysql-apt-config_0.8.0-1_all.deb
sudo apt-get update
sudo apt-get install mysql-server=5.7.16\*

echo "Checking if installation was successful..."
sudo service mysql status
