link_path () {
	REL_PATH=$1;
	IFS='\/' eval 'patch_array=($REL_PATH)';
	JSON=$(cat "$REL_PATH" | \
	       sed -e "s/\.\//\.\/"${patch_array[0]}"\//g"|jq);
	echo ${JSON:1:-1};
}

integrate () {
    IFS=$'\n' read -d '' -r -a paths < paths.path
    integrated=$(
    for single_path in ${paths[@]}; do
	link_path "$single_path";
	echo ","; 
     done);

     echo "{${integrated:0:-1}}"
}

HOME_DIR=$PWD;
cd $HOME_DIR/api/docsrc/jsonsrc/paths/;

integrate|jq >index_generated.json

cd $HOME_DIR;

