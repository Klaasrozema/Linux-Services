#!/bin/bash

#   --------------------
#   File: elastic_install.sh
#   Author: Klaas Rozema
#   --------------------

#!/bin/bash

# Elasticsearch installatie
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
sudo apt-get update
sudo apt-get install -y elasticsearch

# Start Elasticsearch en enable autostart
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

# Controleer de Elasticsearch-status
sudo systemctl status elasticsearch

# Logstash installatie
sudo apt-get install -y logstash

# Logstash-inputconfiguratie aanpassen
sudo tee /etc/logstash/conf.d/input.conf > /dev/null <<EOF
input {
  tcp {
    port => 5000
  }
}
EOF

# Start Logstash en enable autostart
sudo systemctl start logstash
sudo systemctl enable logstash

# Controleer de Logstash-status
sudo systemctl status logstash

# Kibana installatie
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/kibana.list'
sudo apt-get update
sudo apt-get install -y kibana

# Configureer Kibana
sudo sed -i 's/#server.host: "localhost"/server.host: "localhost"/' /etc/kibana/kibana.yml
sudo sed -i 's/#elasticsearch.hosts: \["http:\/\/localhost:9200"\]/elasticsearch.hosts: \["http:\/\/localhost:9200"\]/' /etc/kibana/kibana.yml

# Start Kibana en enable autostart
sudo systemctl start kibana
sudo systemctl enable kibana

# Controleer de Kibana-status
sudo systemctl status kibana

