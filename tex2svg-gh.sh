#! /bin/sh

if [ "$1" == "" ] ; then
    echo specify output file name.
    exit
fi

EXPRESSION="$2"
if [ "$EXPRESSION" == "" ] ; then
    EXPRESSION=`cat /dev/clipboard`
fi

tex2svg "$EXPRESSION" > "$1".svg
echo "![]($1.svg)"
