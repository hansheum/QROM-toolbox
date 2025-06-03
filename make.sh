#!/bin/sh
file_name=$1
# Manually generate file the first time
rm -v *.out
rm -v *.aux
pdflatex $file_name.tex
bibtex $file_name.aux
pdflatex $file_name.tex
# Start continuous compilation (dotfiles/.latexmkrc tells latexmk to use Skim)
latexmk -pdf -pvc -interaction=nonstopmode -synctex=1 $file_name.tex
