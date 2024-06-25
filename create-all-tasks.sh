#!/bin/bash
#
# This script creates an all-tasks.pdf file in every subfolder of tasks which
# does not already have one
#
for dir in tasks/*/
do
  if [ ! -z "$()ls -A "$dir")"]; then
    echo "Skipping empty folder $dir"
  elif [ -f $dir/all-tasks.pdf ]; then
    echo "$dir/all-tasks.pdf already exists"
  else
    echo "Creating $dir/all-tasks.pdf"
    cd $dir
    echo "Processing $dir"
    touch all-tasks.pdf
    git add all-tasks.pdf
    cd ..
  fi
done

# commit changes if necessary
if [ ! -z "$(git status --porcelain .)" ]; then
  git commit -m "Add all-tasks.pdf files"
  git push
fi

