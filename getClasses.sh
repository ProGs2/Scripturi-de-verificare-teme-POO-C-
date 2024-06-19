#!/bin/bash
declare var1=`find ~ -name $1`         #cautam in ~
declare var=`ls $var1|egrep "\.h"`
#update the extracted_file_with_classes.txt
echo $var > extracted_file_with_classes.txt
echo "Numele claselor din temaPOO-proiect C++ au fost extrase cu succes in fisierul extracted_file_with_classes.txt"
