#!/bin/bash
#
# Converts tasks to PDFS and concatenates them into one single file
# all-tasks.pdf
#
# Software needed
# - libre office
# - wkhtmltopdf
# 
OUTDIR="/tmp/out$$"
RESULT="all-tasks.pdf"
mkdir $OUTDIR
# convert individual files
for dir in 20??-*/
do
    PREFIX=${dir%%_*}
    ODTNAME="$dir$PREFIX-eng.odt"
    HTMLNAME="$dir$PREFIX-eng.html"
    if [ -f $ODTNAME ]; then
	echo converting $ODTNAME
	lowriter --headless --convert-to pdf --outdir $OUTDIR $ODTNAME \
		 >/dev/null
    elif [ -f $HTMLNAME ]; then
	echo converting $HTMLNAME
	wkhtmltopdf --enable-local-file-access \
		     "$dir$PREFIX-eng.html" $OUTDIR/$PREFIX-eng.pdf >/dev/null
    else
	echo no file found for $PREFIX
    fi
done

(cd $OUTDIR; pdftk *.pdf cat output $RESULT)
mv $OUTDIR/$RESULT .

# clean up
rm $OUTDIR/*.pdf
rmdir $OUTDIR

