#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from __future__ import print_function

import serial
import re

class BusPirateSPI(object):
	def __init__(self,port="/dev/ttyUSB0",baud=115200,*args):
		self.port=port
		self._serial=serial.Serial(self.port,baud,timeout=0.01,*args)
		self.open()
	
	def open(self):
		self._serial.write(b"\n"*10) #clear previous commands
		self._serial.flush()
		self._command(b"#") #reset the bus pirate
		
		#init spi
		reply=b""
		for c in [b'm', b'5', b'4', b'2', b'1', b'1', b'2', b'2']:
			reply+=self._command(c)
		if b"Ready" not in reply:
			raise Exception("Error during SPI mode init: " + repr(reply))
		
		self._command(b"l") #MSb first
		
		#reset the connected chip
		self._command(b"a")
		self._command(b"A")
	
	_readregex=re.compile(b"READ: (0x[0-9a-fA-F]+)")
	def xfer(self,send=0):
		self._command(b"{")
		reply=self._command(hex(send).encode("ascii"))
		self._command(b"]")
		reply=int(self._readregex.search(reply).groups()[0],16)
		return reply
	
	def _command(self,command):
		self._serial.flush()
		self._serial.flushInput()
		self._serial.write(command+b"\n")
		
		reply=[]
		while 1:
			char=self._serial.read()
			reply.append(char)
			if char==b">":
				break
		reply=b"".join(reply)
		return reply

if __name__=="__main__":
	b=BusPirateSPI()