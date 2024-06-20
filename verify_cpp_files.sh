#!/bin/bash

#Initialize file
: > "log_cpp.txt"    #clear log_cpp.txt

# Function to check for syntax errors in a .cpp file
check_syntax_errors() {
  local file=`find ~ -name $1`
  #g++ -fsyntax-only "$file"
  g++ -fsyntax-only "$file" >> "log_cpp.txt" 2>&1
  if [ $? -eq 0 ]; then
    echo "Syntax is correct in $file"
    echo "Syntax is correct in $file" >> "log_cpp.txt"
  else
    echo "Syntax errors found in $file"
    echo "Syntax errors found in $file" >> "log_cpp.txt"
  fi
}

# Function to count the number of class definitions
count_class_definitions() {
  local file=`find ~ -name $1`
  local class_count=$(grep -c "class " "$file")
  echo "Number of class definitions in $file: $class_count"
  echo "Number of class definitions in $file: $class_count" >> "log_cpp.txt"
}

# Function to count the number of methods
count_methods() {
  local file=`find ~ -name $1`
  local method_count=$(cat $file|grep -c "();")
  echo "Number of methods in $1: $method_count"
  echo "Number of methods in $1: $method_count" >> "log_cpp.txt"
}

# Function to check if header files included in .cpp files have include guards
check_include_guards() {
  local file=`find ~ -name $1`
  local headers=$(grep -oP '#include\s*"\K[^"]+' "$file")
  for header in $headers; do
    value=`find ~ -name $header`
    if [[ -n $value ]]; then
      if grep -q "#ifndef" "$value" && grep -q "#define" "$value" && grep -q "#endif" "$value"; then
        echo "Include guards are present in $header"
        echo "Include guards are present in $header" >> "log_cpp.txt"
      else
        echo "Include guards are missing in $header"
        echo "Include guards are missing in $header" >> "log_cpp.txt"
      fi
    else
      echo "Header file $header included in $file not found"
      echo "Header file $header included in $file not found" >> "log_cpp.txt"
    fi
  done
}

# Check if cpp_files.txt exists
if [ ! -f cpp_files.txt ]; then
  echo "cpp_files.txt not found."
  echo "cpp_files.txt not found." >> "log_cpp.txt"
  exit 1
fi

# Read the list of .cpp files from cpp_files.txt
cpp_files=$(cat cpp_files.txt)

# Iterate through each .cpp file listed in cpp_files.txt
for cpp_file in $cpp_files; do
    # Perform checks
    check_syntax_errors "$cpp_file"
    count_class_definitions "$cpp_file"
    count_methods "$cpp_file"
    check_include_guards "$cpp_file"
done
exit 111
