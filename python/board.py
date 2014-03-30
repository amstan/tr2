#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import serial
import enum
import time

import signal

class DelayedKeyboardInterrupt(object):
	def __init__(self,board):
		self.board=board
	
	def __enter__(self):
		self.signal_received = False
		self.old_handler = signal.getsignal(signal.SIGINT)
		signal.signal(signal.SIGINT, self.handler)
	
	def handler(self, signal, frame):
		self.signal_received = (signal, frame)
		print('SIGINT received. Delaying KeyboardInterrupt.')
	
	def __exit__(self, type, value, traceback):
		signal.signal(signal.SIGINT, self.old_handler)
		self.board.sync()
		if self.signal_received:
			self.old_handler(*self.signal_received)

class ChecksumError(IOError):
	pass

class MessageClass(enum.IntEnum):
	NOP=0
	Protocol=1
	UserLED=2
	MotorDriver=3

class UserLedCommand(enum.IntEnum):
	Enable=0
	Disable=1
	Toggle=2

class MotorDriverCommand(enum.IntEnum):
	RawSPI=0

class ProtocolCommand(enum.IntEnum):
	NOP=0
	BadCrc=1
	Acknowledge=2
	NegativeAcknowledge=3
	InvalidMessageClass=4

class Board(object):
	def __init__(self,port="/dev/ttyUSB0",baud=115200,*args):
		self.port=port
		self._serial=serial.Serial(self.port,baud,timeout=0.1,*args)
	
	def MotorDriverRawSPI(self,data,cs):
		with DelayedKeyboardInterrupt(self):
			m=Message(self)
			m.category=MessageClass.MotorDriver
			m.command=MotorDriverCommand.RawSPI
			m.data=(cs,len(data))+tuple(data)
			m.checksum=m.calculate_checksum()
			m.send()
			
			replymsg=Message.recieve(self,m)
			return replymsg.data[2:]
		
	def sync(self):
		while 1:
			self._serial.flushInput()
			self._serial.flushOutput()
			self._serial.write([0x00])
			reply=self._serial.read(4)
			if len(reply)!=4:
				print("Can't read 4 bytes: %r, sending 0x00" % reply)
				continue
			
			category,command,_,_=reply
			if ((category==MessageClass.Protocol) and (command==ProtocolCommand.Acknowledge)):
				break

class SPIMotor(object):
	def __init__(self,board,cs=0):
		self.board=board
		self.cs=cs
	
	def xfer(self,byte):
		reply=self.board.MotorDriverRawSPI([byte],cs=self.cs)
		return reply[0]
	
	def __repr__(self):
		return "SPIMotor(%r, cs=%r)" % (self.board,self.cs)

class Message(object):
	category=0
	command=0
	data=b""
	checksum=0
	
	def __init__(self,board):
		self.board=board
	
	@classmethod
	def recieve(cls,board,initiating_msg=None):
		serial=board._serial
		read=serial.read
		
		self=cls(board)
		self.category=read(1)[0]
		self.command=read(1)[0]
		
		if(self.category==MessageClass.MotorDriver):
			if(self.command==MotorDriverCommand.RawSPI):
				cs,length=read(2)
				spi_reply=tuple(read(length))
				if len(spi_reply)!=length:
					raise ValueError("Not enough bytes recieved for spi reply.")
				self.data=(cs,length)+spi_reply
		else:
			self.data=()
		
		high,low=read(2)
		self.checksum=high*256+low
		
		self.check_checksum()
		
		expected_message=(self.category==MessageClass.Protocol and self.command==ProtocolCommand.Acknowledge) #Acknowledge
		if initiating_msg is not None:
			if self.category==initiating_msg.category and self.command==initiating_msg.command:
				expected_message=True
			else: #ack probably
				if(initiating_msg.category==MessageClass.MotorDriver):
					if(initiating_msg.command==MotorDriverCommand.RawSPI):
						expected_message=False
		#print(initiating_msg,self,(initiating_msg is not None),(self.category==initiating_msg.category and self.command==initiating_msg.command),(self.category==MessageClass.MotorDriver),(self.command==MotorDriverCommand.RawSPI))
		
		if not expected_message:
			print("Wrong message recieved back(syncing now). recieved=%r initiating_msg=%r" % (self,initiating_msg))
			board.sync()
			
			#raise Exception("Syncd!")
			initiating_msg.send()
			return Message.recieve(board,initiating_msg)
		
		return self
	
	def send(self):
		write=self.board._serial.write
		self.board._serial.flush() #TODO: Look for messages already in there
		
		write((self.category,self.command))
		write(self.data)
		write((self.checksum//256,self.checksum%256))
	
	def calculate_checksum(self):
		return (self.category+self.command+sum(self.data))%(2**16)
	
	def check_checksum(self):
		calculated=self.calculate_checksum()
		if self.checksum!=calculated:
			raise ChecksumError("Calculated 0x%04x != actual 0x%04x" % (calculated,self.checksum))
	
	def __str__(self):
		return "Message(%s,%s,%r)" % (MessageClass(self.category).name,self.command,self.data)
	__repr__=__str__

if __name__=="__main__":
	b=Board()
	m=Message(b)
	s=SPIMotor(b,cs=0)
	reply=s.xfer([0])