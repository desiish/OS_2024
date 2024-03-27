find /var/logs/my_logs -type f -printf "%f\n" | grep -e "^[a-zA-Z_0-9][a-zA-Z_0-9]*_[0-9][0-9]*\.txt$" | xargs -I{} cat {} | grep -o "error" | wc -l

