#	--------------------
#	File: setup.sh
#	Author: Klaas Rozema
#	--------------------

#Benodigde acties en bijbehorende commando's voor het opzetten en installeren van salt services

#Updaten huidige machine

	sudo apt get update
	sudo apt get upgrade -y
	wait 30

#Allereerst: kopie van repo naar lokale server

	sudo apt install git
	sudo git clone https://github.com/Klaasrozema/Linux-Services

	