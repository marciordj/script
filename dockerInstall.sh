#!/bin/bash

echo "Docker install";

echo "curl install";
sudo apt install curl -y

echo "Remove docker if existing";
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo "Install Docker";
sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

echo "Add Docker’s official GPG key";
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "verify fingerprint";
sudo apt-key fingerprint 0EBFCD88

echo "install docker engine";
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io -y

echo "run sudo docker run hello-word";
