#!/bin/bash

#   --------------------
#   File: kibana_install.sh
#   Author: Klaas Rozema
#   --------------------

# Voeg de Elasticsearch repository toe
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/kibana.list'

# Update de pakketbronnenlijst en installeer Kibana
sudo apt update
sudo apt install kibana

# Configureer Kibana
sudo sed -i 's/#server.host: "localhost"/server.host: "localhost"/' /etc/kibana/kibana.yml
sudo sed -i 's/#elasticsearch.hosts: \["http:\/\/localhost:9200"\]/elasticsearch.hosts: \["http:\/\/localhost:9200"\]/' /etc/kibana/kibana.yml

# Start en activeer Kibana
sudo systemctl start kibana
sudo systemctl enable kibana

# Controleer de status van Kibana
sudo systemctl status kibana
