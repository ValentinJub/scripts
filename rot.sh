#!/bin/bash

encstr=$1

# # if rotval or encstr is empty, print usage and exit

# if [ -z "$rotval" ] || [ -z "$encstr" ]; then
#     echo "Usage: $0 <rotation value> <string to encrypt>"
#     exit 1
# fi

# # if rotval is not a number, print usage and exit

# if ! [[ "$rotval" =~ ^[0-9]+$ ]]; then
#     echo "Usage: $0 <rotation value> <string to encrypt>"
#     exit 1
# fi

# # if encstr is not a string, print usage and exit

# if ! [[ "$encstr" =~ ^[a-zA-Z]+$ ]]; then
#     echo "Usage: $0 <rotation value> <string to encrypt>"
#     exit 1
# fi


alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabetlength=${#alphabet}

# Loop through each character in the encstr and decrypt it using the rotation value

for rotval in {0..25}; do
    printf "\nROT$rotval:\t"
    for (( i=0; i<${#encstr}; i++ )); do
        char=${encstr:$i:1}

        # check if the character is in the alphabet
        if [[ $alphabet != *"$char"* ]]; then
            echo -n "$char"
            continue
        fi

        # get the position of the character in the alphabet
        pos=$(expr index "$alphabet" "$char")
        newpos=$(expr $pos + $rotval)
        if [ $newpos -gt $alphabetlength ]; then
            newpos=$(expr $newpos - $alphabetlength)
        fi

        # get the character at the new position
        char=${alphabet:$newpos-1:1}

        echo -n "$char"
    done
done

 