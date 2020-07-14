#!/bin/bash

read -p "enter number of flips " flipNumber
declare -A toss
echo "For Singlet simulation"
toss[H]=0
toss[T]=0
for ((flip=0;flip<$flipNumber;flip++))
do
	outcome=$((RANDOM%2))
	if [ $outcome -eq 0 ]
	then
		valueue=${toss[H]}
		toss[H]=$((valueue+1))
	else
		valueue=${toss[T]}
		toss[T]=$((valueue+1))
	fi
done
echo -n "Percent of heads is "
echo "scale=2;${toss[H]}/$flipNumber*100"|bc
echo -n "Percent of tails is "
echo "scale=2;${toss[T]}/$flipNumber*100"|bc

echo "-------------------------"
echo "For Doublet simulation"

toss[HH]=0
toss[TT]=0
toss[TH]=0
toss[HT]=0


for ((flip=0;flip<$flipNumber;flip++))
do
	outcome=$((RANDOM%4))
	if [ $outcome -eq 0 ]
	then
		value=${toss[HH]}
		toss[HH]=$((value+1))
	elif [ $outcome -eq 1 ]
	then
		value=${toss[TT]}
		toss[TT]=$((value+1))
	elif [ $outcome -eq 2 ]
	then
		value=${toss[HT]}
		toss[HT]=$((value+1))
	else
		value=${toss[TH]}
		toss[TH]=$((value+1))
	fi
done

echo -n "Percent of HH is "
toss[HH]=`echo "scale=2;${toss[HH]}/$flipNumber*100"|bc`
echo "${toss[HH]}%"

echo -n "Percent of TT is "
toss[TT]=`echo "scale=2;${toss[TT]}/$flipNumber*100"|bc`
echo "${toss[TT]}%"

echo -n "Percent of HT is "
toss[HT]=`echo "scale=2;${toss[HT]}/$flipNumber*100"|bc`
echo "${toss[HT]}%"

echo -n "Percent of TH is "
toss[TH]=`echo "scale=2;$value/$flipNumber*100"|bc`
echo "${toss[TH]}%"

