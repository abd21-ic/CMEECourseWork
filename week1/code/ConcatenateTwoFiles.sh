#!/bin/bash
# Author: abd21@ic.ac.uk
# Script: concatenatetwofiles.sh
# Descripton: Concatenate contents of two files
# Date: October 2025

# ORIGINAL CODE
#
#cat $1 > $3
#cat $2 >> $3
#echo "Merged File is"
#cat $3

# input from user
echo "Please enter the first file to concatenate:"  
read file_1

# checking first file path
file_path_1="week1/data/$file_1"

# error messages if no file found
if [[ ! -f "$file_path_1" ]]; then
    echo "No file can be found under that input."
    exit 1
fi

# repeat for second file
echo "Please enter the second file to concatenate:"  
read file_2

file_path_2="week1/data/$file_2"

if [[ ! -f "$file_path_2" ]]; then
    echo "No file can be found under that input."
    exit 1
fi

# combining files
echo "Please name your combined file..."
read concatenate_file

echo "Combining files..." 
cat $file_path_1 > "week1/data/$concatenate_file"
cat $file_path_2 >> "week1/data/$concatenate_file"