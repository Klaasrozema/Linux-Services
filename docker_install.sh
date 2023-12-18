#!/bin/bash

#   --------------------
#   File: docker_install.sh
#   Author: Klaas Rozema
#   --------------------

# Installeer packages voor Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Installeer Docker
sudo apt update
sudo apt install -y docker-ce

# Voeg huidige gebruiker toe aan de 'docker' groep
sudo usermod -aG docker $USER

# Enable en start Docker service
sudo systemctl enable docker
sudo systemctl start docker

echo "####################"
echo "Installatie Docker voltooid. "
echo "####################"

# Controleer geïnstalleerde Docker versie
docker --version