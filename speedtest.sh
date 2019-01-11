#!/bin/bash
HOSTNAME="http://192.168.1.87:3000/data/connection"
ID=5

while sleep 50;
do
ST=$(sudo ./speedtest-cli --csv)

DISTANCE=$(echo $ST | cut -d',' -f5)
DOWNLOAD=$(echo $ST |cut -d',' -f7)
UPLOAD=$(echo $ST | cut -d',' -f8)
PING=$(echo $ST |cut -d',' -f6)
IP=$(curl -s https://ipinfo.io/ip)
DATE=$(date +%s)
echo $DISTANCE,$DOWNLOAD,$UPLOAD,$PING,$IP

curl "$HOSTNAME" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
--data @<(cat <<EOF
{"id":"$ID","distance":"$DISTANCE","download":"$DOWNLOAD","upload":"$UPLOAD","ping":"$PING","ip":"$IP","timestamp":"$DATE"}
EOF
);done
