cat spacex.txt | awk -F '|' -v cosm=$(cat spacex.txt | cut -f2,3 -d '|' | sort -k1 | cut -f1 -d ' ' |
uniq -c | sort -k 1nr | head -n 1 | cut -f 1 -d ' ') '$2==cosm {print $1 " " $3 ":" $4}' | sort -k 1nr | head -n 1 | cut -f2 -d ' '
