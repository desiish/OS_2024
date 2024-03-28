find /home/velin -type f -printf "%i %d\n"| awk -F " " -v var=$(find /home/velin -type f -printf "%T@ %i\n" | 
sort -k 1nr | head -n 1 | cut -d ' ' -f 2) '$1==var {print $2}' | sort -k 1n | head -n 1
