#!/usr/bin/env zsh
length=$(echo $1 | wc -c)
if [[ $length -gt 150 ]]; then
    echo "$length characters is too many!"
else
    date_val=$(date)
    text="<p>$1<\/p>\n<p class=\"footnote\">\n<time class=\"\">$date_val<\/time>\n"
    sed -i "s/<\!-- Watermark -->/<\!-- Watermark -->\n$text/g" ~/micro/index.html
    cp ~/micro/index.html ~/blog/public/micro/
    cp ~/micro/index.html ~/html/micro/
fi
