#!/bin/bash

#   --------------------
#   File: elastic_install.sh
#   Author: Klaas Rozema
#   --------------------

# Update de pakkettenlijst
sudo apt update

# Installeer Java dependentie voor Elastic
sudo apt install default-jre -y

# Download, installeer de Elasticsearch public key en voeg repository toe
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'

sudo apt update

# Installeer Elasticsearch en updates
sudo apt install elasticsearch -y

# Start Elasticsearch service
sudo systemctl start elasticsearch

# Zet Elasticsearch in opstartconfiguratie
sudo systemctl enable elasticsearch
