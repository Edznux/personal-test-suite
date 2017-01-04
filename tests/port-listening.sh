#!/bin/sh

# sourcing the color
# this is aweful.
. "$(dirname $0)/../bcolor.sh"


#Teamspeak

ts3server_count=$(netstat -lpn | grep "ts3server" | wc -l)

if [ $ts3server_count -eq 6 ];then
	echo "$GREEN[+] Teamspeak OK"
else
	echo "$RED[!] Teamspeak probably down (Listening : $ts3server_count )"
	if [ $ts3server_count -eq 3 ];then
		echo "$RED[!] Probably listening only ipv4 or ipv6"
	fi
fi
echo $ENDC

# NGINX

nginx_count=$(netstat -lpn | grep "nginx" | wc -l)

if [ $nginx_count -eq 4 ];then
	echo "$GREEN[+] NGINX OK"
else
	echo "$RED[!] NGINX not listening at least 4 ports !"
	echo "$YELLOWCheck ipv4 and ipv6 and http/https"
fi
echo $ENDC
