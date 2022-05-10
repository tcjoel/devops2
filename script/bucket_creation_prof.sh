#!/bin/bash

while read line
do 
    echo "======|| checking $line ||======="
    b_check=$(aws s3 ls | awk '{print $3}' | grep -w "$line")
    if [ -z $b_check ]; then echo "bucket do not exist - creating bucket" && aws s3api create-bucket --bucket $line --region us-east-1; else echo "bucket alredy exist .... change the name bye " 
        continue
    fi

done < bucket_list.txt