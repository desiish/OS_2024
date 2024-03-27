find /var/logs/my_logs -mindepth 1 -type f -regex "^[a-zA-Z_0-9][a-zA-Z_0-9]*_[0-9][0-9]*\.log$"| xargs -I{} grep -o  "error" {} | wc -l
