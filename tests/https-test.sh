#!/bin/sh
. "$(dirname $0)/../bcolor.sh"

fail=0
for host in $(cat "$(dirname $0)/../hosts.list"); do
        is_certified=$(echo | openssl s_client -connect $host:443 2>/dev/null | openssl x509 | grep "BEGIN CERTIFICATE" | wc -l)
	if [ $is_certified -eq 1 ];then 
		echo "$GREEN[*] HTTPS $host OK"
	else
		fail=$((fail+1))
		echo "$RED[*] HTTPS $host NOT OK"
	fi
	echo $ENDC
done

echo $fail
return $fail
