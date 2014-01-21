#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import math

class StepperModel(object):
	"""Class meant to simulate the speed behavoir of the stepper motor drivers."""
	
	#current values
	position = 0
	velocity = 0
	
	parameters = {
		"ACC": 1,
		"DEC": 1,
		"MAX_SPEED": 50,
		#"MIN_SPEED": 1,
	}
	
	mode = "idle"
	target = 0
	
	_modes = {"idle","move","run"}
	
	def simulate(self,steps=1):
		for step in range(steps):
			if self.mode=="move":
				direction=self.move_direction
				overshoot=self._overshoot()
				acceleration=min(
					[-self.parameters["DEC"],0,self.parameters["ACC"]],
					key=lambda choice: abs(overshoot+choice*direction)
				)*direction
				if self._almost_there():
					self.mode="idle"
					self.position=self.target
					self.velocity=0
			if self.mode=="idle":
				acceleration=0
			
			if abs(self.velocity)>self.parameters["MAX_SPEED"]:
				self.velocity=math.copysign(self.parameters["MAX_SPEED"],self.velocity)
			
			self.velocity+=acceleration
			self.position+=self.velocity
	
	def _almost_there(self):
		lowest_step_possible=max(self.parameters["ACC"],self.parameters["DEC"])
		return abs(self.target-self.position)<lowest_step_possible and self.velocity<lowest_step_possible
	
	def _overshoot(self):
		distance_to_go=self.target-(self.position+self.velocity)
		direction=self.move_direction
		steps_to_go=self.velocity/(self.parameters["DEC"]*direction)
		stopping_distance=((self.velocity+(self.parameters["ACC"]*direction))*steps_to_go)/2
		return stopping_distance-distance_to_go
	
	@property
	def move_direction(self):
		return (1,-1)[self.target<self.position]
	
	#def run(self,target_velocity):
		#mode="run"
		#target=target_velocity
	
	def move(self,target_position):
		self.mode="move"
		self.target=target_position
	
	def __str__(self):
		return "%s %d%+d" % (self.__class__.__name__,self.position,self.velocity)

if __name__=="__main__":
	def test_simulation(distance=110,steps=100):
		s=StepperModel()
		s.move(1100)
		print(s)
		for i in range(steps):
			s.simulate(1)
			print(s.mode,s,)
			if s.mode=="idle":
				break
	
	def test_stopping(r=range(-120,120)):
		for i in r:
			s=StepperModel()
			s.move(i)
			for step in range(abs(i)+13):
				s.simulate(1)
				if s.mode=="idle":
					break
			print(s.position==i,s.mode=="idle",s.position,i,s.mode,step)
	
	#test_stopping()
	test_simulation(1100)