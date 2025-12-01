#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: csvtospace.sh
# Descripton: change .csv to space separated file
#
#
# Date: October 2025

# ask user to input a .csv file
echo "Please enter a csv file name:"   
read csv_file
echo "You have input:" $csv_file

# validate input ends with .csv    
if [[ "$csv_file" != *.csv ]]; then
    echo "Input file must have a .csv extension."
    exit 1
fi

# confirmation message
if [[ "$csv_file" = *.csv ]]; then
    echo "Processing..."
fi

# construct full path to input file
file_path="week1/data/temperature/$csv_file"

# check file exists in expected directory
if [[ ! -f "$file_path" ]]; then
    echo "No .csv file found under that input."
    exit 1
fi

echo "File found!"
echo "Converting to space separated file."

# replace .csv with .txt
output_file="week1/data/temperature/${csv_file%.csv}.txt"

# change commas to spaces and write to the output file
tr ',' ' ' < "$file_path" > "$output_file"

# notification of completion
echo "Converted file saved in: $output_file"