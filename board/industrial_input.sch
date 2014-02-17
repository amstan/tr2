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
Sheet 7 26
Title "Industrial Digital/Analog Input"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6850 3950 2    60   Output ~ 0
MCU_Input
Text HLabel 4950 3950 0    60   Input ~ 0
A/D_Input
$Comp
L R R701
U 1 1 52E6DE87
P 5400 3950
AR Path="/52F84966/52E6DE87" Ref="R701"  Part="1" 
AR Path="/52F85705/52E6DE87" Ref="R801"  Part="1" 
AR Path="/52F85B83/52E6DE87" Ref="R901"  Part="1" 
AR Path="/52F85B87/52E6DE87" Ref="R1001"  Part="1" 
AR Path="/52F8830D/52E6DE87" Ref="R1101"  Part="1" 
AR Path="/52F88311/52E6DE87" Ref="R1201"  Part="1" 
AR Path="/52F88315/52E6DE87" Ref="R1301"  Part="1" 
AR Path="/52F88319/52E6DE87" Ref="R1401"  Part="1" 
F 0 "R1401" V 5480 3950 50  0000 C CNN
F 1 "3.3k" V 5400 3950 50  0000 C CNN
F 2 "" H 5400 3950 60  0000 C CNN
F 3 "" H 5400 3950 60  0000 C CNN
F 4 "MCR50JZHJ332" V 5400 3950 60  0001 C CNN "Part Number"
	1    5400 3950
	0    -1   -1   0   
$EndComp
$Comp
L C C701
U 1 1 52E6DEAB
P 5750 4250
AR Path="/52F84966/52E6DEAB" Ref="C701"  Part="1" 
AR Path="/52F85705/52E6DEAB" Ref="C801"  Part="1" 
AR Path="/52F85B83/52E6DEAB" Ref="C901"  Part="1" 
AR Path="/52F85B87/52E6DEAB" Ref="C1001"  Part="1" 
AR Path="/52F8830D/52E6DEAB" Ref="C1101"  Part="1" 
AR Path="/52F88311/52E6DEAB" Ref="C1201"  Part="1" 
AR Path="/52F88315/52E6DEAB" Ref="C1301"  Part="1" 
AR Path="/52F88319/52E6DEAB" Ref="C1401"  Part="1" 
F 0 "C1401" H 5800 4350 50  0000 L CNN
F 1 "1nF" H 5800 4150 50  0000 L CNN
F 2 "" H 5750 4250 60  0000 C CNN
F 3 "" H 5750 4250 60  0000 C CNN
F 4 "CL10B102KB8NCNC" H 5750 4250 60  0001 C CNN "Part Number"
	1    5750 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR702
U 1 1 52E6DEC4
P 5750 4550
AR Path="/52F84966/52E6DEC4" Ref="#PWR702"  Part="1" 
AR Path="/52F85705/52E6DEC4" Ref="#PWR802"  Part="1" 
AR Path="/52F85B83/52E6DEC4" Ref="#PWR902"  Part="1" 
AR Path="/52F85B87/52E6DEC4" Ref="#PWR1002"  Part="1" 
AR Path="/52F8830D/52E6DEC4" Ref="#PWR1102"  Part="1" 
AR Path="/52F88311/52E6DEC4" Ref="#PWR1202"  Part="1" 
AR Path="/52F88315/52E6DEC4" Ref="#PWR1302"  Part="1" 
AR Path="/52F88319/52E6DEC4" Ref="#PWR1402"  Part="1" 
F 0 "#PWR1402" H 5750 4550 30  0001 C CNN
F 1 "GND" H 5750 4480 30  0001 C CNN
F 2 "" H 5750 4550 60  0000 C CNN
F 3 "" H 5750 4550 60  0000 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR703
U 1 1 52E6DFEB
P 7100 4550
AR Path="/52F84966/52E6DFEB" Ref="#PWR703"  Part="1" 
AR Path="/52F85705/52E6DFEB" Ref="#PWR803"  Part="1" 
AR Path="/52F85B83/52E6DFEB" Ref="#PWR903"  Part="1" 
AR Path="/52F85B87/52E6DFEB" Ref="#PWR1003"  Part="1" 
AR Path="/52F8830D/52E6DFEB" Ref="#PWR1103"  Part="1" 
AR Path="/52F88311/52E6DFEB" Ref="#PWR1203"  Part="1" 
AR Path="/52F88315/52E6DFEB" Ref="#PWR1303"  Part="1" 
AR Path="/52F88319/52E6DFEB" Ref="#PWR1403"  Part="1" 
F 0 "#PWR1403" H 7100 4550 30  0001 C CNN
F 1 "GND" H 7100 4480 30  0001 C CNN
F 2 "" H 7100 4550 60  0000 C CNN
F 3 "" H 7100 4550 60  0000 C CNN
	1    7100 4550
	1    0    0    -1  
$EndComp
$Comp
L DOUBLE_SCHOTTKY D701
U 1 1 52E6E5BB
P 6600 4250
AR Path="/52F84966/52E6E5BB" Ref="D701"  Part="1" 
AR Path="/52F85705/52E6E5BB" Ref="D801"  Part="1" 
AR Path="/52F85B83/52E6E5BB" Ref="D901"  Part="1" 
AR Path="/52F85B87/52E6E5BB" Ref="D1001"  Part="1" 
AR Path="/52F8830D/52E6E5BB" Ref="D1101"  Part="1" 
AR Path="/52F88311/52E6E5BB" Ref="D1201"  Part="1" 
AR Path="/52F88315/52E6E5BB" Ref="D1301"  Part="1" 
AR Path="/52F88319/52E6E5BB" Ref="D1401"  Part="1" 
F 0 "D1401" H 6550 4350 40  0000 R CNN
F 1 "1SS295" H 6550 4100 40  0001 R CNN
F 2 "" H 6600 4250 60  0000 C CNN
F 3 "" H 6600 4250 60  0000 C CNN
F 4 "1SS295" H 6600 4250 60  0001 C CNN "Part Number"
	1    6600 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	5750 4450 5750 4550
Wire Wire Line
	5650 3950 6850 3950
Wire Wire Line
	7100 4250 7100 4550
Wire Wire Line
	4950 3950 5150 3950
Wire Wire Line
	5750 3950 5750 4050
Connection ~ 5750 3950
Wire Wire Line
	6600 4050 6600 3950
Connection ~ 6600 3950
Wire Wire Line
	7000 4250 7100 4250
Wire Wire Line
	6100 4150 6100 4250
Wire Wire Line
	6100 4250 6200 4250
Text Notes 5000 3600 0    60   ~ 0
48kHz Single Pole Low Pass Filter
Text Notes 5000 3700 0    60   ~ 0
0.7mA @ 24V Input, 210mV drop on Schottky array
$Comp
L +3.3V #PWR701
U 1 1 5301839B
P 6100 4150
AR Path="/52F84966/5301839B" Ref="#PWR701"  Part="1" 
AR Path="/52F85705/5301839B" Ref="#PWR801"  Part="1" 
AR Path="/52F85B83/5301839B" Ref="#PWR901"  Part="1" 
AR Path="/52F85B87/5301839B" Ref="#PWR1001"  Part="1" 
AR Path="/52F8830D/5301839B" Ref="#PWR1101"  Part="1" 
AR Path="/52F88311/5301839B" Ref="#PWR1201"  Part="1" 
AR Path="/52F88315/5301839B" Ref="#PWR1301"  Part="1" 
AR Path="/52F88319/5301839B" Ref="#PWR1401"  Part="1" 
F 0 "#PWR1401" H 6100 4110 30  0001 C CNN
F 1 "+3.3V" H 6100 4260 30  0000 C CNN
F 2 "" H 6100 4150 60  0000 C CNN
F 3 "" H 6100 4150 60  0000 C CNN
	1    6100 4150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
