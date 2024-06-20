#!/bin/bash

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Get the absolute path of the directory
var1=`find ~ -name $1`
var2=`ls $var1`

# Create or clear the cpp_file.txt
output_file="cpp_files.txt"
> "$output_file"

# List all .cpp files in the directory and save them to cpp_file.txt
for name in $var2; do
  if [[ $name == *.cpp ]]; then
    echo "$name" >> "$output_file"
  fi
done

echo "List of .cpp files saved to $output_file"
exit 111
