#!/usr/bin/env zsh
value=`echo "You typed: $1" | sed 's/\//\\\\\//g'`
echo $value
