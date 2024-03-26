#!/bin/bash
# script to generate config file of alarms listed in file.txt
while read a
do
    filename="import_${a}.tf"
    # Create the file
    touch "$filename"

    # Update the file
    echo "import {" >  "$filename"
    echo "to = aws_cloudwatch_metric_alarm.$a" >> "$filename"
    echo "id = "\"$a\""" >> "$filename"
    echo "}" >> "$filename"
    echo "File $filename created and updated."
    mkdir $a
    mv $filename $a/
    cp provider.tf $a/
    cd $a/ && ls -l 
    terraform init && sleep 2
    terraform plan -generate-config-out=${a}.tf 2> /dev/null
    # manually create a directory call alarms to garther all your alarms_config file
    cp ${a}.tf ../alarms/
    cd ..
done < file.txt
