#!/bin/bash

COMPANY="unicorndigital"
NAME1=$(aws iam get-group --group-name LAB | grep jean | sed 2d | cut -c 26-29)
NAME2=$(aws iam get-group --group-name LAB | grep jhon | sed 2d | cut -c 26-29)
devteam="$NAME1 $NAME2"
for x in $devteam

do 
    if [ $1="mb" ]
    then 
        aws s3 $1 s3://$x-$COMPANY-devteam
    else
        echo "no bucket created for $x"
    fi 
done