file=`cat $1`
for line in $file
do
	find=`find ~ -name $line`
	echo "$find contine metodele:"
	gasit=$(egrep -o ' \b(void|int|char|float|double|long|short|signed|unsigned|bool|wchar_t|std::vector|std::string|std::map|std::set|std::unordered_map|std::unordered_set|std::tuple|std::pair|std::list|std::deque|std::stack|std::queue|std::shared_ptr|std::unique_ptr|std::weak_ptr|std::function|std::optional|std::variant|std::array|std::initializer_list|std::regex|std::chrono::duration|std::chrono::time_point|std::wstring)\b [a-zA-Z0-9_]+\(' "$find")
	echo $gasit
done
