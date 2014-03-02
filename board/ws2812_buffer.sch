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
$Descr USLetter 11000 8500
encoding utf-8
Sheet 4 26
Title "WS2812 Buffered Output"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NPN Q402
U 1 1 52EEEE15
P 5250 4950
AR Path="/52EF032B/52EEEE15" Ref="Q402"  Part="1" 
AR Path="/52EF6BF1/52EEEE15" Ref="Q502"  Part="1" 
F 0 "Q502" H 5450 4950 50  0000 L CNN
F 1 "MMBT5962" H 5450 5050 50  0000 L CNN
F 2 "" H 5250 4950 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/MMBT5962/MMBT5962CT-ND/4213632" H 5250 4950 60  0001 C CNN
F 4 "MMBT5962CT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    5250 4950
	1    0    0    -1  
$EndComp
$Comp
L R R403
U 1 1 52EEEE2E
P 4700 4950
AR Path="/52EF032B/52EEEE2E" Ref="R403"  Part="1" 
AR Path="/52EF6BF1/52EEEE2E" Ref="R503"  Part="1" 
F 0 "R503" V 4780 4950 50  0000 C CNN
F 1 "1k" V 4700 4950 50  0000 C CNN
F 2 "" H 4700 4950 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/RC1608J102CS/1276-5062-1-ND/3968034" H 4700 4950 60  0001 C CNN
F 4 "1276-5062-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    4700 4950
	0    1    1    0   
$EndComp
$Comp
L GND #PWR0128
U 1 1 52EEEE49
P 5350 5250
AR Path="/52EF032B/52EEEE49" Ref="#PWR0128"  Part="1" 
AR Path="/52EF6BF1/52EEEE49" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 5350 5250 30  0001 C CNN
F 1 "GND" H 5350 5180 30  0001 C CNN
F 2 "" H 5350 5250 60  0000 C CNN
F 3 "" H 5350 5250 60  0000 C CNN
	1    5350 5250
	1    0    0    -1  
$EndComp
$Comp
L R R402
U 1 1 52EEEE6D
P 5350 4200
AR Path="/52EF032B/52EEEE6D" Ref="R402"  Part="1" 
AR Path="/52EF6BF1/52EEEE6D" Ref="R502"  Part="1" 
F 0 "R502" V 5430 4200 50  0000 C CNN
F 1 "1k" V 5350 4200 50  0000 C CNN
F 2 "" H 5350 4200 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/RC1608J102CS/1276-5062-1-ND/3968034" H 5350 4200 60  0001 C CNN
F 4 "1276-5062-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    5350 4200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0129
U 1 1 52EEEE7E
P 5350 3550
AR Path="/52EF032B/52EEEE7E" Ref="#PWR0129"  Part="1" 
AR Path="/52EF6BF1/52EEEE7E" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 5350 3510 30  0001 C CNN
F 1 "+3.3V" H 5350 3660 30  0000 C CNN
F 2 "" H 5350 3550 60  0000 C CNN
F 3 "" H 5350 3550 60  0000 C CNN
	1    5350 3550
	1    0    0    -1  
$EndComp
$Comp
L NPN Q401
U 1 1 52EEEE90
P 6050 4650
AR Path="/52EF032B/52EEEE90" Ref="Q401"  Part="1" 
AR Path="/52EF6BF1/52EEEE90" Ref="Q501"  Part="1" 
F 0 "Q501" H 6250 4650 50  0000 L CNN
F 1 "MMBT5962" H 6250 4750 50  0000 L CNN
F 2 "" H 6050 4650 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/MMBT5962/MMBT5962CT-ND/4213632" H 6050 4650 60  0001 C CNN
F 4 "MMBT5962CT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    6050 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0130
U 1 1 52EEEE97
P 6150 4950
AR Path="/52EF032B/52EEEE97" Ref="#PWR0130"  Part="1" 
AR Path="/52EF6BF1/52EEEE97" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 6150 4950 30  0001 C CNN
F 1 "GND" H 6150 4880 30  0001 C CNN
F 2 "" H 6150 4950 60  0000 C CNN
F 3 "" H 6150 4950 60  0000 C CNN
	1    6150 4950
	1    0    0    -1  
$EndComp
$Comp
L R R401
U 1 1 52EEEE9E
P 6150 4000
AR Path="/52EF032B/52EEEE9E" Ref="R401"  Part="1" 
AR Path="/52EF6BF1/52EEEE9E" Ref="R501"  Part="1" 
F 0 "R501" V 6230 4000 50  0000 C CNN
F 1 "200" V 6150 4000 50  0000 C CNN
F 2 "" H 6150 4000 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/RC1608J201CS/1276-5045-1-ND/3968017" H 6150 4000 60  0001 C CNN
F 4 "1276-5045-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    6150 4000
	1    0    0    -1  
$EndComp
Text HLabel 4350 4950 0    60   Input ~ 0
DATA_IN
Text HLabel 6350 4350 2    60   Output ~ 0
DATA_OUT
Wire Wire Line
	4950 4950 5050 4950
Wire Wire Line
	5350 5150 5350 5250
Wire Wire Line
	6150 4250 6150 4450
Wire Wire Line
	6150 3750 6150 3650
Wire Wire Line
	6150 4850 6150 4950
Wire Wire Line
	5350 4450 5350 4750
Wire Wire Line
	5850 4650 5350 4650
Connection ~ 5350 4650
Wire Wire Line
	4350 4950 4450 4950
Connection ~ 6150 4350
Wire Wire Line
	5350 3550 5350 3950
Connection ~ 5350 3650
Wire Wire Line
	6150 3650 5350 3650
Text Notes 5500 3550 0    60   ~ 0
Buffer WS2812 Data\nIncrease Drive Strength
Wire Wire Line
	6150 4350 6350 4350
$EndSCHEMATC
