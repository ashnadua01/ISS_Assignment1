#!/bin/bash
read file_name

#Size of file in bytes
wc -c $file_name | awk '{print $1}'

echo 

#Total number of lines in file
wc -l $file_name | awk '{print $1}'

echo

#Total number of words in a file
wc -w $file_name | awk '{print $1}'

echo

#Number of words in each line
IFS=$'\n'
number=1
while read line; 
do
    printf "Line No: <$number> - Count of Words: ";
    wc -w <<< "$line" | awk '{ print "[" $1 "]" }';
    ((number++))
done < $file_name

echo

#Frequency of each word in a file, removing punctuation and converting all words to lower case
sed -e  's/[^A-Za-z]/ /g' $file_name | tr ' ' '\n' | awk 'BEGIN { FS="[^a-zA-Z]+" } {
        for (i=1; i<=NF; i++) {
            word = tolower($i)
            words[word]++
        }
    }
    END {
        for (w in words)
            if (words[w]!=1)
            {
                printf("Word: <%s> - Count of repitition: [%d]\n", w, words[w]);
            }
    } '
