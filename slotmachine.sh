#!/bin/bash

echo "Welcome to the Thacker Casino! - This is the slot machine program"


read -p "Enter the amount to start with" amount


while true; do
    echo -e "\n1 to spin the slot machine, 2 to exit the game and display your amount"
    read val
    if [ ! "$val" -eq 1 ]; then
        echo -e "\nYour amount is : $amount"
        exit 0
    else
        echo -e "Spinning\n"
        numbers=""
        sleep 1
        randomnumber=$(shuf -i 1-7 -n 1)
        numbers="$randomnumber"
        echo "$randomnumber"
        sleep 1
        randomnumber=$(shuf -i 1-7 -n 1)
        numbers="${numbers}${randomnumber}"
        echo "$randomnumber"
        sleep 1
        randomnumber=$(shuf -i 1-7 -n 1)
        number="${numbers}${randomnumber}"
        echo "$randomnumber"
        letter1=${randomnumber:0:1}
        letter2=${randomnumber:1:1}
        letter3=${randomnumber:2:1}
        echo "Letter 1 : $letter1, Letter 2 : $letter2, Letter 3 : $letter3"
    fi
done

