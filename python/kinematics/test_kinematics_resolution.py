#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import numpy
from kinematics import *

import matplotlib
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

if __name__=="__main__":
	fig = plt.figure()
	ax = Axes3D(fig)
	
	m=ParallelKinematicsModel()
	
	t=numpy.arange(0,90,10)
	t=numpy.radians(t)
	
	poss=[]
	for t1 in t:
		for t2 in t:
			for t3 in t:
				pos=m.forward([t1,t2,t3])
				print(numpy.degrees(t1),numpy.degrees(t2))
				poss.append(pos)
	print(len(poss))
	ax.scatter(*zip(*poss))
	plt.show()