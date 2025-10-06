#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: tiff2png.sh
# Descripton: Convert tiff file to png file
#
# Date: October 2025

for f in *.tif;
    do
        echo "Converting $f";
        convert "$f" "$(basename "f" .tif).png";
    done