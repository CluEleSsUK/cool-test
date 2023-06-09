#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  echo "usage: hasher.sh /path/to/files/dir /path/to/out/dir"
  exit 64
fi

lists_dir=$1
hashes_dir=$2

# first we clear any old hashes we've created
rm -rf $hashes_dir/*

# then we get all the files in the dir (which should only be lists)
files=$(ls $lists_dir)

for filename in $files; do
  contents=$(cat $lists_dir/$filename)

  # for every line in each file
  for current_line in $contents; do
    # we hash it, and output the hash to a new file in the output dir
    echo $current_line | sha256sum > $hashes_dir/$filename
  done
done
