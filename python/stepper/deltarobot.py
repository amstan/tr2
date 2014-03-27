#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import l6470
import atexit

class Arm(l6470.Stepper):
	deg_per_steps=1.8
	
	def __init__(self,*args):
		super().__init__(*args)
		self["config"]=0b0001111010001000 #lower pwm frequency
		self["step_mode"]=7 #128 microstepping
		self["int_speed"]=0
		self["st_slp"]=0
		self["fn_slp_acc"]=0
		self["fn_slp_dec"]=0
		self["fs_spd"]=1000
		self["ocd_th"]=int((6-0.375)/0.375)-1 #3A
		
		self["stall_th"]=0b1111111 #max
		
		self.set_speed()
		self.set_acc()
		self.set_kval(0.5)
	
	def set_speed(self,value=5000):
		self["max_speed"]=value//1024
	
	def set_acc(self,value=500):
		self["acc"]=self["dec"]=value
	
	def set_kval(self,factor=1.0):
		self["kval_acc"]=self["kval_dec"]=int(100*factor)
		self["kval_run"]=int(100*factor)
		self["kval_hold"]=int(70*factor)
	
	def test_zigzag(self,a=5000,b=15000):
		while 1:
			motor.goto(a)
			motor.wait()
			motor.goto(b)
			motor.wait()

class DeltaRobot(object):
	def __init__(self,arms):
		if len(arms)!=3:
			raise ValueError("Need 3 arms!")
		self.arms=arms
		atexit.register(self.hiz)
	
	def hiz(self):
		"""Disables all the arms"""
		print("Making arms safe.")
		for arm in self.arms:
			arm["dec"]=100
			arm.soft_hiz()
	make_safe=hiz
	
	def stop(self):
		for arm in self.arms:
			arm.hard_stop()
	
	def wait(self):
		"""Wait for motion to finish"""
		for arm in self.arms:
			arm.wait()
	
	def calibrate(self,center_spot=10000,speed=5000,acc=100,kval=0.5):
		try:
			#raise them just a little
			for arm in self.arms:
				arm.set_kval(kval)
				arm.set_acc(acc)
				arm.set_speed(speed)
				arm.move(-200)
			self.wait()
			
			#calibrate
			for arm in self.arms:
				arm.calibrate(speed)
				
				#put it back in the center position
				arm.goto(center_spot)
				arm.wait()
		except:
			self.hiz()
			raise
	
	def test_spin(self,speed=20000,acc=200,kval=1):
		for arm in self.arms:
			arm.set_kval(kval)
			arm.set_acc(acc)
			arm.set_speed(speed)
		
		oldarm=self.arms[-1]
		while 1:
			for arm in reversed(self.arms):
				arm.goto(5000)
				arm.wait()
				oldarm.goto(15000)
				oldarm.wait()
				oldarm=arm

if __name__=="__main__":
	import pirate430
	spi=pirate430.SPI()
	r=DeltaRobot([Arm(pirate430.SPIDevice(spi,cs)) for cs in range(3)])