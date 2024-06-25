#!/bin/bash
#
# This script creates an all-tasks.pdf file in every subfolder of tasks which
# does not already have one
#
for dir in tasks/*/
do
  if [ ! -f $dir/all-tasks.pdf ]
  then
    echo "Creating $dir/all-tasks.pdf"
    cd $dir
    echo "Processing $dir"
    touch all-tasks.pdf
    cd ..
  fi
done
