#!/bin/bash
#Command to remove blank lines
grep "\S" quotes.txt

echo
echo

#Command to remove blank lines and pipe the output into awk, to remove duplicate entries
grep "\S" quotes.txt | awk '!seen[$0]++'