#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import numpy
from nspheres import *

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

def circle_intersect_XZ(circle1,circle2):
	"""Intersects 2 circles[(center,radius) turples] and returns the point farthest from origin. Useful for inverse kinematics."""
	c1,r1=circle1
	c2,r2=circle2
	
	v=(c1-c2)
	d=numpy.linalg.norm(v)
	u=(v)/d #direction between circles
	p=u.dot(numpy.array([[0,0,-1],[0,1,0],[1,0,0]])) #direction of chord
	
	a=(r1**2 - r2**2 + d**2)/(2*d) #distance from c1 to middle of intersection
	h=numpy.sqrt(r1**2-a**2) #distance from middle of intersection to the intersection points
	
	i=c1+u*a #middle of intersection chord
	
	i1=i+p*h
	i2=i-p*h
	
	return min([i1,i2],key=numpy.linalg.norm)

class DeltaBot(object):
	def __init__(self, rf=1.0, re=2.0, f=1.0, e=0.5):
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
	
	def forward(self,thetas):
		Jns=[]
		for n,theta_n in enumerate(thetas):
			Jn=numpy.array([numpy.cos(theta_n)*self.rf,0,-numpy.sin(theta_n)*self.rf]) #Jn offset from Fn
			Jn+=self.Fn #real Jn
			Jn-=self.En_offset #compensate for size of endefector
			Jn=rotate_z(Jn,numpy.radians(120*n)) #rotate from alpha
			Jns.append(Jn)
		
		Jns=-numpy.array(Jns) #move it under the robot
		E0=intersectionpoint(numpy.transpose(Jns), numpy.ones((3,1))*self.re)
		E0*=-1 #move it under the robot
		return E0
	
	def inverse(self,pos):
		thetas=[]
		for n in range(3):
			#find En
			E0=rotate_z(pos,numpy.radians(-120*n)) #rotate so we're in alpha
			En=E0+self.En_offset
			
			Epn=numpy.array([En[0],0,En[2]]) #project Epn on alpha
			EnEpn=En[1] #distance of En to alpha
			
			EpnJn=numpy.sqrt(self.re**2-EnEpn**2)
			
			Jn=circle_intersect_XZ((self.Fn,self.rf),(Epn,EpnJn))
			Jn-=self.Fn #offset
			
			theta_n=numpy.arctan2(Jn[2],-Jn[0])
			thetas.append(theta_n)
		return thetas

if __name__=="__main__":
	d=DeltaBot()
	#print(list(map(numpy.degrees,d.inverse(numpy.array([1,0,-2])))))
	print(d.forward(d.inverse(numpy.array([1,0,-2]))))
	#print(d.forward(map(numpy.radians,[23,23,23])))