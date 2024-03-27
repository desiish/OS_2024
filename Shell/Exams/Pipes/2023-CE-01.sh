find / -user $(id -u) -type f 2>/dev/null -printf "%p\n" | grep -e "\.blend[0-9][0-9]*$"
