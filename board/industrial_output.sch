EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:industrial_output-cache
EELAYER 24 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Industrial Digital Output"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NPN Q?
U 1 1 52E6FDE0
P 5450 4500
F 0 "Q?" H 5650 4500 50  0000 L CNN
F 1 "NJT4031NT1G" H 5650 4600 50  0000 L CNN
F 2 "" H 5450 4500 60  0000 C CNN
F 3 "" H 5450 4500 60  0000 C CNN
	1    5450 4500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E6FDF4
P 4900 4500
F 0 "R?" V 4980 4500 50  0000 C CNN
F 1 "470" V 4900 4500 50  0000 C CNN
F 2 "" H 4900 4500 60  0000 C CNN
F 3 "" H 4900 4500 60  0000 C CNN
	1    4900 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 4500 5250 4500
$Comp
L GND #PWR?
U 1 1 52E6FE0A
P 5550 4800
F 0 "#PWR?" H 5550 4800 30  0001 C CNN
F 1 "GND" H 5550 4730 30  0001 C CNN
F 2 "" H 5550 4800 60  0000 C CNN
F 3 "" H 5550 4800 60  0000 C CNN
	1    5550 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4700 5550 4800
Text HLabel 4550 4500 0    60   Input ~ 0
MCU_Pin
Wire Wire Line
	4550 4500 4650 4500
Wire Wire Line
	5550 3600 5550 4300
Text HLabel 5550 3600 1    60   Input ~ 0
Sink
$Comp
L DIODE D?
U 1 1 52E705F0
P 5800 3900
F 0 "D?" V 5900 3800 40  0000 R CNN
F 1 "RSX501L-20TE25" V 5800 3800 40  0000 R CNN
F 2 "" H 5800 3900 60  0000 C CNN
F 3 "" H 5800 3900 60  0000 C CNN
	1    5800 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 4100 5800 4200
Wire Wire Line
	5800 4200 5550 4200
Connection ~ 5550 4200
$Comp
L +24V #PWR?
U 1 1 52E70673
P 5800 3600
F 0 "#PWR?" H 5800 3550 20  0001 C CNN
F 1 "+24V" H 5800 3700 30  0000 C CNN
F 2 "" H 5800 3600 60  0000 C CNN
F 3 "" H 5800 3600 60  0000 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3600 5800 3700
$EndSCHEMATC
