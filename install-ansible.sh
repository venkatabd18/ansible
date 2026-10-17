#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$Y Run the script with root access $N"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 is failed $N. pls check"
        exit 1
    else
        echo -e "$R $2 is Success $N"
    fi
}

CHECK_ROOT

echo -e "$Y Script executed tieme: $(date) $N"

dnf list installed ansible
if [ $? -ne 0 ]
then
    echo "ansible not installed. installing now"
    dnf install ansible -y
    VALIDATE $? "Ansible instalation"
else
    echo "Ansible already installed. Nothing to do"
fi