#!/bin/bash
# Author: abd21@ic.ac.uk
# Script: compilelatex.sh
# Desc: compile LaTeX file with bibtex
# Date: Oct 2025

#ORIGINAL CODE
#pdflatex $1.tex
#bibtex $1
#pdflatex $1.tex
#pdflatex $1.tex
#evince $1.pdf &
#
## Cleanup
#rm *.aux
#rm *.log
#rm *.bbl
#rm *.blg

# check filename
if [ -z "$1" ]; then
    echo "Usage: bash compilelatex.sh <filename.tex>"
    exit 1
fi

# compile file
filename="${1%.tex}"

echo "Compiling $filename.tex ..."

pdflatex "$filename.tex"
bibtex "$filename"
pdflatex "$filename.tex"
pdflatex "$filename.tex"

# open pdf viewer
evince "$filename.pdf" &

# move pdf to results directory
mv "$filename.pdf" ../results/

## cleanup file
rm -f "$filename.aux" "$filename.log" "$filename.bbl" "$filename.blg"