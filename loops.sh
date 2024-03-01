#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.$DATE.log

R=".\e[31m"
G=".\e[32m"
Y=".\e[33m"
N=".\e[0m"

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e "installing $2 is $R failed $N"
        exit 1
    else
        echo -e "installing $2 is $G success $N"
    fi    
}

if [ $USERID -ne 0 ];
then
    echo -e "$R ERROR::PLEASE USE THE SUDO ACCESS $N"
    exit 1
fi

for i in $@
do
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ];
    then
        echo "$i is not installed lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi        
done     