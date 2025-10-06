#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: csvtospace.sh
# Descripton: change .csv to space separated file
#
#
# Date: October 2025

csv_file=""

echo "Please enter a csv file name:"   
read csv_file
echo "You have input:" $csv_file
        
if [[ "$csv_file" != *.csv ]]; then
    echo "Input file must have a .csv extension."
    exit 1
fi

if [[ "$csv_file" = *.csv ]]; then
    echo "Processing..."
fi

file_path="week1/data/temperature/$csv_file"

if [[ ! -f "$file_path" ]]; then
    echo "No .csv file found under that input."
    exit 1
fi

echo "File found!"
echo "Converting to space separated file."

output_file="${csv_file%.csv}.txt"

tr ',' ' ' < "$file_path" > "$output_file"

