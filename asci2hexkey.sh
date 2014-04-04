#!/bin/bash
#
# asci2hexkey.sh
# Coverts ascii key to hex on the fly

ASCIKEY=""
echo "Type in ascii wifi key:"
while read -s -n 1 ASCHAR; do
	[ "$ASCHAR" = "" ] && break
	printf "%X" $(printf "%d" \'"$ASCHAR"\')
	ASCIKEY=${ASCIKEY}${ASCHAR}
done

echo " = ascii key \"$ASCIKEY\""
