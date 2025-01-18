#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status: $1"      # $1 is argument
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root priveleges"
    exit 1
fi 

dnf list installed git -y

VALIDATE $?