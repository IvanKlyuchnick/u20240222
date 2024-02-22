#!/bin/sh

while IFS= read -r line; do
	if [ $line ]
	then
    		tstamp=`date +%s`
    		site=`echo $line | sed -E 's_^https?://__' | sed 's:/*$::'`
    		qtime=`curl -w "%{time_total}" -o /dev/null -sL $line`
    		echo "$tstamp;$site;$qtime" >> curl_result.scv
		if [ $1 ]
		then 
			if [ $1 == "-v" ]
			then
   				echo "$tstamp;$site;$qtime"
			fi
		fi
	fi
done < "url_list.txt"
