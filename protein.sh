#!/bin/sh

TMP="$(mktemp)"

trap 'rm -f "$TMP"' EXIT

while :; do
	printf 'Name: ' && read -r name
	printf 'Cal: ' && read -r cal
	printf 'Prot: ' && read -r prot
	printf 'Carbs: ' && read -r carbs

	ratio="$(printf '%s/(%s*%s)\n' "$prot" "$cal" "$carbs" | bc -l)"
	
	printf '%s,%s\n' "$name" "$ratio" >> "$TMP"
	column -s, -t "$TMP" | sort -k2
done
