#!/bin/bash

# Run scripts to install Omadac (Omada Controller) in a Debian LXC Container
# Debian version: 12.11
# Created by e1ghts1x

echo "Installing openJDK, JSVC, wget, gnupg"
apt-get install -y openjdk-17-jre jsvc wget gnupg

echo "Configuring MongoDB Installation"
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/debian bullseye/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
apt update
apt-get -o Acquire::Check-Valid-Until=false update
echo "Installing libssl1.1"
apt install -y libssl1.1

echo "Installing MongoDB"
apt install -y mongodb-org

echo "Acquiring Omadac .deb package"
wget https://static.tp-link.com/upload/software/2025/202506/20250618/omada_v5.15.24.17_linux_x64_20250613204510.deb
echo "Installing Package"
dpkg -i omada_v5.15.24.17_linux_x64_20250613204510.deb
echo "Removing Package"
rm -r omada_v5.15.24.17_linux_x64_20250613204510.deb

echo "Installation Complete"