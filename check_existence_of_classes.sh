#!/bin/bash
declare var=`find ~ -name $1`
input_file=`cat file_with_classes.txt`
other_file=`cat extracted_file_with_classes.txt`
for name in $input_file
do
	check=`echo $other_file|egrep -o -w "$name"`
	if [[ -n $check ]]
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
