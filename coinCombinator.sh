#!/bin/bash

read -p "enter number of flips " flipNumber
declare -A toss
toss[H]=0
toss[T]=0
for ((flip=0;flip<$flipNumber;flip++))
do
	outcome=$((RANDOM%2))
	if [ $outcome -eq 0 ]
	then
		value=${toss[H]}
		toss[H]=$((value+1))
	else
		value=${toss[T]}
		toss[T]=$((value+1))
	fi
done
echo -n "Percent of heads is :"
echo "scale=2;${toss[H]}/$flipNumber*100"|bc
echo -n "Percent of tails is :"
echo "scale=2;${toss[T]}/$flipNumber*100"|bc
