#!/bin/bash
#
# This script creates an all-tasks.pdf file in every top level folder of
# the repository unless a file of that name already exists
#
for dir in */
do
  if [ -z "$(ls -A "$dir")" ]; then
    echo "Skipping empty folder $dir"
  elif [ -f ${dir}all-tasks.pdf ]; then
    echo "${dir}all-tasks.pdf already exists - not created anew"
  else
    echo "Creating ${dir}all-tasks.pdf"
    (cd $dir; echo "Processing $dir"; ../toPDF.sh)
  fi
done

# commit changes if necessary
#if [ ! -z "$(git status --porcelain .)" ]; then
#   git stage */all-tasks.pdf
#   git commit -m "Add all-tasks.pdf files"
#   git push
#fi

