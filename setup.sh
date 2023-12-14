#	--------------------
#	File: setup.sh
#	Author: Klaas Rozema
#	--------------------

#Benodigde acties en bijbehorende commando's voor het opzetten en installeren van salt services

#Updaten huidige machine

	sudo apt get update
	sudo apt get upgrade -y
	echo "Updates uitgevoerd"
	wait 30

#Kopie van repo naar lokale server
#Verwijder oude kopie van repo als deze al bestaat

	sudo apt install git
	rm -rf Linux-Services 
	sudo git clone https://github.com/Klaasrozema/Linux-Services
	echo "Github geinstalleerd en repo gecloned"

	sh Linux-Services/salt.sh