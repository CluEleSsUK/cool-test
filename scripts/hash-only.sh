#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  echo "usage: hasher.sh /path/to/files/dir /path/to/out/dir"
  exit 64
fi

lists_dir=$1
hashes_dir=$2

# then we get all the files in the dir that don't start with the 'hashes-' prefix
files=$(ls $lists_dir | grep -v "hashes-")

for filename in $files; do
  contents=$(cat $lists_dir/$filename)

  # for every line in each file
  for current_line in $contents; do
    # we hash it, strip the trailing - char and output the hash to a new file in the output dir
    echo $current_line | sha256sum  | sed 's/\(.*\)-/\1/' > $hashes_dir/$filename
  done
done
