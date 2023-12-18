#!/bin/bash

#   --------------------
#   File: status.sh
#   Author: Klaas Rozema
#   --------------------

servers=("192.168.2.11" "192.168.2.12" "192.168.2.13")

for server in "${servers[@]}"
do
    if ping -c 1 "$server" &> /dev/null
    then
        echo -e "Server $server: \e[32mactief\e[0m" # Groene tekst voor actief
    else
        echo -e "Server $server: \e[31minactief\e[0m" # Rode tekst voor inactief
    fi
done
