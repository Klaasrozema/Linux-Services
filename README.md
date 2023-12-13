# Linux-Services
Uitwerking van Netwerkservices, onderdeel Linux.



# Opdrachtomschrijving

Voor deze eindopdracht dient in de Azure omgeving het volgende via Saltstack en scripts gerealiseerd te worden:

- Hoofdserver met de volgende functionaliteiten:
	- Centrale logservice
	- Monitoring service
Zet op de server Saltstack Master en maak van de server een minion zodat deze ook via Salt onderhouden kan worden.
	
- Realiseer twee servers waarop één server Wordpress komt te staan en op de andere server Docker. Ook moeten de tools zoals beschreven in weekopdracht 3 en 4 geïnstalleerd worden om logs te genereren. De servers moeten ingericht worden via Saltstack. Bij het opstarten van de VM’s mag je een script (userdata) meegeven zodat Saltstack minion services wordt geïnstalleerd. De VM’s moeten hun system log naar de log server sturen. Tevens moeten de servers automatisch aan de monitor server worden toegevoegd.

# Realisatie:

	Voor het realiseren van de opdracht zal gebruik worden gemaakt van de volgende servers op een LAN netwerk. Deze maken gebruik van bijbehorende services:

	- Server 0 (Hoofdserver)
		- Salt Master + Minion
		- Logservice 
		- Monitoring Service

	- Server 1
		- Salt Minion
		- Logging naar hoofdserver
		- Wordpress

	- Server 2
		- Salt Minion
		- Logging naar hoofdserver
		- Docker

	Om de logservice te realiseren wordt gebruik gemaakt van syslog.
	Om de monitoring te realiseren wordt gebruik gemaakt van Nagios.

	De keuze voor beide services is tot stand gekomen door eerdere ervaring met beide services in eerdere projecten.

