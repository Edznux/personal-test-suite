#!/bin/bash


for serv in $(cat "$(dirname $0)/_services.list"); do
	is_active=$(systemctl is-active $serv)
	if [ "$is_active" = "active" ];then
		echo "[*] $serv OK"
	else
		echo "[*] $serv NOT OK"
	fi

done
