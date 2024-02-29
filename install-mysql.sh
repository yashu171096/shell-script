#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "installation of $2 is error"
    exit 1
else
    echo "installation of $2 is success"
fi        

}

if [ $USERID -ne 0 ]
then
    echo "error please run this script with root access"
    exit 1
fi    

yum install mysql -y
VALIDATE $? "mysql"

yum install postfix -y
VALIDATE $? "postfix"