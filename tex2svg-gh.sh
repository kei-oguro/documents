#! /bin/sh


tex2svg1() {
    if [ "$1" == "" ] ; then
        echo specify output file name.
        exit
    fi
    if [ "$3" != "" ] ; then
        tex2svg "$3" > "$1".svg
    else
        xargs --null tex2svg > "$1".svg < /dev/clipboard
    fi
    cat "$1".svg | sed s/\\bcurrentColor\\b/"$2"/g > "$1"."$2".svg
}

tex2svg1 "$1" black "$2"
tex2svg1 "$1" white "$2"
