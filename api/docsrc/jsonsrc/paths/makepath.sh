link_path () {
	REL_PATH=$1;
	IFS='\/' eval 'patch_array=($REL_PATH)';
	JSON=$(cat "$REL_PATH" | \
	       sed -e "s/\.\//\.\/"${patch_array[0]}"\//g"|jq);
	echo ${JSON:1:-1};
}

integrate () {
    integrated=$(
    for single_path in "$@"; do
	link_path "$single_path";
	echo ","; 
     done);
     echo "{${integrated:0:-1}}"
}

integrate \
"media/index.json" \
"entry/index.json" \


