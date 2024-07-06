#!/bin/bash

set -e

tmp=$(mktemp)
echo

readonly FILE="references.csv"
readonly CSV_SORT_COLUMNS="region,name,by"
echo -e "Start reordering file: $FILE ($CSV_SORT_COLUMNS)\n"
# Error Case: RuntimeWarning: Error sniffing CSV dialect: Could not determine delimiter
# Solution: https://csvkit.readthedocs.io/en/1.0.0/tricks.html
csvsort -I --snifflimit 0 -d ',' -q '"' -c "$CSV_SORT_COLUMNS" "$FILE" > "$tmp" && mv "$tmp" "$FILE"

echo -e "\nDone.\n"
