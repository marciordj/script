#!/bin/bash
set -e

echo **Uninstall old Docker version**;
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo **Set up docker**

sudo apt update -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y


echo **Add docker key**
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

