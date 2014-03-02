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
Sheet 6 26
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
L GND #PWR0134
U 1 1 52E6BE42
P 4150 3500
F 0 "#PWR0134" H 4150 3500 30  0001 C CNN
F 1 "GND" H 4150 3430 30  0001 C CNN
F 2 "" H 4150 3500 60  0000 C CNN
F 3 "" H 4150 3500 60  0000 C CNN
	1    4150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3400 4150 3400
Wire Wire Line
	4150 3400 4150 3500
NoConn ~ 4250 3200
$Comp
L +3.3V #PWR0135
U 1 1 52E6BFC0
P 7400 3000
F 0 "#PWR0135" H 7400 2960 30  0001 C CNN
F 1 "+3.3V" H 7400 3110 30  0000 C CNN
F 2 "" H 7400 3000 60  0000 C CNN
F 3 "" H 7400 3000 60  0000 C CNN
	1    7400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3100 7400 3100
Wire Wire Line
	7400 3000 7400 3300
$Comp
L R R602
U 1 1 52E6C146
P 5050 3750
F 0 "R602" V 5150 3750 50  0000 C CNN
F 1 "62k" V 5050 3750 50  0000 C CNN
F 2 "" H 5050 3750 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/RC1608J623CS/1276-5105-1-ND/3968077" H 5050 3750 60  0001 C CNN
F 4 "1276-5105-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    5050 3750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR0136
U 1 1 52E6C24F
P 3950 4550
F 0 "#PWR0136" H 3950 4550 30  0001 C CNN
F 1 "GND" H 3950 4480 30  0001 C CNN
F 2 "" H 3950 4550 60  0000 C CNN
F 3 "" H 3950 4550 60  0000 C CNN
	1    3950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4400 3950 4550
$Comp
L C C604
U 1 1 52E6C2A8
P 6050 4200
F 0 "C604" H 6100 4300 50  0000 L CNN
F 1 "22nF" H 6100 4100 50  0000 L CNN
F 2 "" H 6050 4200 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/CL10B222KB8NCNC/1276-1989-1-ND/3890075" H 6050 4200 60  0001 C CNN
F 4 "1276-1989-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    6050 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0137
U 1 1 52E6C2C8
P 6050 4550
F 0 "#PWR0137" H 6050 4550 30  0001 C CNN
F 1 "GND" H 6050 4480 30  0001 C CNN
F 2 "" H 6050 4550 60  0000 C CNN
F 3 "" H 6050 4550 60  0000 C CNN
	1    6050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4400 6050 4550
$Comp
L R R603
U 1 1 52E6C482
P 6400 4200
F 0 "R603" V 6480 4200 50  0000 C CNN
F 1 "1.1k" V 6400 4200 50  0000 C CNN
F 2 "" H 6400 4200 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/MCR03ERTF1101/RHM1.1KCFCT-ND/4083910" H 6400 4200 60  0001 C CNN
F 4 "RHM1.1KCFCT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    6400 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0138
U 1 1 52E6C5D9
P 6400 4550
F 0 "#PWR0138" H 6400 4550 30  0001 C CNN
F 1 "GND" H 6400 4480 30  0001 C CNN
F 2 "" H 6400 4550 60  0000 C CNN
F 3 "" H 6400 4550 60  0000 C CNN
	1    6400 4550
	1    0    0    -1  
$EndComp
Connection ~ 3950 3100
$Comp
L LMZ14201 U601
U 1 1 52E6C713
P 5050 3250
F 0 "U601" H 4600 2950 60  0000 C CNN
F 1 "LMZ14201" H 5050 3250 60  0000 C CNN
F 2 "" H 5050 3250 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/LMZ14201TZ-ADJ%2FNOPB/LMZ14201TZ-ADJ%2FNOPBCT-ND/2203761" H 5050 3250 60  0001 C CNN
F 4 "LMZ14201TZ-ADJ/NOPBCT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    5050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3400 5950 3400
Wire Wire Line
	5950 3400 5950 3750
Wire Wire Line
	5950 3750 5300 3750
Connection ~ 3950 3750
Wire Wire Line
	5850 3300 6050 3300
Wire Wire Line
	5850 3200 6400 3200
Wire Wire Line
	6400 3200 6400 3950
$Comp
L C C602
U 1 1 52E6C927
P 7400 3500
F 0 "C602" H 7450 3600 50  0000 L CNN
F 1 "100uF" H 7450 3400 50  0000 L CNN
F 2 "" H 7400 3500 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/C1206C107M9PACTU/399-5620-1-ND/2057834" H 7400 3500 60  0001 C CNN
F 4 "399-5620-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    7400 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0139
U 1 1 52E6C951
P 7400 3850
F 0 "#PWR0139" H 7400 3850 30  0001 C CNN
F 1 "GND" H 7400 3780 30  0001 C CNN
F 2 "" H 7400 3850 60  0000 C CNN
F 3 "" H 7400 3850 60  0000 C CNN
	1    7400 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4450 6400 4550
$Comp
L C C601
U 1 1 52E6C9C8
P 7050 3500
F 0 "C601" H 7100 3600 50  0000 L CNN
F 1 "22nF" H 7100 3400 50  0000 L CNN
F 2 "" H 7050 3500 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/CL10B222KB8NCNC/1276-1989-1-ND/3890075" H 7050 3500 60  0001 C CNN
F 4 "1276-1989-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    7050 3500
	1    0    0    -1  
$EndComp
$Comp
L R R601
U 1 1 52E6C9DC
P 6700 3500
F 0 "R601" V 6780 3500 50  0000 C CNN
F 1 "3.3k" V 6700 3500 50  0000 C CNN
F 2 "" H 6700 3500 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/MCR03ERTF3301/RHM3.30KCFCT-ND/2796479" H 6700 3500 60  0001 C CNN
F 4 "RHM3.30KCFCT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    6700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3100 6700 3250
Connection ~ 6700 3100
Wire Wire Line
	6700 3750 6700 3850
Wire Wire Line
	6400 3850 7050 3850
Connection ~ 6400 3850
Wire Wire Line
	7050 3850 7050 3700
Connection ~ 6700 3850
Wire Wire Line
	7050 3300 7050 3100
Connection ~ 7050 3100
Wire Wire Line
	7400 3700 7400 3850
Connection ~ 7400 3100
Wire Wire Line
	6050 3300 6050 4000
Wire Wire Line
	3850 3100 4250 3100
Wire Wire Line
	3950 3750 4800 3750
Text HLabel 3850 3100 0    60   Input ~ 0
VIN
Wire Wire Line
	3950 3100 3950 4000
$Comp
L CP1 C603
U 1 1 5301A0DF
P 3950 4200
F 0 "C603" H 4000 4300 50  0000 L CNN
F 1 "10uF" H 4000 4100 50  0000 L CNN
F 2 "" H 3950 4200 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/EEE-2AA100UP/PCE3966CT-ND/766342" H 3950 4200 60  0001 C CNN
F 4 "PCE3966CT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    3950 4200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
