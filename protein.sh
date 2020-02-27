#!/bin/sh

DB="db.csv"
sort -t, -k2 -o "$DB" "$DB"
column -s, -t "$DB"

while :; do
	echo
	printf 'Name: ' && read -r name
	printf 'Cal: ' && read -r cal
	printf 'Prot: ' && read -r prot

	ratio="$(printf '%s/%s\n' "$prot" "$cal" | bc -l)"

	printf '%s,%s\n' "$name" "$ratio" >>"$DB"

	echo

	sort -t, -k2 -o "$DB" "$DB"
	column -s, -t "$DB"
done
