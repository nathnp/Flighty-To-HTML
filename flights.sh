#!/bin/bash

# Input CSV file
INPUT_CSV="$1"
OUTPUT_HTML="content/flights/flights.html"

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
        route = $4 " ✈ " $5;
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

