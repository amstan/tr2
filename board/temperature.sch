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
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
Title "K-Type Temperature Sensor"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6100 3250 2    60   Input ~ 0
SCK
Text HLabel 6100 3350 2    60   Input ~ 0
~CS
Text HLabel 6100 3150 2    60   Input ~ 0
SO
$Comp
L C C?
U 1 1 52E6B9FE
P 4850 3800
F 0 "C?" H 4850 3900 40  0000 L CNN
F 1 "100nF" H 4856 3715 40  0000 L CNN
F 2 "" H 4888 3650 30  0000 C CNN
F 3 "" H 4850 3800 60  0000 C CNN
	1    4850 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6BA13
P 5200 4100
F 0 "#PWR?" H 5200 4100 30  0001 C CNN
F 1 "GND" H 5200 4030 30  0001 C CNN
F 2 "" H 5200 4100 60  0000 C CNN
F 3 "" H 5200 4100 60  0000 C CNN
	1    5200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3600 5200 3600
Wire Wire Line
	5200 3600 5200 4100
Wire Wire Line
	4850 3500 5300 3500
Wire Wire Line
	4850 3400 4850 3600
$Comp
L +3.3V #PWR?
U 1 1 52E6BA4F
P 4850 3400
F 0 "#PWR?" H 4850 3360 30  0001 C CNN
F 1 "+3.3V" H 4850 3510 30  0000 C CNN
F 2 "" H 4850 3400 60  0000 C CNN
F 3 "" H 4850 3400 60  0000 C CNN
	1    4850 3400
	1    0    0    -1  
$EndComp
Connection ~ 4850 3500
$Comp
L GND #PWR?
U 1 1 52E6BA82
P 4850 4100
F 0 "#PWR?" H 4850 4100 30  0001 C CNN
F 1 "GND" H 4850 4030 30  0001 C CNN
F 2 "" H 4850 4100 60  0000 C CNN
F 3 "" H 4850 4100 60  0000 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4000 4850 4100
$Comp
L CONN_2 P?
U 1 1 52E6BAA9
P 5100 2700
F 0 "P?" V 5050 2700 40  0000 C CNN
F 1 "CONN_2" V 5150 2700 40  0000 C CNN
F 2 "" H 5100 2700 60  0000 C CNN
F 3 "" H 5100 2700 60  0000 C CNN
	1    5100 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 3250 5300 3250
Wire Wire Line
	5200 3150 5300 3150
Wire Wire Line
	5200 3050 5200 3150
Wire Wire Line
	5000 3050 5000 3350
Wire Wire Line
	6100 3150 6000 3150
Wire Wire Line
	6100 3250 6000 3250
Wire Wire Line
	6100 3350 6000 3350
$Comp
L MAX6675 U?
U 1 1 52E6BBF9
P 5650 3400
F 0 "U?" H 5500 3100 60  0000 C CNN
F 1 "MAX6675" H 5650 3750 60  0000 C CNN
F 2 "" H 5650 3400 60  0000 C CNN
F 3 "" H 5650 3400 60  0000 C CNN
	1    5650 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E6BC15
P 5000 3350
F 0 "#PWR?" H 5000 3350 30  0001 C CNN
F 1 "GND" H 5000 3280 30  0001 C CNN
F 2 "" H 5000 3350 60  0000 C CNN
F 3 "" H 5000 3350 60  0000 C CNN
	1    5000 3350
	1    0    0    -1  
$EndComp
Connection ~ 5000 3250
$EndSCHEMATC
