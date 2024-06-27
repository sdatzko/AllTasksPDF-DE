#!/bin/bash
#
# Converts tasks to PDFS and concatenates them into one single file
# all-tasks.pdf
#
# Software needed
# - libre office
# - wkhtmltopdf
# - pdftk
OUTDIR="/tmp/out$$"
RESULT="all-tasks.pdf"
mkdir $OUTDIR
shopt -s nullglob  # allows for loops to run 0 times if no files match the pattern

# convert individual files
for dir in 20??-*/
do
    BEBRAS_ID=${dir%%_*}
    # convert ALL odt files satisfying the correct pattern
    for ODTNAME in $dir$BEBRAS_ID*.odt
    do
	    echo converting $ODTNAME
	    lowriter --headless --convert-to pdf --outdir $OUTDIR $ODTNAME >/dev/null
		done
		# convert ALL html files satisfying the correct pattern
		for HTMLNAME in $dir$BEBRAS_ID*.html
		do
	    echo converting $HTMLNAME
	    wkhtmltopdf --enable-local-file-access "$HTMLNAME" "$OUTDIR/${HTMLNAME##*/}.pdf" >/dev/null
    done
done
shopt -u nullglob # turn off the nullglob option

# concatenate all pdfs into one
if [ -z "$(ls -A "$OUTDIR")" ]; then
  echo "**WARNING** No ODT or HTML task files found in folder ${PWD##*/} - creating empty PDF"
  touch $RESULT
else
  (cd $OUTDIR; pdftk *.pdf cat output $RESULT)
  mv $OUTDIR/$RESULT .
  rm $OUTDIR/*.pdf
fi
rmdir $OUTDIR
