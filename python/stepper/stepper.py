#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from __future__ import print_function

import serial
import re

class BusPirateSPI(object):
	def __init__(self,port="/dev/ttyUSB0",baud=115200,rtscts=True):
		self.port=port
		self.baud=baud
		self._serial=serial.Serial(self.port,self.baud,timeout=0.01)
		self.open()
	
	def open(self):
		self._serial.write(b"\n"*10) #clear previous commands
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
		reply=b._command(hex(send).encode("ascii"))
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
b=BusPirateSPI()

def split_bytes(value,num_bytes=None):
	l=[]
	while 1:
		l.append(value%256)
		value//=256
		
		if num_bytes is None:
			if value==0:
				break
		else:
			num_bytes-=1
			if num_bytes==0:
				break
	return reversed(l)

class L6470(object):
	_registers={
		0x01: 'ABS_POS',
		0x02: 'EL_POS',
		0x03: 'MARK',
		0x04: 'SPEED',
		0x05: 'ACC',
		0x06: 'DEC',
		0x07: 'MAX_SPEED',
		0x08: 'MIN_SPEED',
		0x15: 'FS_SPD',
		0x09: 'KVAL_HOLD',
		0x0A: 'KVAL_RUN',
		0x0B: 'KVAL_ACC',
		0x0C: 'KVAL_DEC',
		0x0D: 'INT_SPEED',
		0x0E: 'ST_SLP',
		0x0F: 'FN_SLP_ACC',
		0x10: 'FN_SLP_DEC',
		0x11: 'K_THERM',
		0x12: 'ADC_OUT',
		0x13: 'OCD_TH',
		0x14: 'STALL_TH',
		0x16: 'STEP_MODE',
		0x17: 'ALARM_EN',
		0x18: 'CONFIG',
		0x19: 'STATUS',
	}
	
	_register_lens={
		0x01: 22,
		0x02: 9,
		0x03: 22,
		0x04: 20,
		0x05: 12,
		0x06: 12,
		0x07: 10,
		0x08: 13,
		0x15: 10,
		0x09: 8,
		0x0A: 8,
		0x0B: 8,
		0x0C: 8,
		0x0D: 14,
		0x0E: 8,
		0x0F: 8,
		0x10: 8,
		0x11: 4,
		0x12: 5,
		0x13: 4,
		0x14: 7,
		0x16: 8,
		0x17: 8,
		0x18: 16,
		0x19: 16,
	}
	
	@classmethod
	def _register_info(self,register):
		"""@returns id,name and length no matter what type of argument it recieved(name or id)"""
		reg_id=None
		if not type(register)==int:
			register=register.upper()
			for key,value in self._registers.items():
				if value==register:
					reg_id=key
					break
			else:
				raise ValueError("No such register %s." % register)
		
		reg_name=self._registers[reg_id]
		reg_len=self._register_lens[reg_id]
		
		return reg_id, reg_name, reg_len
	
	_commands={
		'NOP': 0x00,
		'SET_PARAM': 0x00,
		'GET_PARAM': 0x20,
		'RUN': 0x50,
		'STEP_CLOCK': 0x58,
		'MOVE': 0x40,
		'GOTO': 0x60,
		'GOTO_DIR': 0x68,
		'GO_UNTIL': 0x82,
		'RELEASE_SW': 0x92,
		'GO_HOME': 0x70,
		'GO_MARK': 0x78,
		'RESET_POS': 0xD8,
		'RESET_DEVICE': 0xC0,
		'SOFT_STOP': 0xB0,
		'HARD_STOP': 0xB8,
		'SOFT_HIZ': 0xA0,
		'HARD_HIZ': 0xA8,
		'GET_STATUS': 0xD0,
	}
	
	def __init__(self,spi):
		self.spi=spi
	
	def nop(self):
		self.spi.xfer(self._commands["NOP"])
	
	def __getitem__(self,reg):
		reg_id,reg_name,reg_len=self._register_info(reg)
		
		self.spi.xfer(self._commands["GET_PARAM"]+reg_id)
		
		value=0
		reg_len_bytes=(reg_len-1)//8+1
		for i in reversed(range(reg_len_bytes)):
			byte=self.spi.xfer(0)
			value+=byte*(256**i)
		return value
	
	def __setitem__(self,reg,value):
		reg_id,reg_name,reg_len=self._register_info(reg)
		
		self.spi.xfer(self._commands["SET_PARAM"]+reg_id)
		
		mask=(2**reg_len)-1
		value&=mask
		
		reg_len_bytes=(reg_len-1)//8+1
		for b in split_bytes(value,reg_len_bytes):
			self.spi.xfer(b)
	
	def run(self,speed,forward=True):
		direction=int(bool(forward))
		self.spi.xfer(self._commands["RUN"]+direction)
		for b in split_bytes(speed,num_bytes=3):
			self.spi.xfer(b)
	
	def move(self,steps,forward=True):
		direction=int(bool(forward))
		self.spi.xfer(self._commands["MOVE"]+direction)
		for b in split_bytes(steps,num_bytes=3):
			self.spi.xfer(b)
	
	def reset_pos(self):
		self.spi.xfer(self._commands["RESET_POS"])
	def reset(self):
		self.spi.xfer(self._commands["RESET_DEVICE"])
	def soft_stop(self):
		self.spi.xfer(self._commands["SOFT_STOP"])
	def hard_stop(self):
		self.spi.xfer(self._commands["HARD_STOP"])
	def soft_hiz(self):
		self.spi.xfer(self._commands["SOFT_HIZ"])
	def hard_hiz(self):
		self.spi.xfer(self._commands["HARD_HIZ"])
	
	@property
	def status(self):
		self.spi.xfer(self._commands["GET_STATUS"])
		return self.spi.xfer(0)*256+self.spi.xfer(0)

l=L6470(b)
l["config"]=0b0001111010001000 #lower pwm frequency
l["acc"]=1
l["dec"]=1
l["kval_acc"]=l["kval_dec"]=l["kval_run"]=10
l["kval_hold"]=0
l["step_mode"]=7
l["int_speed"]=0
l["st_slp"]=0
l["fn_slp_acc"]=0
l["fn_slp_dec"]=0
l["fs_spd"]=10
l["max_speed"]=20000//1024
l.move(10000)