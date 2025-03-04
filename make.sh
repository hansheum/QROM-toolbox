#!/bin/sh
unalias rm
rm -v *.out
rm -v *.aux
file_name=$1
pdflatex $file_name.tex
bibtex $file_name.aux
pdflatex $file_name.tex
pdflatex $file_name.tex
open $file_name.pdf -a skim
osascript -e 'delay 0.2'
osascript -e 'tell application "System Events" to keystroke "r" using control down'
osascript -e 'delay 0.1'
osascript -e 'tell application "System Events" to keystroke return'
osascript -e 'delay 0.1'
osascript -e 'tell application "iTerm" to activate'
osascript -e 'delay 0.1'
osascript -e 'tell application "System Events" to key code 123 using {command down, option down}'
