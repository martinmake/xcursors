#!/usr/bin/env sh

SYMLINKS="$1"
DIRECTORY="$2"

while read line; do
	TARGET=./$(echo $line | cut -d' ' -f1)
	LINK_NAME="$DIRECTORY/$(echo $line | cut -d' ' -f2)"
	ln -sf $TARGET $LINK_NAME
done < "$SYMLINKS"
