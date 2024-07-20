#!/bin/bash

# Set threshold values
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
ALERT_EMAIL="admin@example.com"

# Function to send alert
send_alert() {
    local message=$1
    echo "$message" | mail -s "Server Health Alert" $ALERT_EMAIL
}

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    send_alert "High CPU usage: $CPU_USAGE%"
fi

# Check memory usage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    send_alert "High Memory usage: $MEM_USAGE%"
fi

# Check disk usage
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    send_alert "High Disk usage: $DISK_USAGE%"
fi

# Log results
echo "CPU: $CPU_USAGE%, MEM: $MEM_USAGE%, DISK: $DISK_USAGE%" >> /var/log/server_health.log
