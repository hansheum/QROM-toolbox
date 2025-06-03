#!/bin/sh
unalias rm
rm -v *.out
rm -v *.aux
file_name=$1
pdflatex $file_name.tex
bibtex $file_name.aux
pdflatex $file_name.tex
pdflatex $file_name.tex
