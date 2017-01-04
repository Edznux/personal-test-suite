#!/bin/sh


#Teamspeak

ts3server_count=$(netstat -lpn | grep "ts3server" | wc -l)

if [ $ts3server_count -eq 6 ];then
	echo "[*] Teamspeak OK"
else
	echo "[!] Teamspeak probably down (Listening : $ts3server_count )"
	if [ $ts3server_count -eq 3 ];then
		echo "[!] Probably listening only ipv4 or ipv6"
	fi
fi

# NGINX

nginx_count=$(netstat -lpn | grep "nginx" | wc -l)

if [ $nginx_count -eq 4 ];then
	echo "[*] NGINX OK"
else
	echo "[!] NGINX not listening at least 4 ports !"
	echo "Check ipv4 and ipv6 and http/https"
fi
