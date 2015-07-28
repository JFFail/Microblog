#!/usr/bin/env zsh
length=$(echo $1 | wc -c) 

if [[ $length -gt 200 ]]; then
    echo "$length characters is too many!"
fi
