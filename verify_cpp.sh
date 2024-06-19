declare var=`find ~ -name $1`
real_path=`realpath check_existence_of_classes.sh`
bash "$real_path" "$1"
exit_status=$?
echo "Exit status al check_existence_of_classes.sh este $exit_status"
echo "Exit status al check_existence_of_classes.sh este $exit_status" >> "$var"
if [[ $exit_status -eq 1 ]]
then
	echo "check_existence_of_classes.sh executat cu succes!"
	echo "check_existence_of_classes.sh executat cu succes!" >> "$var"
else
	echo "check_existence_of_classes.sh are exit status 0. Programul este terminat..."
	echo "check_existence_of_classes.sh are exit status 0. Programul este terminat..." >> "$var"
	exit 0
fi
