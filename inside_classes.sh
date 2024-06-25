#!/bin/bash

# Check if file_with_classes.txt exists
if [ ! -f file_with_classes.txt ]; then
    echo "file_with_classes.txt not found!"
    exit 1
fi

# Read each line (header file name) from file_with_classes.txt
while IFS= read -r header; do
    # Find the header file in the home directory
    find_result=$(find ~ -name "$header")
    
    if [[ -n $find_result ]]; then
        echo "Classes in $find_result:"
        # Use grep to find class definitions
        class_definitions=$(grep -E 'class' "$find_result"|cut -f2 -d' ')
        if [[ -n $class_definitions ]]; then
            echo "$class_definitions"
        else
            echo "No class definitions found."
        fi
        echo "---------------------"
    else
        echo "$header not found!"
    fi
done < file_with_classes.txt

