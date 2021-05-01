#!/bin/bash

# Loading in our environment file
. .env

CFG_PATHS="/tomcat-cfg /supervisor-cfg /nginx-cfg /lucee-cfg /context /www /logs/supervisor /logs/nginx"

echo "Root path is '${ROOT}'"

echo "Creating paths need for docker image"
echo "\tConfigurations paths"
for cfg in ${CFG_PATHS[@]}; do
	if [ ! -d ${cfg} ]; then
		mkdir -pv ${ROOT}${cfg}
	fi
done
