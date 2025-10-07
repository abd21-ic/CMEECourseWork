#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: tiff2png.sh
# Descripton: Convert tiff file to png file
#
# Date: October 2025

# ORIGINAL CODE
#for f in *.tif;
#    do
#        echo "Converting $f";
#        convert "$f" "$(basename "f" .tif).png";
#    done

echo "Please enter the .tif file to convert to .png:"  
read f

if [[ "$f" != *.tif ]]; then
    echo "Input file must have a .tif extension."
    exit 1
fi

file_path="week1/data/$f"

if [[ ! -f "$file_path" ]]; then
    echo "No file can be found under that input."
    exit 1
fi

echo "Converting $f"; 
convert "$file_path" "week1/data/$(basename "$f" .tif).png"