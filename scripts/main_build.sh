home_path=$PWD;
cd api/docsrc/jsonsrc/paths/;
./makepath.sh;
cd $home_path;
npx json-refs resolve api/docsrc/jsonsrc/index.json -y --force 
