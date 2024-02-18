#!/bin/bash

# Program to countdown from a given number

echo -e "\n ~~~ Countdown ~~~ \n"

# check given number $1 > 0
# if not ask for another number > 0
# loop and countdown

if(( $1 > 0 )) 
then 
    echo param is over 0
else
    echo param is not over 0
fi
