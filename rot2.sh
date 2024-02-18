#!/bin/bash

encstr=$(cat bigfind)

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


alphabet1="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
alphabet2="QAZWSXEDCOLVTGBYRNUJMIKFPH"
alphabetlength=${#alphabet}

# Loop through each character in the encstr and decrypt it using the character at the same index in the second alphabet

for (( i=0; i<${#encstr}; i++ )); do
    char=${encstr:$i:1}

    # check if the character is in the alphabet
    if [[ $alphabet1 != *"$char"* ]]; then
        echo -n "$char"
        continue
    fi

    # get the position of the character in the alphabet
    pos=$(expr index "$alphabet1" "$char")
    newchar=${alphabet2:$pos-1:1}

    echo -n "$newchar"
done

 