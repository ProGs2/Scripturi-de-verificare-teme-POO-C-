#!/bin/bash
: > "exist1_log.txt"
declare var=`find ~ -name $1`
input_file=`cat cpp_files.txt`
other_file=`cat extracted_file_with_classes.txt`
for name in $other_file
do
	check=$(echo "$name" | sed 's/\.h/\.cpp/')
	check1=`echo $input_file|egrep $check`
	path=`find ~ -name $check`
	if [[ -n $path ]]
	then
		echo "Clasa $check exista in ~"
		echo "Clasa $check exista in ~" >> "$var"
	else
		echo "Clasa $check nu exista"
		echo "Clasa $check nu exista" >> "$var"
		exit 0
	fi
	if [[ -n $check1 ]]
	then
		echo "Clasa $check exista in fisierul extracted_file_with_classes.txt"
		echo "Clasa $check exista in fisierul extracted_file_with_classes.txt" >> "$var"
	else
		echo "Clasa $check nu exista in fisierul extracted_file_with_classes, programul este intrerupt,exit status 0"
		echo "Clasa $check nu exista in fisierul extracted_file_with_classes, programul este intrerupt,exit status 0" >> "$var"
		exit 0
	fi
done
exit 1

