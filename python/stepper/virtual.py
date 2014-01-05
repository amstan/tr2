#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import math
modes = {"idle","move","run"}

class StepperModel(object):
	"""Class meant to simulate the speed behavoir of the stepper motor drivers."""
	
	#current values
	position = 0
	velocity = 0
	
	parameters = {
		"ACC": 1,
		"DEC": 2,
		"MAX_SPEED": 10,
		"MIN_SPEED": 0,
	}
	
	mode = "idle"
	target = 0
	
	def simulate(self,steps=1):
		for step in range(steps):
			self.position += self.velocity
			
			if self.mode=="move":
				direction=(1,-1)[self.target<self.position]
				acceleration=direction*self.parameters["ACC"]
				if self._will_overshoot():
					acceleration=-self.parameters["DEC"]
				if self.target==self.position and self.velocity==0:
					self.mode=="idle"
			if self.mode=="idle":
				acceleration=0
			self.velocity+=acceleration
			
			if abs(self.velocity)>self.parameters["MAX_SPEED"]:
				self.velocity=math.copysign(self.parameters["MAX_SPEED"],self.velocity)
			if (abs(self.velocity)<self.parameters["MIN_SPEED"]) and acceleration<=0:
				self.velocity=0
	
	def _will_overshoot(self):
		distance_to_go=self.target-(self.position+self.velocity)
		steps_to_go=self.velocity/self.parameters["DEC"]-1
		stopping_distance=(self.velocity*steps_to_go)/2
		return stopping_distance>=distance_to_go
	
	#def run(self,target_velocity):
		#mode="run"
		#target=target_velocity
	
	def move(self,target_position):
		self.mode="move"
		self.target=target_position
	
	def __str__(self):
		return "%s %d%+d" % (self.__class__.__name__,self.position,self.velocity)

if __name__=="__main__":
	s=StepperModel()
	s.move(300)
	print(s)
	
	def test_simulation(steps=1000):
		for i in range(steps):
			time.sleep(0.02)
			s.simulate(1)
			print(s,s._will_overshoot())
			if s.mode=="idle":
				break
	
	test_simulation()