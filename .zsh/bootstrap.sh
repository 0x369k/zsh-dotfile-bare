#!/bin/bash
declare -A osInfo;
osInfo[/etc/redhat-release]=dnf
osInfo[/etc/arch-release]=pacman
osInfo[/etc/SuSE-release]=zypper
osInfo[/etc/debian_version]=apt-get
osInfo[/etc/alpine-release]=apk

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo Package manager: ${osInfo[$f]}
        if [[ ${osInfo[$f]} == "apt-get" ]];then 
        sudo apt-get update && sudo apt-get install --no-install-recommends -yq file dirmngr iproute2 procps sudo lsb-release \
zlib1g tree vim nano ncurses-dev man telnet unzip zsh apt-transport-https jq gnupg2 git subversion curl make sudo \
locales autoconf automake python3-minimal python3-pip libffi-dev python3-venv golang-go rsync socat build-essential \
less vim htop && sudo apt-get clean -y && sudo rm -rf /var/lib/apt/lists/*
        else 
        echo "You are using a not supported OS. Please install dev package manual"
        fi
    fi
done