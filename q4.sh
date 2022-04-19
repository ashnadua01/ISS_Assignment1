#!/bin/bash
declare -a array
IFS=','
read -a array

len=${#array[@]}
for ((i=0; i<$len; i++));
do
    for ((j=$i+1; j<$len; j++));
    do 
        if [ ${array[i]} -gt ${array[j]} ]
        then
            temp=${array[i]}
            array[i]=${array[j]}
            array[j]=$temp
        fi
    done
done

for ((i=0; i<$len; i++));
do
    echo ${array[i]}
done