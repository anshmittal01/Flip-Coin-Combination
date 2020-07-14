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


echo "------------------------"
echo "For Triplet simulation"


toss[TTT]=0
toss[TTH]=0
toss[THT]=0
toss[HTT]=0
toss[HTH]=0
toss[HHT]=0
toss[THH]=0
toss[HHH]=0

for ((flip=0;flip<$flipNumber;flip++))
do
	outcome=$((RANDOM%8))
	if [ $outcome -eq 0 ]
	then
		value=${toss[TTT]}
		toss[TTT]=$((value+1))
	elif [ $outcome -eq 1 ]
	then
		value=${toss[TTH]}
		toss[TTH]=$((value+1))
	elif [ $outcome -eq 2 ]
	then
		value=${toss[THT]}
		toss[THT]=$((value+1))
	elif [ $outcome -eq 3 ]
	then
		value=${toss[HTT]}
		toss[HTT]=$((value+1))
	elif [ $outcome -eq 4 ]
	then
		value=${toss[HHT]}
		toss[HHT]=$((value+1))
	elif [ $outcome -eq 5 ]
	then
		value=${toss[HTH]}
		toss[HTH]=$((value+1))
	elif [ $outcome -eq 6 ]
	then
		value=${toss[THH]}
		toss[THH]=$((value+1))
	else
		value=${toss[HHH]}
		toss[HHH]=$((value+1))
	fi
done


echo -n "Percent of TTT is :"
toss[TTT]=`echo "scale=2;${toss[TTT]}/$flipNumber*100"|bc`
echo "${toss[TTT]}%"

echo -n "Percent of TTH is :"
toss[TTH]=`echo "scale=2;${toss[TTH]}/$flipNumber*100"|bc`
echo "${toss[TTH]}%"

echo -n "Percent of THT is :"
toss[THT]=`echo "scale=2;${toss[THT]}/$flipNumber*100"|bc`
echo "${toss[THT]}%"

echo -n "Percent of HTT is :"
toss[HTT]=`echo "scale=2;${toss[HTT]}/$flipNumber*100"|bc`
echo "${toss[HTT]}%"

echo -n "Percent of HTH is :"
toss[HTH]=`echo "scale=2;${toss[HTH]}/$flipNumber*100"|bc`
echo "${toss[HTH]}%"

echo -n "Percent of HHT is :"
toss[TTT]=`echo "scale=2;${toss[HHT]}/$flipNumber*100"|bc`
echo "${toss[HHT]}%"

echo -n "Percent of THH is :"
toss[THH]=`echo "scale=2;${toss[THH]}/$flipNumber*100"|bc`
echo "${toss[THH]}%"

echo -n "Percent of HHH is :"
toss[HHH]=`echo "scale=2;${toss[HHH]}/$flipNumber*100"|bc`
echo "${toss[HHH]}%"