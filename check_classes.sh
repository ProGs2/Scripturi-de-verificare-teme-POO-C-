#!/bin/bash

# Initialize counters
total_methods=0
implemented_methods=0

real_path=`realpath file_with_classes`
input_file=`cat $real_path.txt`
echo $input_file
cd ~/Desktop
for name in $input_file
do
	find_var=`find ~/Desktop -type f -name $name`
	if [[ -n $find_var ]]
	then
		echo "Clasa $name exista in sistem."
		
		# Extract method declarations (function() lines)
		path_for_class=`realpath $name`
		file=`cat $path_for_class`
		method_declarations=$(grep -E '^[[:space:]]*(public|protected|private):' "$file" | grep '(' | awk '{print $NF}')
		echo $method_declarations
	else
		echo "Clasa $name nu exista in sistem, programul este terminat..."
		exit 0
	fi
done
##############################################################################

