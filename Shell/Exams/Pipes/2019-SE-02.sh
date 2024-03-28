find /home/SI -type d 2>/dev/null -printf "%T@ %u\n" | awk -F " " '$1>1551186000 && $1<1551176000 {print $2}' |
xargs -I{} grep {} /etc/passwd | cut -d ':' -f 1,5 | cut -d ',' -f 1 | cut -c 2-

