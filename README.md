# Scripturi-de-verificare-teme-POO-C-
Scripturi de “verificare” teme POO (C++)
#ceva update
# 17.06.2024 am modificat readme

# 18.06.2024
-m-am documentat in privinta proiectului pe care trebuie sa il produc
-am adaugat in ~/Desktop folderul cu temaPOO necesar proiectului
-am creeat un fisierul file_with_classes.txt, fisier care ajuta la verificarea claselor existente in temaPOO
-am creeat urmatoarele scripuri:
	-check_classes.sh care verifica daca clasele exista(mai am de lucrat si adaugat functionalitati)
	-check_existence_of_classes.sh care verifica daca fisierele file_with_classes.txt este in concordanta cu extracted_file_with_classes
	-getClasses care populeaza fisierul extracted_file_with_classes
	-verify_cpp.sh care verifica succesul scriptului check_existence_of_classes.sh

# 19.06.2024
-update-uri de toate felurile :)
						OBIECTIVE
1)Verificare logica clase
	-file_with_classes.txt contine denumirile claselor care ar trebui sa fie continute in temaPOO
	-extracted_files_with_classes.txt este generat si contine denumirile claselor din temaPOO
	-scriptul getClasses.sh genereaza fisierul extracted_files_with_classes.txt
	-scriptul check_existence_of_classes.sh verifica daca file_with_classes.txt si extracted_files_with_classes.txt contin aceleasi denumiri
	-scriptul verify_cpp.sh verifica daca check_existence_of_classes.sh returneaza 1(clasele exista)
2)Verificare elemente clase:
	-verifica daca au guards
	-nr. de definitii de clase
	-nr. de metode
3)Inserare rezultate in result.txt + exist_log.txt a verificarii 
4)Afisare ierarhie clase
# 20.06.2024
-acum verific si fisierele .cpp pe langa cele .h
-am creeat un script care sa inglobeze toate operatiunile de pana acum de verificare temaPOO:
-alte update-uri
# 25.06.2024
-update-uri diverse
# 26.06.2024
-am finalizat runScript.sh cu tot cu update-uri

