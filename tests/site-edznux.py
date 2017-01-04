#!/usr/bin/python

import requests
if __name__ == '__main__':
    if __package__ is None:
        import sys
        from os import path
        sys.path.append( path.dirname( path.dirname( path.abspath(__file__) ) ) )
        from bcolor import bcolors
    else:
        from ..bcolor import bcolors

protocol = "http://"
base_url = "edznux.fr"
subdomain = ["blog", "streamcode", "dev.streamcode", "netdata"]
#port = "80"
DEBUG=False
#DEBUG=True

for s in subdomain:
	url=protocol+s+"."+base_url
	print "[*] Testing url : {}".format(url)
	r=requests.get(url)
	if r.status_code == 200:
		print bcolors.GREEN + "[+] HTTP Code {}, OK".format(r.status_code)
	elif r.status_code == 404:
		print bcolors.YELLOW + "[!] HTTP Code {}, NOT FOUND".format(r.status_code)
	elif r.status_code >= 500:
		print bcolors.RED + "[!!] HTTP Code {}, CRITICAL ERROR".format(r.status_code)
	else:
		print "[?] HTTP Code {}, Unknown".format(r.status_code)
	print bcolors.ENDC

	if DEBUG:
		print r.text
