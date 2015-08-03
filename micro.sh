#!/usr/bin/env zsh
length=$(echo $1 | wc -c)
if [[ $length -gt 150 ]]; then
    echo "$length characters is too many!"
else
    date_val=$(date)
    if [[ ! -z $2 && ! -z $3 ]]; then
        value="$1 > <a href=\"$2\">$3<\/a>"
    else
        value=$1
    fi
    text="<p>$value<\/p>\n<p class=\"footnote\">\n<time class=\"blogtime\">$date_val<\/time>\n"
    sed -i "s/<\!-- Watermark -->/<\!-- Watermark -->\n$text/g" ~/micro/index.html
    cp ~/micro/index.html ~/blog/static/micro/
    cp ~/micro/index.html ~/html/micro/
fi
