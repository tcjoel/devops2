#!/bin/bash

list_object=( "4" "9" "12" )
for obj in "${list_object[@]}"
do
    if [ $obj -gt "5" ] ; then echo $obj && pwd ; fi
done