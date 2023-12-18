#!/bin/bash

#	--------------------
#	File: salt.sh
#	Author: Klaas Rozema
#	--------------------

# Installatie van Salt Master en Minion
install_master_and_minion() {
    # Download bootstrap-salt.sh
    sudo curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io

#   Installeer dependencies voor Salt   
    sudo apt-get install libzmq3-dev -y

    # Install Salt Master and Minion
    sudo sh bootstrap-salt.sh -M -A "$master_ip" stable

    # Set Minion ID
    echo "id: $minion_id" | sudo tee /etc/salt/minion

    # Start Salt Master and Minion services
    sudo systemctl start salt-master
    sudo systemctl start salt-minion
}

# Functie voor het installeren van alleen de Salt Minion
install_minion_only() {
    # Download bootstrap-salt.sh
    sudo curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io

    # Install Salt Minion only
    sudo sh bootstrap-salt.sh -A "$master_ip" stable

    # Set Minion ID
    echo "id: $minion_id" | sudo tee /etc/salt/minion

    # Start Salt Minion service
    sudo systemctl start salt-minion
}

echo "Welkom bij het SaltStack installatiescript!"
echo "Wil je Salt Master en Minion installeren? (y/n): "
read install_choice

# Omzetten naar kleine letters voor vergelijking: !!ANDERS ERROR!!
install_choice=$(echo "$install_choice" | tr '[:upper:]' '[:lower:]')

if [[ "$install_choice" == "y" ]]; then
    echo "Voer het IP-adres van de Salt Master in: "
    read master_ip

    echo "Voer het Minion ID in: "
    read minion_id

    install_master_and_minion
elif [[ "$install_choice" == "n" ]]; then
    echo "Wil je alleen de Salt Minion installeren? (y/n): "
    read install_minion

    # Omzetten naar kleine letters voor vergelijking
    install_minion=$(echo "$install_minion" | tr '[:upper:]' '[:lower:]')

    if [[ "$install_minion" == "y" ]]; then
        echo "Voer het IP-adres van de Salt Master in: "
        read master_ip

        echo "Voer het Minion ID in: "
        read minion_id

        install_minion_only
    else
        echo "SaltStack installatie overgeslagen."
    fi
else
    echo "Ongeldige keuze. SaltStack installatie overgeslagen."
fi