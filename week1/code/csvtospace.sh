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
    exit 1
 fi

 if [[ "$csv_file" != *.csv ]]; then
    echo "Input file must have a .csv extension or is not found"
    exit 1
 fi
