#!/bin/bash
read string

#print the string in reverse
echo $string | awk '{ for(i = length; i!=0; i--)x = x substr($0, i, 1);}END{print x}'

#replacing with subsequent letters
rev_string=$(echo "$string" | awk '{ for(i = length; i!=0; i--)x = x substr($0, i, 1);}END{print x}' | tr "0-9a-zA-Z" "1-9a-zA-Z_")
echo $rev_string

#reversing half the string
len=${#string}
half=$(echo $string | awk '{ for(i = length/2; i!=0; i--)x = x substr($0, i, 1);}END{print x}')
other_half=$(echo ${string:len/2})
echo $half$other_half