#!/usr/bin/python
toEscape = b'\x0a\x0d'


def isToEscape(aByte):
	for j in range(len(toEscape)):
		if (aByte == toEscape[j]): # failed
			return True
	return False
	
import sys


if len(sys.argv) != 1:
	shellcode = open(sys.argv[1], 'rb').read()
else:
	print('Please: input file')
	exit(0)
	
# test
justOK = True
for i in range(len(shellcode)):
	if(isToEscape(shellcode[i])):
		print('invalid at: %d %s' % (i, hex(shellcode[i])))
		justOK = False
		break
if justOK:
	print('Dont have to encode')
	exit(0)
	
for x in range(0, 0x100):
	outShell = ''
	if isToEscape(x): continue
	found = True
	for i in range(len(shellcode)):
		xored = shellcode[i] ^ x
		if(isToEscape(xored)):
			found = False
			break
		else:
			xored = hex(xored)[2:]
			if len(xored) == 1: xored = '0' + xored
			outShell += '0x'+xored + ', '
	if found:
		print(hex(x))
		print(outShell)
		exit(0)
print('not found')

		
