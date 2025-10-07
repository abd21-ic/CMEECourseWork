#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: tabtocsv.sh
# Descripton: substitute the tabs in files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
#
# Date: October 2025

# ORIGINAL CODE
# 
# echo "Creating a comma delimited version of $1 ..."
#
# cat $1 | tr -s "\t" "," >> $1.csv
# 
# echo "Done!"
# 
# exit

echo "Please enter a file to convert to csv:"  
read file

file_path="week1/data/$file"

if [[ ! -f "$file_path" ]]; then
    echo "No file can be found under that input."
    exit 1
fi

echo "File found!"
echo "Creating a comma delimited version of $file ..."

cat "$file_path" | tr -s "\t" "," >> "week1/data/${file}.csv"

echo "File has been converted."