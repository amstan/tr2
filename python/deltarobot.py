#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import atexit

import math
import numpy

import stepper.l6470 as l6470
from kinematics.kinematics import ParallelKinematicsModel

class Arm(l6470.Stepper):
	resolution=math.radians(1.8/3) #angle per step
	limit_sw_angle=math.radians(-57)
	
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
	
	def goto(self,angle):
		"""Absolute move to an angle(radians)."""
		print(angle,round(angle/self.resolution*128))
		super().goto(round(angle/self.resolution*128))
	
	def nrun(self,angular_velocity):
		super().run(angular_velocity)
	
	@property
	def position(self):
		return self["abs_pos"]*self.resolution/128
	
	@property
	def speed(self):
		return self["speed"]
	
	def test_zigzag(self,a=5000,b=15000):
		while 1:
			self.goto(a)
			self.wait()
			self.goto(b)
			self.wait()

class DeltaRobot(object):
	def __init__(self,arms):
		if len(arms)!=3:
			raise ValueError("Need 3 arms!")
		
		self.arms=arms
		atexit.register(self.hiz)
		
		self.kinematics=ParallelKinematicsModel(
			e=100
			f=327.040
			re=378.825
			rf=155.0
		)
	
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
	
	def calibrate(self,speed=5000,acc=100,kval=0.5):
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
				arm.goto(-arm.limit_sw_angle)
				arm.wait()
				arm.reset_pos()
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
				arm.goto(math.radians(10))
				arm.wait()
				oldarm.goto(math.radians(-30))
				oldarm.wait()
				oldarm=arm
	
	def move(self,point):
		angles=self.kinematics.inverse(point)
		for arm,angle in zip(self.arms,angles):
			arm.goto(float(-angle))
		self.wait()
		return self.position
	
	@property
	def position(self):
		return self.kinematics.forward([
			-arm.position for arm in self.arms
		])
	
	def line(self):
		while 1:
			for point in range(-150,150,10):
				self.move([0,point,-320])
				self.wait()
			for point in range(150,-150,-10):
				self.move([0,point,-320])
				self.wait()
	
	def circle(self):
		while 1:
			for angle in range(0,360,5):
				angle=math.radians(angle)
				self.move([math.sin(angle)*150,math.cos(angle)*150,-350])
				self.wait()

if __name__=="__main__":
	import pirate430
	spi=pirate430.SPI()
	r=DeltaRobot([Arm(pirate430.SPIDevice(spi,cs)) for cs in range(3)])
	
	print("Calibrating...")
	r.calibrate()
	print("Done!")
	
	a=r.arms[0]