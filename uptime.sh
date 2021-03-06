#!/bin/bash
#
HOSTNAME="http://localhost:3000/data/uptimes"
ID=5

while sleep 60;
do
uptime=$(uptime | awk -F'( |,|:)+' '{print $6,$7",",$8,"hours,",$9,"minutes."}')
load=$(uptime | cut -d' ' -f12 | cut -d',' -f1)
DATE=$(date +%s) 

echo $uptime $load $DATE;
curl "$HOSTNAME" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
--data @<(cat <<EOF
{"id":"$ID","uptime":"$uptime","load":"$load","timestamp":"$DATE"}
EOF
); done
