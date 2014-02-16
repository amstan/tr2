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
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:74xgxx
LIBS:ac-dc
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:elec-unifil
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:microchip1
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:msp430
LIBS:nxp_armmcu
LIBS:powerint
LIBS:pspice
LIBS:sensors
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:components
LIBS:robot_controller-cache
EELAYER 24 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 18 26
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
L NPN Q1501
U 1 1 52E6FDE0
P 5450 4500
AR Path="/52FAAFCB/52E6FDE0" Ref="Q1501"  Part="1" 
AR Path="/52FAC46B/52E6FDE0" Ref="Q1601"  Part="1" 
AR Path="/52FAD3BD/52E6FDE0" Ref="Q1701"  Part="1" 
AR Path="/52FAD3C1/52E6FDE0" Ref="Q1801"  Part="1" 
AR Path="/52FAF26D/52E6FDE0" Ref="Q1901"  Part="1" 
AR Path="/52FAF271/52E6FDE0" Ref="Q2001"  Part="1" 
AR Path="/52FAF275/52E6FDE0" Ref="Q2101"  Part="1" 
AR Path="/52FAF279/52E6FDE0" Ref="Q2201"  Part="1" 
F 0 "Q1801" H 5650 4500 50  0000 L CNN
F 1 "NJT4031NT1G" H 5650 4600 50  0000 L CNN
F 2 "" H 5450 4500 60  0000 C CNN
F 3 "" H 5450 4500 60  0000 C CNN
	1    5450 4500
	1    0    0    -1  
$EndComp
$Comp
L R R1501
U 1 1 52E6FDF4
P 4900 4500
AR Path="/52FAAFCB/52E6FDF4" Ref="R1501"  Part="1" 
AR Path="/52FAC46B/52E6FDF4" Ref="R1601"  Part="1" 
AR Path="/52FAD3BD/52E6FDF4" Ref="R1701"  Part="1" 
AR Path="/52FAD3C1/52E6FDF4" Ref="R1801"  Part="1" 
AR Path="/52FAF26D/52E6FDF4" Ref="R1901"  Part="1" 
AR Path="/52FAF271/52E6FDF4" Ref="R2001"  Part="1" 
AR Path="/52FAF275/52E6FDF4" Ref="R2101"  Part="1" 
AR Path="/52FAF279/52E6FDF4" Ref="R2201"  Part="1" 
F 0 "R1801" V 4980 4500 50  0000 C CNN
F 1 "470" V 4900 4500 50  0000 C CNN
F 2 "" H 4900 4500 60  0000 C CNN
F 3 "" H 4900 4500 60  0000 C CNN
	1    4900 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 4500 5250 4500
$Comp
L GND #PWR0160
U 1 1 52E6FE0A
P 5550 4800
AR Path="/52FAAFCB/52E6FE0A" Ref="#PWR0160"  Part="1" 
AR Path="/52FAC46B/52E6FE0A" Ref="#PWR0162"  Part="1" 
AR Path="/52FAD3BD/52E6FE0A" Ref="#PWR0164"  Part="1" 
AR Path="/52FAD3C1/52E6FE0A" Ref="#PWR0166"  Part="1" 
AR Path="/52FAF26D/52E6FE0A" Ref="#PWR0168"  Part="1" 
AR Path="/52FAF271/52E6FE0A" Ref="#PWR0170"  Part="1" 
AR Path="/52FAF275/52E6FE0A" Ref="#PWR0172"  Part="1" 
AR Path="/52FAF279/52E6FE0A" Ref="#PWR0174"  Part="1" 
F 0 "#PWR0166" H 5550 4800 30  0001 C CNN
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
Text HLabel 5550 3600 1    60   Output ~ 0
Sink
$Comp
L DIODE D1501
U 1 1 52E705F0
P 5800 3900
AR Path="/52FAAFCB/52E705F0" Ref="D1501"  Part="1" 
AR Path="/52FAC46B/52E705F0" Ref="D1601"  Part="1" 
AR Path="/52FAD3BD/52E705F0" Ref="D1701"  Part="1" 
AR Path="/52FAD3C1/52E705F0" Ref="D1801"  Part="1" 
AR Path="/52FAF26D/52E705F0" Ref="D1901"  Part="1" 
AR Path="/52FAF271/52E705F0" Ref="D2001"  Part="1" 
AR Path="/52FAF275/52E705F0" Ref="D2101"  Part="1" 
AR Path="/52FAF279/52E705F0" Ref="D2201"  Part="1" 
F 0 "D1801" V 5900 3800 40  0000 R CNN
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
L +24V #PWR0161
U 1 1 52E70673
P 5800 3600
AR Path="/52FAAFCB/52E70673" Ref="#PWR0161"  Part="1" 
AR Path="/52FAC46B/52E70673" Ref="#PWR0163"  Part="1" 
AR Path="/52FAD3BD/52E70673" Ref="#PWR0165"  Part="1" 
AR Path="/52FAD3C1/52E70673" Ref="#PWR0167"  Part="1" 
AR Path="/52FAF26D/52E70673" Ref="#PWR0169"  Part="1" 
AR Path="/52FAF271/52E70673" Ref="#PWR0171"  Part="1" 
AR Path="/52FAF275/52E70673" Ref="#PWR0173"  Part="1" 
AR Path="/52FAF279/52E70673" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0167" H 5800 3550 20  0001 C CNN
F 1 "+24V" H 5800 3700 30  0000 C CNN
F 2 "" H 5800 3600 60  0000 C CNN
F 3 "" H 5800 3600 60  0000 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3600 5800 3700
$EndSCHEMATC
