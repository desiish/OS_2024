#!/bin/bash

if [[ ${#} -ne 2 ]]; then
        echo "Two arguments expected"
        exit 1
fi

if [[ ! -f $1 ]]; then
        echo "File expected"
        exit 2
fi

if [[ ! -d $2 ]]; then
        echo "Directory expected"
        exit 3
fi

file_="$1"
words=()
while IFS= read line; do
        words+=("$line")
done < "$file_"

files=$(find $2 -type f -name "*.txt")

for fl in ${files[@]}; do
        string=$(cat $fl)

        for word in ${words[@]}; do
                len=$(echo "$word" | wc -c)
                stars="$(echo "$(awk -v len=$len 'BEGIN {for (i=1; i<len; i++) printf "*"}')")"
                string="$(echo "$string" | sed "s/\b${word}\b/$stars/g")"
        done

        : > $fl
        echo "$string" > $fl
done
