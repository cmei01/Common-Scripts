#!/bin/bash
#Find all non-Stopped and 100% done task
CID=`/usr/bin/transmission-remote -l | grep 100% | grep -v "Stopped" | awk '{print $1}'`
if [ !$CID ]; 
	then echo "No job need to stop. exiting..." ; exit 2; 
else
	echo "Below job will be stopped"
	# Command `/usr/bin/transmission-remote -t [taks_id] -S` #Stop task ID job
	for i in $CID; 
		do /usr/bin/transmission-remote -t $i -S; 
			if [ $? -eq 0 ] ; 
				then  echo -e "\033[32mCompleted Task ID is $i.\033[0m \n"; 
			else echo -e "\033[31mFailed stop ID $i.\033[0m\n";
			fi ; 
	done
fi
#if [ $? -eq 0 ]; then echo -e "\033[31mGood\033[0m"; else echo -e "\033[32mBAD\033[0m"; fi

