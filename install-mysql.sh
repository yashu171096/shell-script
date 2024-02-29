#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "error please run this script with root access"
    exit 1
fi    

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "installation of my sql is error"
    exit 1
else
    echo "installation of my sql is success"
fi        