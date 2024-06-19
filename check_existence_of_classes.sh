#!/bin/bash
input_file=`cat file_with_classes.txt`
other_file=`cat extracted_file_with_classes.txt`
for name in $input_file
do
	check=`echo $other_file|egrep -o -w "$name"`
	if [[ -n $check ]]
	then
		echo "Clasa $check exista in fisierul extracted_file_with_classes.txt"
	else
		echo "Clasa $check nu exista in fisierul extracted_file_with_classes, programul este intrerupt,exit status 0"
		exit 0
	fi
done
exit 1
