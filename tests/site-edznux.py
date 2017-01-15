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

fail=0

for s in subdomain:
	url=protocol+s+"."+base_url
	print "[*] Testing url : {}".format(url)
	try:
		r=requests.get(url)
		if r.status_code == 200:
			print bcolors.GREEN + "[+] HTTP Code {}, OK".format(r.status_code)
		elif r.status_code == 404:
			fail+=1
			print bcolors.YELLOW + "[!] HTTP Code {}, NOT FOUND".format(r.status_code)
		elif r.status_code >= 500:
			fail+=1
			print bcolors.RED + "[!!] HTTP Code {}, CRITICAL ERROR".format(r.status_code)
		else:
			fail+=1
			print "[?] HTTP Code {}, Unknown".format(r.status_code)
		print bcolors.ENDC
	except:
		print "Catch"
		fail+=1

	if DEBUG:
		print r.text


print fail
sys.exit(fail)
