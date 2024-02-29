#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME.$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo -e "installing of $Y $2 is $R failed $N"
    exit 1
else
    echo "installing of $Y $2 is $G success $N"
fi        

}

if [ $USERID -ne 0 ]
then
    echo "error please run this script with root access"
    exit 1
fi    

yum install mysql -y &>>$LOGFILE
VALIDATE $? "mysql"

yum install postfix -y &>>$LOGFILE
VALIDATE $? "postfix"