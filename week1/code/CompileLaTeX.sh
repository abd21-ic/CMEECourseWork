#!/bin/bash
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
    echo "Usage: bash CompileLaTeX.sh <filename.tex>"
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

## cleanup file
rm -f "$filename.aux" "$filename.log" "$filename.bbl" "$filename.blg"