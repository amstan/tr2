#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

try:
	filename,scale=sys.argv[1:]
	scale=float(scale)
except Exception:
	sys.stderr.write("Usage: resize.py input.kicad_mod scale>output.kicad_mod\n")
	raise

import re

f=open(filename).read()
def scaler(match):
	return str(float(match.group())*scale)
f=re.sub("-?[0-9]+\.?[0-9]*",scaler,f)
print f
