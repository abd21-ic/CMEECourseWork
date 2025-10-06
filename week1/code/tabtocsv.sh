#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: tabtocsv.sh
# Descripton: substitute the tabs in files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
#
# Date: October 2025


echo "Creating a comma delimited version of $1 ..."

cat $1 | tr -s "\t" "," >> $1.csv

echo "Done!"

exit