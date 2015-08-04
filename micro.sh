#!/usr/bin/env zsh
#Function to define the usage of the application.
usage() {
    echo "micro - Microblogging script for SDF!"
    echo "Usage: micro -p \"Post content.\" [-u \"URL\" | -t \"URL pretty text\"]"
    echo "  -p          Basic, text-only post."
    echo "  -u          Text post with a URL. URL text is the URL itself."
    echo "  -t          Text post with URL. URL has friendly text."
    echo "  -h          Displays this help dialog."
}

#Display the help if no parameters or -h are given.
if [[ $# -eq 0 || $1 == "-h" ]]; then
    usage
    exit
fi

#Figure out how much the user specified.
nextpost=false
nexturl=false
nexttext=false
for var in "$@"; do
    if $nextpost; then
        post=$var
        nextpost=false
    elif $nexturl; then
        url=$var
        nexturl=false
    elif $nexttext; then
        text=$var
        nexttext=false
    else
        if [[ $var == "-p" ]]; then
            nextpost=true
        elif [[ $var == "-u" ]]; then
            nexturl=true
        elif [[ $var == "-t" ]]; then
            nexttext=true
        fi
    fi
done

#Parse the slashes in a URL. Assign the same value to text if it wasn't given something else.
url=`echo $url | sed 's/\//\\\\\//g'`
if [[ -z $text && ! -z $url ]]; then
    text=$url
fi

#Final parsing and writing the data.
length=$(echo $post | wc -c)
if [[ $length -gt 150 ]]; then
    echo "$length characters is too many!"
else
    date_val=$(date)
    if [[ ! -z $url ]]; then
        value="$post > <a href=\"$url\">$text<\/a>"
    else
        value=$post
    fi
    text="<p>$value<\/p>\n<p class=\"footnote\">\n<time class=\"blogtime\">$date_val<\/time>\n<\/p>\n"
    sed -i "s/<\!-- Watermark -->/<\!-- Watermark -->\n$text/g" ~/micro/index.html
    cp ~/micro/index.html ~/blog/static/micro/
    cp ~/micro/index.html ~/html/micro/
fi
