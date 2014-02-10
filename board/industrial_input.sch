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
Sheet 12 26
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
L R R?
U 1 1 52E6DE87
P 5400 3950
F 0 "R?" V 5480 3950 50  0000 C CNN
F 1 "3.3k" V 5400 3950 50  0000 C CNN
F 2 "" H 5400 3950 60  0000 C CNN
F 3 "" H 5400 3950 60  0000 C CNN
	1    5400 3950
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 52E6DEAB
P 5750 4250
F 0 "C?" H 5800 4350 50  0000 L CNN
F 1 "1nF" H 5800 4150 50  0000 L CNN
F 2 "" H 5750 4250 60  0000 C CNN
F 3 "" H 5750 4250 60  0000 C CNN
	1    5750 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6DEC4
P 5750 4550
F 0 "#PWR?" H 5750 4550 30  0001 C CNN
F 1 "GND" H 5750 4480 30  0001 C CNN
F 2 "" H 5750 4550 60  0000 C CNN
F 3 "" H 5750 4550 60  0000 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 52E6DFBF
P 6100 4150
F 0 "#PWR?" H 6100 4100 20  0001 C CNN
F 1 "+24V" H 6100 4250 30  0000 C CNN
F 2 "" H 6100 4150 60  0000 C CNN
F 3 "" H 6100 4150 60  0000 C CNN
	1    6100 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6DFEB
P 7100 4550
F 0 "#PWR?" H 7100 4550 30  0001 C CNN
F 1 "GND" H 7100 4480 30  0001 C CNN
F 2 "" H 7100 4550 60  0000 C CNN
F 3 "" H 7100 4550 60  0000 C CNN
	1    7100 4550
	1    0    0    -1  
$EndComp
$Comp
L DOUBLE_SCHOTTKY D?
U 1 1 52E6E5BB
P 6600 4250
F 0 "D?" H 6550 4350 40  0000 R CNN
F 1 "1SS295" H 6550 4100 40  0000 R CNN
F 2 "" H 6600 4250 60  0000 C CNN
F 3 "" H 6600 4250 60  0000 C CNN
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
$EndSCHEMATC
