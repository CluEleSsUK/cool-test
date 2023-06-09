#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "usage: hasher.sh /path/to/files/dir"
  exit 64
fi

lists_dir=$1

# first we clear any old hashes we've created
rm -rf $lists_dir/hashes-*

# then we get all the files in the dir (which should only be lists)
files=$(ls $lists_dir)

for filename in $files; do
  contents=$(cat $lists_dir/$filename)

  # for every line in each file
  for current_line in $contents; do
    # we hash it, and output it + the hash to a new file with the same name + the `hashes-` prefix
    echo $current_line | sha256sum | sed "s/\(.*\)-/$current_line \1/g" >> $lists_dir/hashes-$filename
  done
done
