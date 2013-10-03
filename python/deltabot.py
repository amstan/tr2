#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import numpy
from nspheres import *

class DeltaBot(object):
	def __init__(self, rf=1.0, re=1.0, f=1.0, e=0.5):
		"""
		@arg rf length of upper arm
		@arg re length of lower arm
		@arg f side of top triangle
		@arg e side of bottom triangle
		"""
		
		self.rf=rf
		self.re=re
		self.f=f
		self.e=e
		
		inscribed_circle_radius=numpy.array([numpy.sqrt(3)/6,0,0])
		self.Fn       =inscribed_circle_radius*self.f
		self.En_offset=inscribed_circle_radius*self.e #this is relative to E0
	
	@staticmethod
	def rotate_z(point, angle):
		"""Rotates coordonates about the z=0 line. Useful in rotating for the other joints."""
		cos=numpy.cos(angle)
		sin=numpy.sin(angle)
		transform=numpy.array([
			[ cos, sin, 0, 0],
			[-sin, cos, 0, 0],
			[   0,   0, 1, 0],
			[   0,   0, 0, 1],
		])
		
		point=numpy.hstack([point,[1]]) #homogenize
		
		point=point.dot(transform)
		
		point=point[:-1]/point[-1] #dehomogenize
		
		return point
	
	def forward(self,thetas):
		Jns=[]
		for n,theta_n in enumerate(thetas):
			Jn=numpy.array([numpy.cos(theta_n)*self.rf,0,-numpy.sin(theta_n)*self.rf]) #Jn offset from Fn
			Jn+=self.Fn #real Jn
			Jn-=self.En_offset #compensate for size of endefector
			Jn=self.rotate_z(Jn,numpy.radians(120*n)) #rotate alpha
			Jns.append(Jn)
		return intersectionpoint(numpy.transpose(Jns), numpy.ones(3)*d.e)
	
d=DeltaBot()
print(d.forward(map(numpy.radians,[45,45,45])))