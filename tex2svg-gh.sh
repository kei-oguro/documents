#! /bin/sh


tex2svg1() {
    if [ "$1" == "" ] ; then
        echo specify output file name.
        exit
    fi
    if [ "$4" != "" ] ; then
        tex2svg "$4" > "$1".svg
    else
        xargs --null tex2svg > "$1".svg < /dev/clipboard
    fi
    cat "$1".svg | sed s/\\bcurrentColor\\b/"$3"/g > "$1"."$2".svg
}

tex2svg1 "$1" black "#404040" "$2"
tex2svg1 "$1" white "#c0c0c0" "$2"
