
# Takes a list of arguments and insert an underscore between each

function interleave {
	for elm in $@; do
		printf "$elm _ "
	done
}


# Fills the file in the first argument with the value of the second argument if
# it the file is empty

function fill_file_if_empty {
	if [[ $(cat "$1") == "" ]]; then
		printf "$2" > "$1"
	fi
}
