#!/bin/bash
#grep command to remove blank lines
#awk command to manipulate the quote
grep "\S" quotes.txt | awk -F '~' '{ print $2 " once said, " "\x22" $1 "\x22" }' > speech.txt