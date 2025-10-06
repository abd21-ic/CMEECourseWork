#!/bin/sh
# Author: abd21@ic.ac.uk
# Script: ConcatenateTwoFiles.sh
# Descripton: Concatenate contents of two files
#
# Date: October 2025

cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3