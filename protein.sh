#!/bin/sh

DB="db.csv"

while :; do
	printf 'Name: ' && read -r name
	printf 'Cal: ' && read -r cal
	printf 'Prot: ' && read -r prot

	ratio="$(printf '%s/%s\n' "$prot" "$cal" | bc -l)"

	printf '%s,%s\n' "$name" "$ratio" >>"$DB"

	sort -t, -k2 -o "$DB" "$DB"

	column -s, -t "$DB"
done
