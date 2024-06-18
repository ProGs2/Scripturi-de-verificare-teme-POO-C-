real_path=`realpath check_existence_of_classes.sh`
bash "$real_path"
exit_status=$?
echo "Exit status al check_existence_of_classes.sh este $exit_status"
if [[ $exit_status -eq 1 ]]
then
	echo "check_existence_of_classes.sh executat cu succes!"
else
	echo "check_existence_of_classes.sh are exit status 0. Programul este terminat..."
	exit 0
fi
