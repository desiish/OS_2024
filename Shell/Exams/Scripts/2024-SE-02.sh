#!/bin/bash

input=$(echo "$@" | tr -s ' ' | tr ' ' '\n')

files=$(echo "$input" | grep -e '^[^-]')

swaps=$(echo "$input" | grep -e '^[-]' | xargs -I {} sh -c 'echo {} | cut -c 2-')

for swap in ${swaps[@]}; do
        first="$(echo "$swap" | cut -d '=' -f1)"
        second="$(echo "$swap" | cut -d '=' -f2)"
        for f in ${files[@]}; do
                echo $(cat "$f" | sed "s/\b"$first"\b/"$second"/g") > "$f"
        done
done
