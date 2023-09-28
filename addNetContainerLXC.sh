#!/bin/bash

Container="$1"

if [ $# -eq 0 ];
then
    echo "Nenhum parâmetro foi passado.";
    exit
fi

echo "Container Selecionado : $1"

read -p "Realizar as configurações? (Ss/Nn)" -n 1 -r 

if [[ $REPLY =~ ^[Nn]$ ]];
then
    echo ""
    echo "Saindo...";
    exit
fi

if [ -e /etc/pve/lxc/$1.conf ];
then
    if grep -q "lxc.cgroup2.devices.allow: c 10:200 rwm" "/etc/pve/lxc/$1.conf" && grep -q "lxc.mount.entry: /dev/net dev/net none bind,create=dir" "/etc/pve/lxc/$1.conf"
    then
        echo ""
        echo "Container já configurado"
        exit
    else
        echo "lxc.cgroup2.devices.allow: c 10:200 rwm" >> /etc/pve/lxc/$1.conf
        echo "lxc.mount.entry: /dev/net dev/net none bind,create=dir" >> /etc/pve/lxc/$1.conf
        echo ""
        echo "Configuração realizada!"
        exit
    fi
else
    echo ""
    echo "O diretório não existe! Verificar o parâmetro digitado."
    exit
fi