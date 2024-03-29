#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import atexit
import math
import numpy
import time

import stepper.l6470 as l6470
from kinematics.kinematics import ParallelKinematicsModel
import board

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
			(0b1<<5)+ #voltage compensation
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
		self["ocd_th"]=int((6-0.375)/0.375)-1
		self["alarm_en"]=0b11001111
		
		self["stall_th"]=0b1111111 #max
		
		self.set_speed()
		self.set_acc()
		self.set_kval(0.5)
	
	def set_speed(self,value=4096):
		self["max_speed"]=value//1024
	
	def set_acc(self,value=200):
		self["acc"]=value
		self["dec"]=int(value*1.8)
	
	def set_kval(self,factor=1.0):
		self["kval_acc"]=self["kval_dec"]=int(100*factor)
		self["kval_run"]=int(100*factor)
		self["kval_hold"]=int(70*factor)
	
	def goto(self,angle):
		"""Absolute move to an angle(radians)."""
		super().goto(round(angle/self.position_resolution*128))
	
	def run(self,angular_velocity):
		super().run(round(angular_velocity/self.speed_resolution))
	
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
	def __init__(self,port="/dev/ttyUSB0"):
		self.board=board.Board(port)
		
		for i in range(255):
			self.board.set_led_range(0,(0,121),(i,i,i))
		
		self.arms=[Arm(board.SPIMotor(self.board,cs)) for cs in (1,2,0)]
		self.otherarm=Arm(board.SPIMotor(self.board,3))
		atexit.register(self.hiz)
		
		self.kinematics=ParallelKinematicsModel(
			e=105.587, #105.587,
			f=450, #327.040,
			re=378.825,
			rf=150.0, #127.000,
		)
	
	def hiz(self):
		"""Disables all the arms"""
		print("Making arms safe.")
		for arm in self.arms:
			try:
				arm["dec"]=100
				arm.soft_hiz()
			except BaseException as e:
				print("Error: could not stop an arm! %s" % e)
				pass
	make_safe=hiz
	
	def stop(self):
		for arm in self.arms:
			try:
				arm.hard_stop()
			except BaseException as e:
				print("Error: could not stop an arm! %s" % e)
				pass
	
	def wait(self):
		"""Wait for motion to finish"""
		for arm in self.arms:
			arm.wait()
	
	def calibrate(self,speed=5000,acc=100,kval=0.5):
		for arm in self.arms:
			try:
				arm.check_errors()
			except l6470.StepperBaseException as e:
				print(e)
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
				self.move([0,point,-285])
				self.wait()
			for point in range(150,-150,-10):
				self.move([0,point,-285])
				self.wait()
	
	def circle(self,target,seconds=3.0,agressiveness=20):
		"""
		Linear motion to target
		@arg target 3d point to go to.
		@arg seconds to get there
		@arg agressiveness if this is too high it'll oscillate :)
		"""
		
		def interpolate(f):
			angle=f*math.radians(360)
			return [math.sin(angle)*target[1],math.cos(angle)*target[1],target[2]]
		
		start_position=self.position
		target_position=numpy.array(target)
		#distance=numpy.linalg.norm(target-start_pos) #TODO: calculate time somehow based on this
		
		r.move(target)
		r.wait()
		
		try:
			start_time=time.monotonic()
			while 1:
				#when am i?
				elapsed_time=time.monotonic()-start_time
				
				#where am i?
				real_joints=numpy.array([-arm.position for arm in self.arms])
				#real_position=self.kinematics.forward(joint_position)
				
				#where am i supposed to be?
				wanted_position=interpolate(elapsed_time/seconds)
				wanted_joints=self.kinematics.inverse(wanted_position)
				
				#how far off am i?
				delta_joints=wanted_joints-real_joints
				
				#fix
				delta_speeds=delta_joints*agressiveness
				for arm,speed in zip(self.arms,delta_speeds):
					arm.run(-float(speed))
				
				if elapsed_time>seconds:
					#near the end just move to the right spot
					self.stop()
					self.move(target_position)
					self.wait()
					break
		except BaseException:
			self.stop()
			raise
	
	def linear(self,target,seconds=5.0,agressiveness=10):
		"""
		Linear motion to target
		@arg target 3d point to go to.
		@arg seconds to get there
		@arg agressiveness if this is too high it'll oscillate :)
		"""
		
		def linear_interpolate(a,b,f):
			"""Return a point in between point a and point b, depending on the factor f.
			@arg f=0 means a, f=1 means b, f=0.5 means in the middle.
			@todo make this accelerate and decelerate"""
			
			return a*(1-f)+b*f
		
		start_position=self.position
		target_position=numpy.array(target)
		#distance=numpy.linalg.norm(target-start_pos) #TODO: calculate time somehow based on this
		
		self.board.set_led_range(0,(0,121),(10,10,10))
		led=0
		try:
			start_time=time.monotonic()
			while 1:
				#when am i?
				elapsed_time=time.monotonic()-start_time
				
				self.board.set_led_range(0,(led,led+1),(10,10,10))
				led=int((elapsed_time/seconds)*120)
				self.board.set_led_range(0,(led,led+1),(255,255,255))
				
				#where am i?
				real_joints=numpy.array([-arm.position for arm in self.arms])
				#real_position=self.kinematics.forward(joint_position)
				
				#where am i supposed to be?
				wanted_position=linear_interpolate(start_position,target_position,elapsed_time/seconds)
				wanted_joints=self.kinematics.inverse(wanted_position)
				
				#how far off am i?
				delta_joints=wanted_joints-real_joints
				
				#fix
				delta_speeds=delta_joints*agressiveness
				for arm,speed in zip(self.arms,delta_speeds):
					arm.run(-float(speed))
				
				if elapsed_time>seconds:
					#near the end just move to the right spot
					self.stop()
					self.move(target_position)
					self.wait()
					break
		except BaseException:
			self.stop()
			raise

if __name__=="__main__":
	r=DeltaRobot()
	
	print("Calibrating...")
	r.calibrate()
	print("Done!")
	
	for arm in r.arms:
		arm.set_kval(1)
	
	a=r.arms[1]
	def test_linear(a=[-100,-100,-330],b=[100,100,-330]):
		for arm in r.arms: arm.set_speed(5000)
		while 1:
			r.linear(a,seconds=5.0)
			r.linear(b,seconds=5.0)
	
	def square(acc=200,kval=1.0,speed=20000):
		for arm in r.arms:
			arm.set_speed(speed)
			arm.set_acc(acc)
			arm.set_kval(kval)
		while 1:
			try:
				for point,color in [([100,100,-260],(255,100,100)),([-100,100,-260],(255,255,0)),([-100,-100,-260],(100,255,100)),([100,-100,-260],(100,100,255))]:
					r.move(point)
					r.board.set_led_range(0,(0,120),color)
					r.wait()
			except:
				r.stop()
				raise
	
	def color(color):
		for i in range(121):
			r.board.set_led_range(0,(0,i),(color))