#!/bin/sh

#this is aweful.
. "$(dirname $0)/../bcolor.sh"

echo "[*] Starting ping test"
for host in $(cat "$(dirname $0)/_hosts.list"); do
	ping -c1 $host > /dev/null 2>&1
	status=$?
	if [ $status -eq "0" ];then
		echo "$GREEN[+] $host OK"
	elif [ $status -eq "1" ];then
		echo "$RED[!] $host NOT OK, ping unreachable"
	elif [ $status -eq "2" ]; then
		echo "$RED[!] $host NOT OK, unknown host (DNS fail?)"
	fi
	echo $ENDC
#	echo "$host : $status"

done
