#!/bin/bash

#Clear the result.txt
result=`find ~ -name $2`
: > "$2"      #in result.txt

# Function to check include guards in a file
check_include_guards() {
  local file=$1
  if grep -q "#ifndef" "$file" && grep -q "#define" "$file" && grep -q "#endif" "$file"; then
    echo "Include guards are present in $file"
    echo "Include guards are present in $file" >> "$result"
  else
    echo "Include guards are missing in $file"
    echo "Include guards are missing in $file" >> "$result"
  fi
}

# Function to count the number of class definitions
count_class_definitions() {
  local file=$1
  local class_count=$(grep -c "class " "$file")
  echo "Number of class definitions in $file: $class_count"
  echo "Number of class definitions in $file: $class_count" >> "$result"
}

# Function to count the number of methods in a class
count_methods() {
  local file=$1
  local method_count=$(grep -c "();" "$file")
  echo "Number of methods in $file: $method_count"
  echo "Number of methods in $file: $method_count" >> "$result"
}

# Initialize counters
total_methods=0
implemented_methods=0

# Get the real path of the file containing the list of header files
real_path=$(realpath file_with_classes.txt)
input_file=$(cat "$real_path")

#generate extracted_file_with_classes.txt
./getClasses.sh $1

#Check the files form temaPOO
./verify_cpp.sh

# Iterate through each filename listed in the input file
for name in $input_file; do
  echo "Checking file: $name"
  echo "Checking file: $name" >> "$result"
  path_input_file=$(find ~ -name "$name")
  
  if [[ -f $path_input_file ]]; then
    # Perform checks
    check_include_guards "$path_input_file"
    count_class_definitions "$path_input_file"
    count_methods "$path_input_file"
  else
    echo "File $name not found in ~"
    echo "File $name not found in ~" >> "$result"
  fi
done

