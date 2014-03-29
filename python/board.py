#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import serial
import enum

class Board(object):
	def __init__(self,port="/dev/ttyACM0",baud=115200,*args):
		self.port=port
		self._serial=serial.serial(self.port,baud,*args)

class MessageClass(enum.Enum):
	UserLED=0
	Protocol=1
	MotorDriver=2

class UserLedCommand(enum.Enum):
	Enable=0
	Disable=1
	Toggle=2

class MotorDriverCommand(enum.Enum):
	RawSPI=0

class ProtocolCommand(enum.Enum):
	BadCrc=0
	Acknowledge=1
	NegativeAcknowledge=2
	InvalidMessageClass=3

class ChecksumError(IOError):
	pass

class Message(object):
	category=0
	command=0
	data=b""
	checksum=0
	
	@classmethod
	def recieve(self,board):
		serial=board._serial
	
	def send(self,board):
		write=board._serial.write
		
		write(self.category)
		write(self.command)
		write(self.data)
		write(self.checksum//256)
		write(self.checksum%256)
	
	def calculate_checksum(self):
		return (self.category+self.command+sum(self.data))%(2**16)
	
	def check_checksum(self):
		calculated=self.calculate_checksum()
		if self.checksum!=calculated:
			raise ChecksumError("Calculated 0x%04x != actual 0x%04x" % (calculated,self.checksum))
m=Message()