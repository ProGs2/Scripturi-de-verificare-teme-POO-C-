#!/bin/bash
display_menu() {
  echo "---------------------------------"
  echo "              Menu               "
  echo "---------------------------------"
  echo -e "\e[31m1. Afisare existenta fisiere .h din temaPOO\e[0m"
  echo -e "\e[32m2. Afiseaza informatii de compilare despre fisierele .h din temaPOO\e[0m"
  echo -e "\e[33m3. Afiseaza informatii despre existenta guards fisiere .h din temaPOO\e[0m"
  echo -e "\e[34m4. Afiseaza informatii despre numarul de definitii de clase din fisierele .h din temaPOO\e[0m"
  echo -e "\e[35m5. Afiseaza informati despre numarul de metode din fisierele .h din temaPOO\e[0m"
  echo -e "\e[36m6. Afiseaza metodele fiecarui fisier .h din temaPOO\e[0m"
  echo -e "\e[31m7. Afisare existenta fisiere .cpp din temaPOO\e[0m"
  echo -e "\e[32m8. Afiseaza informatii de compilare fisierele .cpp din temaPOO\e[0m"
  echo -e "\e[33m9. Afiseaza informatii despre existenta guards fisiere .h din temaPOO\e[0m"
  echo -e "\e[34m10. Afiseaza informatii despre numarul de definitii de clase din fisierele .cpp din temaPOO\e[0m"
  echo -e "\e[35m11. Afiseaza informati despre numarul de metode din fisierele .h din temaPOO\e[0m"
  echo -e "\e[36m12. Afiseaza metodele fiecarui fisier .h din temaPOO\e[0m"
  echo -e "\e[31m13. Afisare clase.cpp din temaPOO\e[0m"
  echo -e "\e[32m14. Afisare clase.h din temaPOO\e[0m"
  echo -e "\e[33m15. Afisare ierarhie clase din temaPOO\e[0m"
  echo -e "\e[34m16. Afisare toate clasele existene din temaPOO\e[0m"
  echo -e "\e[35mALTCEVA. Exit\e[0m"
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
