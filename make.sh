#!/bin/sh
file_name=$1
# Manually generate file the first time
rm -v *.out
rm -v *.aux
pdflatex $file_name.tex
bibtex $file_name.aux
pdflatex $file_name.tex

case "$(uname -s)" in
  Darwin)
    # macOS: start continuous compilation (dotfiles/.latexmkrc tells latexmk to use Skim)
    latexmk -pdf -pvc -interaction=nonstopmode -synctex=1 $file_name.tex
    ;;
  *)
    # CLI-only (e.g. Debian): finalize the build, then preview page 1 inline via imgcat
    latexmk -pdf -interaction=nonstopmode -synctex=1 $file_name.tex
    pdftoppm -png -singlefile -f 1 -l 1 "$file_name.pdf" /tmp/$file_name-pg \
      && imgcat /tmp/$file_name-pg.png
    ;;
esac
