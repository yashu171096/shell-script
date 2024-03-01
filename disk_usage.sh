#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


DISK_USAGE=$(df -hT | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=1
message=""

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f1)
    PARTITION=$(echo $line | awk '{print $1}')
    if [ $USAGE -gt $DISK_USAGE_THRESHOLD ];
    then
        message+="HIGH DISK USAGE ON $PARTITION: $USAGE"
    fi
done <<< $DISK_USAGE

sh mail.sh yashu24710@gmail.com "HIGH DISK USAGE" "$message" "devops team" "MORE DISK USAGE"
echo "$message"