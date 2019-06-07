#!/bin/bash
if [ "$#" -ne "1" ]; then  
    echo "Error: Please input your mount point"  
    exit 2  
fi  
while [[ true ]]; do
	#statements
	start=`date +%s`
	ls $1
	stop=`date +%s`
	echo `date +%H:%M:%S`
	let dd=$stop-$start
	if [ $dd -gt 8 ]
	then
		date
		echo -e "\033[31m$dd second OUT OF TIME LIMIT\033[0m"
	else
		echo -e "\033[32m$dd second\033[0m"
	fi
	/bin/sleep 1
done
