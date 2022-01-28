#! /bin/sh


tex2svg1() {
    if [ "$1" == "" ] ; then
        echo specify output file name.
        exit
    fi
    tex2svg "$4" > "$1".svg
    cat "$1".svg | sed s/\\bcurrentColor\\b/"$3"/g > "$1"."$2".svg
    echo "![]($1.$2.svg#gh-$2-mode-only)"
}

EXPRESSION="$2"
if [ "$EXPRESSION" == "" ] ; then
    EXPRESSION=`cat /dev/clipboard`
fi

tex2svg1 "$1" light "#404040" "$EXPRESSION"
tex2svg1 "$1" dark "#c0c0c0" "$EXPRESSION"
