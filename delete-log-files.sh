#!/bin/bash

APP_LOGS_DIR=/home/centos/app-logs

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.$DATE.log
FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +28)

echo "$FILES_TO_DELETE"

while read line
do
    echo "deleteing $line" &>>$LOGFILE
    rm -rf $line
done << "$FILES_TO_DELETE"    