#!/bin/bash

echo -e "Welcome to the Thacker Casino! - This is the slot machine program\n"


read -p "Enter the amount to start with      " amount


while true; do
    echo -e "\n1 to spin the slot machine, 2 to exit the game and display your amount"
    read val
    if [ ! "$val" -ne 2 ]; then
        echo -e "\nYour amount is : $amount"
        exit 0
    else
        if [ "$amount" -le 0 ]; then
            read -p "Enter the amount of money to add to your account     " addamount
            amount=$((addamount + amount))
            echo -e "\nAdded $addamount to account, total balance is : $amount\n"
        fi
        echo -e "\n"
        while true; do
            read -p "Enter the wager    " wager
            if [ "$wager" -gt "$amount" ]; then
                echo -e "\nWager is greater than amount, enter an amount less than or equal to amount\n"
            else
                echo -e "\nWager is : $wager\n"
                break
            fi
        done
        amount=$((amount-wager))
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
        letter1=${number:0:1}
        letter2=${number:1:1}
        letter3=${number:2:1}
        #echo "Letter 1 : $letter1, Letter 2 : $letter2, Letter 3 : $letter3"
        if [ "$letter1" == "$letter2" -a "$letter1" == "$letter3" -a "$letter1" -eq 7 ]; then
            amountwon=$((wager * 10000))
            echo "Congratulations! Jackpot victory : Payout -> $amountwon!"
            amount=$((amount+amountwon))
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter1" -eq "$letter2" -a "$letter2" -eq "$letter3" -a "$letter1" -ne 7 ]; then
            amountwon=$((wager * 20))
            echo "Congratulations! You won $amountwon!"
            amount=$((amount + amountwon))
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter1" == "$letter2" -a "$letter1" -eq 7 ]; then
            amountWon=$((wager * 10))
            echo "Congratulations! You won $amountwon"
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter2" -eq "$letter3" -a "$letter3" -eq 7 ]; then
            amountwon=$((wager * 10))
            echo "Congratulations! You won $amountwon"
            amount=$((amountwon + amount))
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter1" == "$letter2" ]; then
            amountwon=$((wager * 5))
            echo "Congratulations! You won $amountwon"
            amount=$((amount+amountwon))
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter1" == "$letter3" ]; then
            amountwon=$((wager * 5))
            echo "Congratulations! You won $amountwon"
            amount=$((amount+amountwon))
            echo -e "\nYour amount : $amount\n"
        elif [ "$letter2" == "$letter3" ]; then
            amountwon=$((wager * 5))
            echo "Congratulations! You won $amountwon"
            amount=$((amount+amountwon))
            echo -e "\nYour amount : $amount\n"
        else
            echo -e "\nYour amount : $amount\n"
            echo "next round"
        fi
    fi
done

