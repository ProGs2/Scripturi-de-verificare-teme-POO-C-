#!/bin/bash

# Check if file_with_classes.txt is provided
if [ ! -f "file_with_classes.txt" ]; then
  echo "file_with_classes.txt not found!"
  exit 0
fi

# Declare an associative array to store class relationships
declare -A class_tree

# Function to extract class names and their base classes from a .h file
extract_classes() {
  local file="$1"
  
  # Read the file and extract class and inheritance information
  while read -r line; do
    if [[ $line =~ class[[:space:]]+([[:alnum:]_]+)[[:space:]]*(:[[:space:]]*public[[:space:]]+([[:alnum:]_]+))? ]]; then
      class_name="${BASH_REMATCH[1]}"
      base_class_name="${BASH_REMATCH[3]}"
      
      if [[ -n $base_class_name ]]; then
        class_tree["$base_class_name"]+="$class_name "
      else
        class_tree["ROOT"]+="$class_name "
      fi
    fi
  done < "$file"
}

# Function to print the class tree
print_class_tree() {
  local parent="$1"
  local indent="$2"
  
  for child in ${class_tree["$parent"]}; do
    echo "${indent}├── $child"
    print_class_tree "$child" "$indent    "
  done
}

# Read the list of .h files from file_with_classes.txt and process each
while read -r name; do
  file_path=$(find ~ -name "$name")
  if [ -n "$file_path" ]; then
    extract_classes "$file_path"
  else
    echo "File $name not found!"
  fi
done < "file_with_classes.txt"

# Print the class tree starting from the ROOT
echo "Class Hierarchy:"
print_class_tree "ROOT" ""

