#!/bin/bash
res=$(/usr/bin/speedtest-cli --server 2933 --simple)
ping=$(echo -e "$res" | grep Ping | cut -d : -f 2 | cut -d " " -f 2)
down=$(echo -e "$res" | grep Download | cut -d : -f 2 | cut -d " " -f 2)
up=$(echo -e "$res" | grep Upload | cut -d : -f 2 | cut -d " " -f 2)

echo $(date +%s) $ping $down $up
