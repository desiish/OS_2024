#!/bin/bash

if [[ ${#} -ne 1 ]]; then
        echo "One arg expected"
        exit 1
fi

if [[ ! -d $1 ]]; then
        echo "Dir expected"
        exit 2
fi

temp="temp.txt"
touch "$temp"

dir="$1"

files=$(find $dir -type f)
files_count=$(( $(find $dir -type f | wc -l) / 2 ))
echo "$filec_count"
for file in ${files[@]}; do
        words=$(cat "$file" | grep -oe "^[a-z][a-z]*$")
        for word in ${words[@]}; do
                if ! cat "$temp" | grep -q "$word"; then
                        ctr=0
                        ctr_f=0
                        for f in ${files[@]}; do
                                count=$(cat "$f" | grep -o "$word" | wc -l)
                                ctr=$(echo "$count + $ctr" | bc)
                                if [ ! $count -lt 3 ]; then
                                        ctr_f=$((ctr_f + 1))
                                fi
                        done
                        if [ ! $ctr_f -lt $files_count ]; then
                                echo "$word $ctr $ctr_f" >> "$temp"
                        fi
                fi
        done
done

echo "$(cat "$temp" | sort -nr -k3 | sort -nr -k2 | head -n10)" > "$temp"
echo "$(cat "$temp" | cut -d ' ' -f1)"
rm "$temp"
