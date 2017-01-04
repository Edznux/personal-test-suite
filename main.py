#!/usr/bin/python
import os
import subprocess 

def launchTests():

	print "[*] Read tests files in ./tests directory"
	print "[*] Starting tests"

	for name in os.listdir("./tests"):
		print "#################################\n"
		if name.startswith("_") or name.endswith(".swp") or name.endswith("~"):
			print "[-] Ignoring {}".format(name)
		else:
			print "[+] Starting {}".format(name)
			subprocess.call(["./tests/"+name])
		print "================================="

if os.getuid() == 0:
	launchTests()
else:
	print "This program must be started with root / sudo"

