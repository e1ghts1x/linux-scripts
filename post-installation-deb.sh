#!/bin/bash
# -*- ENCODING: UTF-8 -*-

#Realiza a instalação de todos os pacotes em ordem 
#1. Utilidades do sistema
#2. Aplicaçoes para desenvolvimento
#3. Jogos e comunicação



pacotes=("git" "mousepad" "neofetch" "default-jre" "default-jdk" "mysql" "intellij-idea-community-edition" "docker" "nodejs" "discord" "steam")
for pacote in "${pacotes[@]}"; do
    sudo apt-get -y install "$pacote" 
done

mkdir pacotesDeb
cd pacotesDeb

wget "https://discord.com/api/download?platform=linux&format=deb"
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo dpkg -i "code_1.82.2-1694671812_amd64.deb"
sudo dpkg -i "discord-0.0.30.deb"

echo ===============Instalação completa===============