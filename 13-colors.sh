#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Please run this script with root priveleges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is...$G SUCCESS $N"    
    fi
}

CHECK_ROOT

dnf installed list git 

if [ $? -ne 0 ]
then 
    echo "Git is not installed, going to install it..."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is installed already, nothing to do.."
fi

dnf installed list mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, going to install it..."
    dnf install mysqll -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed..nothing to do"
fi