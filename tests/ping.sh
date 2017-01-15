#!/bin/sh

#this is aweful.
. "$(dirname $0)/../bcolor.sh"

fail = 0
for host in $(cat "$(dirname $0)/../hosts.list"); do
	ping -c1 $host > /dev/null 2>&1
	status=$?
	if [ $status -eq "0" ];then
		echo "$GREEN[+] $host OK"
	elif [ $status -eq "1" ];then
		fail=$((fail+1))
		echo "$RED[!] $host NOT OK, ping unreachable"
	elif [ $status -eq "2" ]; then
		fail=$((fail+1))
		echo "$RED[!] $host NOT OK, unknown host (DNS fail?)"
	fi
	echo $ENDC
#	echo "$host : $status"

done
echo $fail
return $fail
