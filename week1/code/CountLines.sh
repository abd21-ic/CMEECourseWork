#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: CountLines.sh
# Descripton: count the number of lines in a file
#
# Date: October 2025

if [ -z "$1" ]; then
  echo "Error: No filename supplied"
  exit 1
fi

NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo