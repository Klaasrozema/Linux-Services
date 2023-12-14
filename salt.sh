#! /bin/bash

read -p "Installatie van Salt Master of Minion? " SALT

while [ "$SALT" != "Master" ] && [ "$SALT" != "Minion" ]
do
	echo "Geen juiste methode gekozen, probeer het later opnieuw"
done

if [ "$SALT" = "Master" ]; then
	#install master
	cd /home/user
	sudo curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io
	chmod +x bootstrap-salt.sh
	sudo sh install_salt.sh -M
	echo "####################"
	echo "Installatie Salt Master voltooid. "
	echo "####################"
	
	sudo mkdir /srv/salt
	cd "/home/user/Linux-Services/States/"
	sudo cp * /srv/salt/
	cd /home/user/
	
	read -p "Wil je de Minion installeren op deze Master? [y/n]" minion
	if [ "$minion" = "y" ]; then 
		read -p "Geef een IP-adres aan de Master: " IP_Master
		sudo sh install_salt.sh -A $IP_Master
		#Minion naamverandering
		sudo service salt-minion stop
		read -p "Minion naam: " Minion_Name
		sleep 1
		sudo rm -rf /etc/salt/minion_id
		sudo touch /etc/salt/minion_id && sudo chmod 777 /etc/salt/minion_id
		sudo printf "$Minion_Name" > /etc/salt/minion_id
		sudo service salt-minion start
		echo "####################"
		echo "Installatie Salt Minion voltooid. "
		echo "####################"

	else
		echo "Minion is niet op de juiste manier geinstalleerd"
	fi

	read -p "Wil je de sleutel accepteren? [y/n]" key
	if [ "$key" = "y" ]; then
		sudo salt-key -A
		echo "####################"
		echo "Sleutel geaccepteerd"
		echo "####################"
	else 
		echo "Sleutel niet geaccepteerd"
	fi

else
	#install minion
	sudo curl -L https://bootstrap.saltstack.com -o install_salt.sh
	read -p "Geef het IP-adres van de Master " IP_Master
	#sudo apt-install update 
	sudo sh install_salt.sh -A $IP_Master
	
	#Minion name changing
	sudo service salt-minion stop
	read -p "Minion naam: " Minion_Name
	sleep 35
	sudo rm -rf /etc/salt/minion_id
	sudo touch /etc/salt/minion_id && sudo chmod 777 /etc/salt/minion_id
	sudo printf "$Minion_Name" > /etc/salt/minion_id
	sudo service salt-minion start
	echo "####################"
	echo "Salt Minion installatie voltooid"
	echo "####################"
fi