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
    - /var/log/syslog

output.logstash:
  hosts: ["192.168.2.11:5000"]

EOF

# Start Filebeat en enable autostart
sudo systemctl start filebeat
sudo systemctl enable filebeat

echo "####################"
echo "Installatie Filebeat voltooid. "
echo "####################"

# Controleer de Filebeat-status
sudo systemctl status filebeat
