#!/bin/bash
#
HOSTNAME="http://192.168.1.87:3000/data/systeminfo"
ID=5

while sleep 30;
do
OS=$(uname)
NODE=$(uname -n)
KERNEL=$(uname -r)
VERSION=$(uname -v)
ARCHITECTURE=$(uname -m)
PROCESSOR=$(uname -p)
USE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DATE=$(date +%s)
echo $DATE,$OS,$NODE,$KERNEL,$VERSION,$ARCHITECTURE,$PROCESSOR,$USE


curl "$HOSTNAME" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
--data @<(cat <<EOF
{"id":"$ID","system":"$OS","node":"$NODE","kernel":"$KERNEL","kernelversion":"$VERSION","architecture": "$ARCHITECTURE","processor":"$PROCESSOR","memoryused":"$USE","timestamp":"$DATE"}
EOF
);
done
