find ~ -type f -maxdepth 1 -user $(whoami) | xargs -I{} chmod 775 {} >/dev/null 2>&1
