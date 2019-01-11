#!/bin/bash
#
HOSTNAME="http://192.168.1.87:3000/data/temperature"
ID=5

while sleep 10;
do
cpuTemp0=$(cat /sys/class/thermal/thermal_zone0/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))
CPU=$cpuTemp1"."$cpuTempM
GPU=$(/opt/vc/bin/vcgencmd measure_temp | cut -d \' -f1 | cut -d = -f2)
DATE=$(date +%s) 

curl "$HOSTNAME" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
--data @<(cat <<EOF
{"id":"$ID","cpu_temp":"$CPU","gpu_temp":"$GPU","timestamp":"$DATE"}
EOF
); done
