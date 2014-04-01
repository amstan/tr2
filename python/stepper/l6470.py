#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from collections import OrderedDict

import signal

class DelayedKeyboardInterrupt(object):
	def __enter__(self):
		self.signal_received = False
		self.old_handler = signal.getsignal(signal.SIGINT)
		signal.signal(signal.SIGINT, self.handler)
	
	def handler(self, signal, frame):
		self.signal_received = (signal, frame)
		print('SIGINT received. Delaying KeyboardInterrupt.')
	
	def __exit__(self, type, value, traceback):
		signal.signal(signal.SIGINT, self.old_handler)
		if self.signal_received:
			self.old_handler(*self.signal_received)

def without_interruptions(function):
	def wrapper(*args):
		with DelayedKeyboardInterrupt():
			return function(*args)
	return wrapper

def split_bytes(value,num_bytes=None):
	"""Given a long int it'll split it in bytes."""
	s=[]
	while 1:
		s.append(value%256)
		value//=256
		
		if num_bytes is None:
			if value==0:
				break
		else:
			num_bytes-=1
			if num_bytes==0:
				break
	return reversed(s)

class StepperBaseException(BaseException):
	"""All exceptions related to the stepper."""
	status_bits=OrderedDict()
	
	def __init__(self,motor_driver,doc=None,other_exceptions=()):
		self.motor_driver=motor_driver
		if doc is not None:
			self.__doc__=doc
		self.other_exceptions=other_exceptions
	
	@classmethod
	def register_status_bit(cls,bit_name):
		"""Decorator to associate child exception with bits from the status register."""
		def wrapper(child_exception):
			cls.status_bits[bit_name]=child_exception
			return child_exception
		return wrapper
	
	def __repr__(self):
		if len(self.other_exceptions)==0:
			others=""
		else:
			others=",%r" % (self.other_exceptions)
		return "%s(%r,%r%s)" % (self.__class__.__name__,self.motor_driver,self.__doc__,others)
	def __str__(self):
		if len(self.other_exceptions)==0:
			others=""
		else:
			others="\nOthers: %r" % (self.other_exceptions)
		return "%s on %r%s" % (self.__doc__,self.motor_driver,others)

class StepperException(StepperBaseException,Exception):
	"""Anything that's not normal behavoir."""

@StepperBaseException.register_status_bit("OCD")
class OCD(StepperException):
	"""Overcurrent"""
	pass
@StepperBaseException.register_status_bit("TH_SD")
class TH_SD(StepperException):
	"""Thermal shutdown"""
	pass
@StepperBaseException.register_status_bit("TH_WRN")
class TH_WRN(StepperException,Warning):
	"""Thermal warning"""
	pass
@StepperBaseException.register_status_bit("UVLO")
class UVLO(StepperException):
	"""Undervoltage"""
	pass
@StepperBaseException.register_status_bit("STEP_LOSS_A")
@StepperBaseException.register_status_bit("STEP_LOSS_B")
class STEP_LOSS(StepperException):
	"""Step Loss"""
	pass
@StepperBaseException.register_status_bit("WRONG_CMD")
class WRONG_CMD(StepperException,AttributeError):
	"""Wrong command"""
	pass
@StepperBaseException.register_status_bit("NOTPERF_CMD")
class NOTPERF_CMD(StepperException,ValueError):
	"""Can't perform command(perhaps wrong arguments or already in motion)"""
	pass
@StepperBaseException.register_status_bit("SW_EVN")
class SW_EVN(StepperBaseException):
	"""Limit switch event"""
	pass

class Stepper(object):
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
		self.reset()
		try:
			self.check_errors()
		except UVLO:
			"""It's normal to have this when it boots the first time."""
			pass
	
	@without_interruptions
	def nop(self,count=5):
		for i in range(count):
			self.spi.xfer(self._commands["NOP"])
	
	@without_interruptions
	def __getitem__(self,reg):
		"""Gets register"""
		reg_id,reg_name,reg_len=self._register_info(reg)
		
		self.spi.xfer(self._commands["GET_PARAM"]+reg_id)
		
		value=0
		reg_len_bytes=(reg_len-1)//8+1
		for i in reversed(range(reg_len_bytes)):
			byte=self.spi.xfer(0)
			value+=byte*(256**i)
		
		if reg_name=="ABS_POS":
			half_range=2**(reg_len-1)
			full_range=half_range*2
			if value>=half_range:
				value-=full_range
		
		return value
	
	@without_interruptions
	def __setitem__(self,reg,value):
		"""Sets register"""
		reg_id,reg_name,reg_len=self._register_info(reg)
		
		self.spi.xfer(self._commands["SET_PARAM"]+reg_id)
		
		mask=(2**reg_len)-1
		value&=mask
		
		reg_len_bytes=(reg_len-1)//8+1
		for b in split_bytes(value,reg_len_bytes):
			self.spi.xfer(b)
	
	@without_interruptions
	def run(self,speed):
		"""Run at constant speed."""
		direction=speed>0
		self.spi.xfer(self._commands["RUN"]+direction)
		for b in split_bytes(abs(speed),num_bytes=3):
			self.spi.xfer(b)
	
	@without_interruptions
	def step_clock(self,direction=False):
		"""Switch into the step clock mode(direction from the pin)."""
		self.spi.xfer(self._commands["STEP_CLOCK"]+forward)
	
	@without_interruptions
	def move(self,steps):
		"""Relative move."""
		direction=steps>0
		self.spi.xfer(self._commands["MOVE"]+direction)
		for b in split_bytes(abs(steps),num_bytes=3):
			self.spi.xfer(b)
	
	@without_interruptions
	def goto(self,position):
		"""Absolute move to position though the shortest path(could wrap around)."""
		self.spi.xfer(self._commands["GOTO"])
		for b in split_bytes(position%(2**22),num_bytes=3):
			self.spi.xfer(b)
	
	@without_interruptions
	def goto_dir(self,position,direction):
		"""Absolute move to position though the shortest path, by explicitly defining a direction."""
		self.spi.xfer(self._commands["GOTO_DIR"]+direction)
		for b in split_bytes(position%(2**22),num_bytes=3):
			self.spi.xfer(b)
	
	@without_interruptions
	def go_until(self,speed,direction,mark=False):
		"""Go with a specific speed and direction until the switch is pressed.
		If mark==True then the current position will be copied to the MARK register, otherwise the home position will be reset."""
		self.spi.xfer(self._commands["GO_UNTIL"]+(mark<<3)+direction)
		for b in split_bytes(abs(speed),num_bytes=3):
			self.spi.xfer(b)
	
	@without_interruptions
	def release_sw(self,direction,mark=False):
		"""Go with the minimum speed and direction until the switch is released.
		If mark==True then the current position will be copied to the MARK register, otherwise the home position will be reset."""
		self.spi.xfer(self._commands["RELEASE_SW"]+(mark<<3)+direction)
	
	@without_interruptions
	def go_home(self):
		"""Go to ABS_POS==0 through the shortest path."""
		self.spi.xfer(self._commands["GO_HOME"])
	@without_interruptions
	def go_mark(self):
		"""Go to ABS_POS==MARK through the shortest path."""
		self.spi.xfer(self._commands["GO_MARK"])
	
	@without_interruptions
	def reset_pos(self):
		"""Set ABS_POS=0."""
		self.spi.xfer(self._commands["RESET_POS"])
	
	@without_interruptions
	def reset(self,unsafe=False):
		"""Resets the device to default state."""
		
		if not unsafe:
			#make sure it's not moving
			self.soft_hiz()
			while self.status["BUSY"]:
				pass
		
		self.spi.xfer(self._commands["RESET_DEVICE"])
	
	@without_interruptions
	def soft_stop(self):
		"""Deaccelerate to a hold."""
		self.spi.xfer(self._commands["SOFT_STOP"])
	@without_interruptions
	def hard_stop(self):
		"""Instantly stop to a hold."""
		self.spi.xfer(self._commands["HARD_STOP"])
	@without_interruptions
	def soft_hiz(self):
		"""Deaccelerate to a HiZ."""
		self.spi.xfer(self._commands["SOFT_HIZ"])
	@without_interruptions
	def hard_hiz(self):
		"""Instantly stop to a HiZ."""
		self.spi.xfer(self._commands["HARD_HIZ"])
	
	@staticmethod
	def _parse_status(value):
		def test_bit(bit_id):
			return bool(value&(1<<bit_id))
		return {
			"SCK_MOD": test_bit(15), #Step Clock Mode
			"STEP_LOSS_B": not test_bit(14), #Skipped step
			"STEP_LOSS_A": not test_bit(13), #Skipped step
			"OCD": not test_bit(12), #Overcurrent
			"TH_SD": not test_bit(11), #Thermal shutdown
			"TH_WRN": not test_bit(10), #Thermal warning point
			"UVLO": not test_bit(9), #Undervoltage/powerup
			"WRONG_CMD": test_bit(8), #Cannot find command
			"NOTPERF_CMD": test_bit(7), #Argument error
			"MOT_STATUS": ["Stopped","Accelerating","Deccelerating","Constant Speed"][(value>>5)&0b11], #Motion mode
			"DIR": test_bit(4), #Forward direction
			"SW_EVN": test_bit(3), #Switch turn on event
			"SW_F": test_bit(2), #Switch state(high=closed)
			"BUSY": not test_bit(1),
			"HiZ": test_bit(0),
		}
	
	@without_interruptions
	def get_status(self):
		"""Returns the status dict, but also clears all the latchable stuff
		(UVLO, TH_WRN, TH_SD, OCD, STEP_LOSS_A, STEP_LOSS_B, NOTPERF_CMD, WRONG_CMD and SW_EVN)."""
		self.spi.xfer(self._commands["GET_STATUS"])
		value=self.spi.xfer(0)*256+self.spi.xfer(0)
		return self._parse_status(value)
	@property
	def status(self):
		"""Returns fancy status dict."""
		return self._parse_status(self["status"])
	
	def check_errors(self,status=None):
		"""Checks the status and raises exceptions if needed."""
		if status is None:
			status=self.get_status()
		exceptions=[]
		for possible_error,possible_exception in StepperException.status_bits.items():
			if status[possible_error]:
				exceptions.append(possible_exception)
		if len(exceptions)==0:
			return
		else:
			raise exceptions[0](self,other_exceptions=[other(self) for other in exceptions[1:]])
	
	def wait(self):
		"""Blocks while busy."""
		while True:
			status=self.get_status()
			try:
				self.check_errors(status)
			except STEP_LOSS:
				pass
			except Exception as e:
				raise
			if not status["BUSY"]:
				break
	
	def calibrate(self,speed=5000):
		try:
			self.go_until(speed,0)
			self.wait()
		except SW_EVN:
			pass
		
		try:
			self.release_sw(1)
			self.wait()
		except SW_EVN:
			pass
	
	def __repr__(self):
		return "L6460(%r)" % (self.spi,)

if __name__=="__main__":
	import pirate430
	spi_device=pirate430.SPIDevice(pirate430.SPI(),cs=2)
	
	s=Stepper(spi_device)
	s["config"]=0b0001111010001000 #lower pwm frequency
	s["acc"]=s["dec"]=1000
	s["kval_acc"]=s["kval_dec"]=100
	s["kval_run"]=50
	s["kval_hold"]=30
	s["step_mode"]=7 #128 microstepping
	s["int_speed"]=0
	s["st_slp"]=0
	s["fn_slp_acc"]=0
	s["fn_slp_dec"]=0
	s["fs_spd"]=1000
	s["max_speed"]=1048575//1024//1
	s["ocd_th"]=0b1010 #3.75A
	
	def zigzag():
		try:
			while(1):
				s.move(10000*100)
				s.wait()
				
				s.move(-(10000+128//8)*100)
				s.wait()
				
				s.check_errors()
		except:
			s.nop()
			raise
	zigzag()