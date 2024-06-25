#!/bin/bash

# Citeste fiecare linie (nume de fișier) din file.txt
while IFS= read -r file; do
    echo "Methods in $file:"
    # Extrage metodele folosind c++filt și grep
    c++filt < "$file" | grep -E '^[[:alnum:]_*]+\s+[[:alnum:]_*]+\s*\([^)]*\)\s*;.*$'
    echo "---------------------"
done < file_with_classes.txt

