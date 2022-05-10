#!/bin/bash

echo "what is your name"
read Name
if [ "$Name" == "joel" ]
then
  echo "your name is joel"
elif [ "$Name" == "jules" ]
then
  echo "Your name is jules"
elif [ "$Name" == "john" ]
  then
  echo "your name is john"
else
  echo "Your name is not joel or jules"
fi