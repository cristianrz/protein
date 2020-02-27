#!/bin/sh

cleanup(){
	mv "$TMP" "$db"
}

TMP="$(mktemp)"
trap 'cleanup' EXIT

printf 'Database: ' && read -r db

while :; do
	printf 'Name: ' && read -r name
	printf 'Cal: ' && read -r cal
	printf 'Prot: ' && read -r prot

	ratio="$(printf '%s/%s\n' "$prot" "$cal" | bc -l)"
	
	printf '%s,%s\n' "$name" "$ratio" >> "$TMP"
	column -s, -t "$TMP" | sort -k2
done
