#!/bin/sh

# source the colors
. "$(dirname $0)/../bcolor.sh"

fail=0
for serv in $(cat "$(dirname $0)/../services.list"); do
	is_active=$(systemctl is-active $serv)
	if [ "$is_active" = "active" ];then
		echo "$GREEN[*] $serv OK"
	else
		fail=$((fail+1))
		echo "$RED[*] $serv NOT OK"
	fi
	echo $ENDC
done

echo $fail
return $fail
