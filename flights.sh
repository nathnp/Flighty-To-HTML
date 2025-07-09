#!/bin/bash

# Input CSV file
INPUT_CSV="$1"
OUTPUT_HTML="flights.html"
STATS_HTML="stats.html"

# Ensure an input file is provided
if [[ -z "$INPUT_CSV" ]]; then
    echo "Usage: $0 input.csv"
    exit 1
fi

# Extract the required columns and generate an HTML table
{
    echo "<table border='1'>"
    echo "<tr><th>Date</th><th>Airline</th><th>Flight</th><th>Route</th><th>Aircraft Type Name</th><th>Tail Number</th></tr>"
    
    # Read CSV and extract required columns with airline name replacement, storing lines in an array
    tail -n +2 "$INPUT_CSV" | awk -F',' 'BEGIN {
        OFS="</td><td>";
        airline["SWA"] = "Southwest";
        airline["DAL"] = "Delta";
        airline["NKS"] = "Spirit";
    }
    {
        if ($26 == "CREW") {
            $2 = "Crew Flight";
        } else {
            $2 = ($2 in airline) ? airline[$2] : $2;
        }
	route = "<code><a href=\"https://www.flightradar24.com/data/airports/" tolower($4) "\" target=\"_blank\" rel=\"noreferrer\">" $4 "</a></code> ✈ <code><a href=\"https://www.flightradar24.com/data/airports/" tolower($5) "\" target=\"_blank\" rel=\"noreferrer\">" $5 "</a></code>";
        lines[NR] = "<tr><td>" $1 OFS $2 OFS $3 OFS route OFS $20 OFS $21 "</td></tr>";
    }
    END {
        for (i = NR; i > 0; i--) {
            print lines[i];
        }
    }'
    
    echo "</table>"
} > "$OUTPUT_HTML"



echo "HTML table has been created in $OUTPUT_HTML"

#Total flights | airports | airlines | Aircraft types

{
    
    echo "<table border='1'>"
    echo "<tr><th>Flights</th><th>Airports</th><th>Airlines</th><th>Aircraft</th></tr>"
    
} > "$STATS_HTML"

flights=$(( $(wc -l < "$INPUT_CSV") - 1 ))
airlines=$(awk -F',' 'NR > 1 { unique[$2] } END { print length(unique) }' "$INPUT_CSV")
airports=$(awk -F',' 'NR > 1 { unique[$4]; unique[$5] } END { print length(unique) }' "$INPUT_CSV")
aircraft=$(awk -F',' 'NR > 1 { unique[$20] } END { print length(unique) }' "$INPUT_CSV")

{
    
    echo "<tr><td>$flights</td><td>$airports</td><td>$airlines</td><td>$aircraft</td></tr>"
    echo "</table>"
    
} >> "$STATS_HTML"
