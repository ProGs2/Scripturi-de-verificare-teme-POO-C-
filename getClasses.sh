#!/bin/bash
declare var=`ls ~/Desktop/AppPOO|egrep "\.h"`
#update the extracted_file_with_classes.txt
echo $var > extracted_file_with_classes.txt
echo "Numele claselor din temaPOO-proiect C++ au fost extrase cu succes in fisierul extracted_file_with_classes.txt"
