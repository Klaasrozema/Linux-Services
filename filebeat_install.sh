#!/bin/bash

#   --------------------
#   File: filebeat_install.sh
#   Author: Klaas Rozema
#   --------------------

#filebeat install
sudo apt update
sudo apt install filebeat

# Filebeat-configuratie
sudo tee /etc/filebeat/filebeat.yml > /dev/null <<EOF
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/syslog  # Voorbeeld van een logbestand, pas dit aan op basis van je behoeften

output.logstash:
  hosts: ["central_logstash_server:5000"] # Vervang 'central_logstash_server' door het IP-adres of de hostnaam van je centrale logstash-server

EOF

# Start Filebeat en enable autostart
sudo systemctl start filebeat
sudo systemctl enable filebeat

# Controleer de Filebeat-status
sudo systemctl status filebeat
