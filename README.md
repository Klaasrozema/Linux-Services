# Linux-Services
Uitwerking van Netwerkservices, onderdeel Linux.



# opdrachtomschrijving

Voor deze eindopdracht dient in de Azure omgeving het volgende via Saltstack en scripts gerealiseerd te worden:

- Hoofdserver met de volgende functionaliteiten:
	- Centrale logservice
	- Monitoring service
Zet op de server Saltstack Master en maak van de server een minion zodat deze ook via Salt onderhouden kan worden.
	
- Realiseer twee servers waarop één server Wordpress komt te staan en op de andere server Docker. Ook moeten de tools zoals beschreven in weekopdracht 3 en 4 geïnstalleerd worden om logs te genereren. De servers moeten ingericht worden via Saltstack. Bij het opstarten van de VM’s mag je een script (userdata) meegeven zodat Saltstack minion services wordt geïnstalleerd. De VM’s moeten hun system log naar de log server sturen. Tevens moeten de servers automatisch aan de monitor server worden toegevoegd.

