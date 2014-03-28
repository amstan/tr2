#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import atexit

import math
import numpy

import stepper.l6470 as l6470
from kinematics.kinematics import ParallelKinematicsModel

class Arm(l6470.Stepper):
	position_resolution=math.radians(1.8/3) #radians/step
	speed_resolution=(2**(-28))/(250*(10**(-9)))*position_resolution #(radians/seconds)/(steps/tick)
	limit_sw_angle=math.radians(-60)
	
	def __init__(self,*args):
		super().__init__(*args)
		#0b 000 111 10   1 0 0 0 1 000
		self["config"]=(
			(0b000<<13)+ #divider int
			(0b111<<10)+ #divider dec
			(0b11<<8)+ #slew rate
			(0b1<<7)+ #overcurrent shutdown
			(0b0<<5)+ #voltage compensation
			(0b0<<4)+ #switch behavoir(hardstop interrupt)
			(0b0<<3)+ #ext clock
			(0b000) #clock
		)
		
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
		super().goto(round(angle/self.position_resolution*128))
	
	def run(self,angular_velocity):
		super().run(angular_velocity/self.speed_resolution)
	
	@property
	def position(self):
		return self["abs_pos"]*self.position_resolution/128
	
	@property
	def speed(self):
		return self["speed"]*self.speed_resolution
	
	def test_zigzag(self,a=math.radians(0),b=math.radians(-40)):
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
			e=95, #105.587,
			f=327.040,
			re=378.825,
			rf=155.0, #127.000,
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
	
	def move(self,point,interpolation="simple"):
		if interpolation in ["simple","reiner"]:
			angles=self.kinematics.inverse(point)
			for arm,angle in zip(self.arms,angles):
				target=float(-angle)
				#if interpolation=="reiner":
					#arm["max_speed"]=
				
				arm.goto(target)
	
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

import time
def _speed_test(a):
	oldtime=time.time()
	while a.status["BUSY"]:
		a.check_errors()
		curtime=time.time()
		delta=curtime-oldtime
		print(delta,a.speed,a.position,a.position+a.speed*delta)
		oldtime=curtime

if __name__=="__main__":
	import pirate430
	spi=pirate430.SPI()
	r=DeltaRobot([Arm(pirate430.SPIDevice(spi,cs)) for cs in range(3)])
	
	print("Calibrating...")
	r.calibrate()
	print("Done!")
	
	a=r.arms[1]