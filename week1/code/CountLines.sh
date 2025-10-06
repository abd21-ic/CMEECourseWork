#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: CountLines.sh
# Descripton: count the number of lines in a file
#
# Date: October 2025

NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo