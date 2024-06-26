#!/bin/bash
display_menu() {
  echo "---------------------------------"
  echo "              Menu               "
  echo "---------------------------------"
  echo "1. Afisare existenta fisiere .h din temaPOO"
  echo "2. Afiseaza informatii de compilare despre fisierele .h din temaPOO"
  echo "3. Afiseaza informatii despre existenta guards fisiere .h din temaPOO"
  echo "4. Afiseaza informatii despre numarul de definitii de clase din fisierele .h din temaPOO"
  echo "5. Afiseaza informati despre numarul de metode din fisierele .h din temaPOO"
  echo "6. Afiseaza metodele fiecarui fisier .h din temaPOO"
  echo "7. Afisare existenta fisiere .cpp din temaPOO"
  echo "8. Afiseaza informatii de compilare fisierele .cpp din temaPOO"
  echo "9. Afiseaza informatii despre existenta guards fisiere .h din temaPOO"
  echo "10. Afiseaza informatii despre numarul de definitii de clase din fisierele .cpp din temaPOO"
  echo "11. Afiseaza informati despre numarul de metode din fisierele .h din temaPOO"
  echo "12. Afiseaza metodele fiecarui fisier .h din temaPOO"
  echo "13. Afisare clase.cpp din temaPOO"
  echo "14. Afisare clase.h din temaPOO"
  echo "15. Afisare ierarhie clase din temaPOO"
  echo "16. Afisare toate clasele existene din temaPOO"
  echo "ALTCEVA. Exit"
  echo "---------------------------------"
}

v1=`realpath getCpps.sh`
bash1=`bash $v1 $1`
exit1=$?
if [[ "$exit1" -eq 111 ]]
then
	echo "getCpps.h executat fara erori"
else
	echo "getCpps.h executat cu erori"
	exit 0
fi 

v2=`realpath verify_cpp_files.sh`
bash2=`bash $v2`
exit2=$?
if [[ "$exit2" -eq 111 ]]
then
	echo "verify_cpp_files.sh executat fara erori"
else
	echo "verify_cpp_files.sh executat cu erori"
	exit 0
fi

v5=`realpath check_existence_cpps.sh`
bash5=`bash $v5 "exist1_log.txt"`
exit5=$?
if [[ "$exit5" -eq 1 ]]
then
	echo "check_cpp_files.sh executat fara erori"
else
	echo "check_cpp_files.sh execuatt cu erori"
	exit 0
fi

v4=`realpath check_existence_of_classes.sh`
bash4=`bash $v4 "exist_log.txt"`
exit4=$?
if [[ "$exit4" == "1" ]]
then
	echo "check_existence_of_classes.sh executat fara erori"
else
	echo "check_existence_of_classes.sh executat cu cod de eroare 0"
	exit 0
fi

v3=`realpath check_classes.sh`
bash3=`bash $v3 $1 "result.txt"`
exit3=$?
if [[ "$exit3" -eq 111 ]]
then
	echo "check_classes.sh executat fara erori"
else 
	echo "check_classes.sh executat cu erori"
	exit 0
fi

#MENU
while true
do
	display_menu
	read option

	if [[ "$option" == "1" ]]; then
	    find=$(find ~ -name "exist_log.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File exist_log.txt not found."
	    fi
	elif [[ "$option" == "2" ]]; then
	    find=$(find ~ -name "result.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File result.txt not found."
	    fi
	elif [[ "$option" == "3" ]]; then
		find=`find ~ -name "hguards.txt"`
		if [[ -n $find ]]; then
			cat "$find"
		else
			echo "File hguards.txt does not exist!"
		fi
	elif [[ "$option" == "4" ]]; then
		find=`find ~ -name "hnr_class_def.txt"`
		if [[ -n $find ]]; then
			cat "$find"
		else
			echo "File hnr_class_def.txt does not exist!"
		fi
	elif [[ "$option" == "5" ]]; then
		find=`find ~ -name "hnr_methods.txt"`
		if [[ -n $find ]]; then
			cat "$find"
		else
			echo "File hnr_methods.txt does not exist!"
		fi
	elif [[ "$option" == "6" ]]; then
		./printMetode.sh file_with_classes.txt
	elif [[ "$option" == "7" ]]; then
	    find=$(find ~ -name "exist1_log.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File exist_log1.txt not found."
	    fi
	elif [[ "$option" == "8" ]]; then
	    find=$(find ~ -name "log_cpp.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File log_cpps.txt not found."
	    fi
	elif [[ "$option" == "9" ]]; then
	    find=$(find ~ -name "cguards.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File cguards.txt not found."
	    fi
	elif [[ "$option" == "10" ]]; then
	    find=$(find ~ -name "cnr_class_def.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File cnr_class_def.txt not found."
	    fi
	elif [[ "$option" == "11" ]]; then
	    find=$(find ~ -name "cnr_methods.txt")
	    if [[ -n $find ]]; then
		cat "$find"
	    else
		echo "File cnr_methods.txt not found."
	    fi
	elif [[ "$option" == "12" ]]; then
	    ./printMetode.sh cpp_files.txt
	elif [[ "$option" == "13" ]]; then
		find=`find ~ -name "cpp_files.txt"`
		if [[ -n $find ]];then
		   	cat "$find"
		else
			echo "File cpp_files.txt not found."
		fi
	elif [[ "$option" == "14" ]];then
		find=`find ~ -name "extracted_file_with_classes.txt"`
		if [[ -n $find ]];then
			cat $find
		else
			echo "File extracted_file_with_classes.txt not found"
		fi
	elif [[ "$option" == "15" ]];then
		./printIerarhie.sh
	elif [[ "$option" == "16" ]];then
		find=`find ~ -name "all_classes.txt"`
		if [[ -n $find ]];then
			cat $find
		else
			echo "File all_classes.txt not found"
		fi
	else
	    echo "Program terminat..."
	    exit 0
	fi
done
