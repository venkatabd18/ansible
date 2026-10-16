#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "run the script with root access"
fi

dnf list installed anible
if [ $? -ne 0 ]
then
    echo "Ansible not installed. installing now"
    dnf install ansible -y
    if [ $? -ne 0 ]
    then
        echo "ansible instalation failed.. pls check"
        exit 1
    else
        echo "Ansible installed Successfully"
    fi
else
    echo "Ansible already installed"
fi