#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: CountLines.sh
# Descripton: count the number of lines in a file
#
# Date: October 2025


# input file 
read -p "Enter a filename: " filename

# error messages 
if [ -z "$filename" ]; then
  echo "Error: No filename supplied"
  exit 1
fi

if [ ! -f "$filename" ]; then
  echo "Error: File does not exist"
  exit 1
fi

# count number of lines
NumLines=$(wc -l < "$filename")
echo "The file $filename has $NumLines lines"
echo