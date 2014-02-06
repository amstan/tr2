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
Sheet 10 10
Title "3.3V Switching Regulator"
Date "21 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR?
U 1 1 52E6BE42
P 4600 5250
F 0 "#PWR?" H 4600 5250 30  0001 C CNN
F 1 "GND" H 4600 5180 30  0001 C CNN
F 2 "" H 4600 5250 60  0000 C CNN
F 3 "" H 4600 5250 60  0000 C CNN
	1    4600 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5150 4600 5150
Wire Wire Line
	4600 5150 4600 5250
NoConn ~ 4700 4950
$Comp
L +3.3V #PWR?
U 1 1 52E6BFC0
P 7850 4750
F 0 "#PWR?" H 7850 4710 30  0001 C CNN
F 1 "+3.3V" H 7850 4860 30  0000 C CNN
F 2 "" H 7850 4750 60  0000 C CNN
F 3 "" H 7850 4750 60  0000 C CNN
	1    7850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4850 7850 4850
Wire Wire Line
	7850 4750 7850 5050
$Comp
L +24V #PWR?
U 1 1 52E6C03F
P 4400 4750
F 0 "#PWR?" H 4400 4700 20  0001 C CNN
F 1 "+24V" H 4400 4850 30  0000 C CNN
F 2 "" H 4400 4750 60  0000 C CNN
F 3 "" H 4400 4750 60  0000 C CNN
	1    4400 4750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E6C146
P 5500 5500
F 0 "R?" V 5600 5500 50  0000 C CNN
F 1 "62k" V 5500 5500 50  0000 C CNN
F 2 "" H 5500 5500 60  0000 C CNN
F 3 "" H 5500 5500 60  0000 C CNN
	1    5500 5500
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 52E6C23B
P 4400 5950
F 0 "C?" H 4450 6050 50  0000 L CNN
F 1 "10uF" H 4450 5850 50  0000 L CNN
F 2 "" H 4400 5950 60  0000 C CNN
F 3 "" H 4400 5950 60  0000 C CNN
	1    4400 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6C24F
P 4400 6300
F 0 "#PWR?" H 4400 6300 30  0001 C CNN
F 1 "GND" H 4400 6230 30  0001 C CNN
F 2 "" H 4400 6300 60  0000 C CNN
F 3 "" H 4400 6300 60  0000 C CNN
	1    4400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6150 4400 6300
$Comp
L C C?
U 1 1 52E6C2A8
P 6500 5950
F 0 "C?" H 6550 6050 50  0000 L CNN
F 1 "22nF" H 6550 5850 50  0000 L CNN
F 2 "" H 6500 5950 60  0000 C CNN
F 3 "" H 6500 5950 60  0000 C CNN
	1    6500 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6C2C8
P 6500 6300
F 0 "#PWR?" H 6500 6300 30  0001 C CNN
F 1 "GND" H 6500 6230 30  0001 C CNN
F 2 "" H 6500 6300 60  0000 C CNN
F 3 "" H 6500 6300 60  0000 C CNN
	1    6500 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6150 6500 6300
$Comp
L R R?
U 1 1 52E6C482
P 6850 5950
F 0 "R?" V 6930 5950 50  0000 C CNN
F 1 "1.1k" V 6850 5950 50  0000 C CNN
F 2 "" H 6850 5950 60  0000 C CNN
F 3 "" H 6850 5950 60  0000 C CNN
	1    6850 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6C5D9
P 6850 6300
F 0 "#PWR?" H 6850 6300 30  0001 C CNN
F 1 "GND" H 6850 6230 30  0001 C CNN
F 2 "" H 6850 6300 60  0000 C CNN
F 3 "" H 6850 6300 60  0000 C CNN
	1    6850 6300
	1    0    0    -1  
$EndComp
Connection ~ 4400 4850
$Comp
L LMZ14201 U?
U 1 1 52E6C713
P 5500 5000
F 0 "U?" H 5050 4700 60  0000 C CNN
F 1 "LMZ14201" H 5500 5000 60  0000 C CNN
F 2 "" H 5500 5000 60  0000 C CNN
F 3 "" H 5500 5000 60  0000 C CNN
	1    5500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 5150 6400 5150
Wire Wire Line
	6400 5150 6400 5500
Wire Wire Line
	6400 5500 5750 5500
Connection ~ 4400 5500
Wire Wire Line
	6300 5050 6500 5050
Wire Wire Line
	6300 4950 6850 4950
Wire Wire Line
	6850 4950 6850 5700
$Comp
L C C?
U 1 1 52E6C927
P 7850 5250
F 0 "C?" H 7900 5350 50  0000 L CNN
F 1 "100uF" H 7900 5150 50  0000 L CNN
F 2 "" H 7850 5250 60  0000 C CNN
F 3 "" H 7850 5250 60  0000 C CNN
	1    7850 5250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6C951
P 7850 5600
F 0 "#PWR?" H 7850 5600 30  0001 C CNN
F 1 "GND" H 7850 5530 30  0001 C CNN
F 2 "" H 7850 5600 60  0000 C CNN
F 3 "" H 7850 5600 60  0000 C CNN
	1    7850 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 6200 6850 6300
$Comp
L C C?
U 1 1 52E6C9C8
P 7500 5250
F 0 "C?" H 7550 5350 50  0000 L CNN
F 1 "22nF" H 7550 5150 50  0000 L CNN
F 2 "" H 7500 5250 60  0000 C CNN
F 3 "" H 7500 5250 60  0000 C CNN
	1    7500 5250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E6C9DC
P 7150 5250
F 0 "R?" V 7230 5250 50  0000 C CNN
F 1 "3.3k" V 7150 5250 50  0000 C CNN
F 2 "" H 7150 5250 60  0000 C CNN
F 3 "" H 7150 5250 60  0000 C CNN
	1    7150 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4850 7150 5000
Connection ~ 7150 4850
Wire Wire Line
	7150 5500 7150 5600
Wire Wire Line
	6850 5600 7500 5600
Connection ~ 6850 5600
Wire Wire Line
	7500 5600 7500 5450
Connection ~ 7150 5600
Wire Wire Line
	7500 5050 7500 4850
Connection ~ 7500 4850
Wire Wire Line
	7850 5450 7850 5600
Connection ~ 7850 4850
Wire Wire Line
	6500 5050 6500 5750
Wire Wire Line
	4400 4750 4400 5750
Wire Wire Line
	4700 4850 4400 4850
Wire Wire Line
	4400 5500 5250 5500
$EndSCHEMATC
