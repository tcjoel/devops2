#!/bin/bash

rm jjj
c=$(echo $?)
echo $c

if [ $c == 0 ]
then
  echo "the terraform config file is valide, we can plan"
else
  echo "Your config file is not valide" && exit 1
fi
