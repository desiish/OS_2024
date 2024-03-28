find ~ -type f -perm 755 | xargs -I{} chmod g+w {}
