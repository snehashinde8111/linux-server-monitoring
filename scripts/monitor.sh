#!/bin/bash

LOGFILE="/root/linux-server-monitoring/logs/server_monitor.log"

echo "===== Server Monitoring Report =====" >> $LOGFILE
echo "Date: $(date)" >> $LOGFILE

echo "CPU Usage:" >> $LOGFILE
top -bn1 | grep "Cpu(s)" >> $LOGFILE

echo "Memory Usage:" >> $LOGFILE
free -h >> $LOGFILE

echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

echo "Running Services:" >> $LOGFILE
systemctl --type=service --state=running >> $LOGFILE

echo "====================================" >> $LOGFILE
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

if [ "$CPU_USAGE" -gt 80 ]; then
    echo "WARNING: CPU Usage is above 80% ($CPU_USAGE%)" >> $LOGFILE
else
    echo "CPU Usage is Normal ($CPU_USAGE%)" >> $LOGFILE
fi
MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

if [ "$MEMORY_USAGE" -gt 80 ]; then
    echo "WARNING: Memory Usage is above 80% ($MEMORY_USAGE%)" >> $LOGFILE
else
    echo "Memory Usage is Normal ($MEMORY_USAGE%)" >> $LOGFILE
fi
DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk Usage is above 80% ($DISK_USAGE%)" >> $LOGFILE
else
    echo "Disk Usage is Normal ($DISK_USAGE%)" >> $LOGFILE
fi
echo "Service Status:" >> $LOGFILE

for service in sshd crond NetworkManager
do
    if systemctl is-active --quiet $service
    then
        echo "$service : Running" >> $LOGFILE
    else
        echo "WARNING: $service is DOWN" >> $LOGFILE
    fi
done    
echo "Service Status:" >> $LOGFILE

for service in sshd crond NetworkManager
do
    if systemctl is-active --quiet $service
    then
        echo "$service : Running" >> $LOGFILE
    else
        echo "WARNING: $service is DOWN" >> $LOGFILE
    fi
done

