#!/bin/bash

if [ -z "$PASSWD" ]; then
    lu=$(cat /etc/passwd)
    lu_arr=$(cat /etc/passwd | cut -d ':' -f1)
else
    lu=$(cat "$PASSWD")
    lu_arr=$(cat "$PASSWD" | cut -d ':' -f1)
fi

pu=$(./occ user:list)
pu_arr=$(./occ user:list | grep "user_id" | cut -d ':' -f2 | tr -d ' ')

for user in ${lu_arr[@]}; do
        if echo "$pu" | grep -q "$user"; then
                if echo $(./occ user:info $user) | grep -q "disable"
                        ./occ user:enable $user
                fi
        else
                ./occ user:add $user
        fi
done

for user in ${pu_arr[@]}; do
        if ! echo "$lu" | grep -q "$user"; then
                if echo $(./occ user:info) | grep -q "enable"; then
                        ./occ user:disable $user
                fi
        fi
done
