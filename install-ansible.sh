#!/bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Run the script with root access"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is failed. pls check"
        exit 1
    else
        echo "$2 is Success"
    fi
}

echo "Script executed tieme: $(date)"

CHECK_ROOT

