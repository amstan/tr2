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
Sheet 3 5
Title ""
Date "21 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_STEPPER J?
U 1 1 52E46BDA
P 6900 4550
AR Path="/52E6C2E8/52E46BDA" Ref="J?"  Part="1" 
AR Path="/52E72F84/52E46BDA" Ref="J?"  Part="1" 
F 0 "J?" H 6800 4200 60  0000 C CNN
F 1 "CONN_STEPPER" V 7150 4550 60  0001 C CNN
F 2 "" H 6450 4350 60  0000 C CNN
F 3 "" H 6450 4350 60  0000 C CNN
	1    6900 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 52E46C46
P 4450 3200
AR Path="/52E6C2E8/52E46C46" Ref="#PWR01"  Part="1" 
AR Path="/52E72F84/52E46C46" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 4450 3200 30  0001 C CNN
F 1 "GND" H 4450 3130 30  0001 C CNN
F 2 "" H 4450 3200 60  0000 C CNN
F 3 "" H 4450 3200 60  0000 C CNN
	1    4450 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 52E46C5A
P 4750 3200
AR Path="/52E6C2E8/52E46C5A" Ref="#PWR02"  Part="1" 
AR Path="/52E72F84/52E46C5A" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 4750 3200 30  0001 C CNN
F 1 "GND" H 4750 3130 30  0001 C CNN
F 2 "" H 4750 3200 60  0000 C CNN
F 3 "" H 4750 3200 60  0000 C CNN
	1    4750 3200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 52E46C96
P 4450 2600
AR Path="/52E6C2E8/52E46C96" Ref="#PWR03"  Part="1" 
AR Path="/52E72F84/52E46C96" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 4450 2560 30  0001 C CNN
F 1 "+3.3V" H 4450 2710 30  0000 C CNN
F 2 "" H 4450 2600 60  0000 C CNN
F 3 "" H 4450 2600 60  0000 C CNN
	1    4450 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 52E46CA8
P 4750 2600
AR Path="/52E6C2E8/52E46CA8" Ref="#PWR04"  Part="1" 
AR Path="/52E72F84/52E46CA8" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 4750 2560 30  0001 C CNN
F 1 "+3.3V" H 4750 2710 30  0000 C CNN
F 2 "" H 4750 2600 60  0000 C CNN
F 3 "" H 4750 2600 60  0000 C CNN
	1    4750 2600
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 52E46CC8
P 5150 3150
AR Path="/52E6C2E8/52E46CC8" Ref="#PWR05"  Part="1" 
AR Path="/52E72F84/52E46CC8" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 5150 3110 30  0001 C CNN
F 1 "+3.3V" H 5150 3260 30  0000 C CNN
F 2 "" H 5150 3150 60  0000 C CNN
F 3 "" H 5150 3150 60  0000 C CNN
	1    5150 3150
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR06
U 1 1 52E46D7E
P 5750 3150
AR Path="/52E6C2E8/52E46D7E" Ref="#PWR06"  Part="1" 
AR Path="/52E72F84/52E46D7E" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 5750 3100 20  0001 C CNN
F 1 "+24V" H 5750 3250 30  0000 C CNN
F 2 "" H 5750 3150 60  0000 C CNN
F 3 "" H 5750 3150 60  0000 C CNN
	1    5750 3150
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 52E46E0C
P 6100 2350
AR Path="/52E6C2E8/52E46E0C" Ref="D?"  Part="1" 
AR Path="/52E72F84/52E46E0C" Ref="D?"  Part="1" 
F 0 "D?" H 6100 2450 40  0000 C CNN
F 1 "DIODE" H 6100 2250 40  0000 C CNN
F 2 "" H 6100 2350 60  0000 C CNN
F 3 "" H 6100 2350 60  0000 C CNN
	1    6100 2350
	-1   0    0    1   
$EndComp
$Comp
L +24V #PWR07
U 1 1 52E46E92
P 6350 2000
AR Path="/52E6C2E8/52E46E92" Ref="#PWR07"  Part="1" 
AR Path="/52E72F84/52E46E92" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 6350 1950 20  0001 C CNN
F 1 "+24V" H 6350 2100 30  0000 C CNN
F 2 "" H 6350 2000 60  0000 C CNN
F 3 "" H 6350 2000 60  0000 C CNN
	1    6350 2000
	1    0    0    -1  
$EndComp
$Comp
L DIODE D?
U 1 1 52E46DF0
P 5500 2350
AR Path="/52E6C2E8/52E46DF0" Ref="D?"  Part="1" 
AR Path="/52E72F84/52E46DF0" Ref="D?"  Part="1" 
F 0 "D?" H 5500 2450 40  0000 C CNN
F 1 "DIODE" H 5500 2250 40  0000 C CNN
F 2 "" H 5500 2350 60  0000 C CNN
F 3 "" H 5500 2350 60  0000 C CNN
	1    5500 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	5150 3150 5150 3350
Wire Wire Line
	5250 3250 5250 3350
Wire Wire Line
	5150 3250 5250 3250
Connection ~ 5150 3250
Wire Wire Line
	4450 2600 4450 2700
Wire Wire Line
	4750 2600 4750 2700
Wire Wire Line
	5750 3150 5750 3350
Wire Wire Line
	5750 3250 5850 3250
Wire Wire Line
	5850 3250 5850 3350
Connection ~ 5750 3250
Wire Wire Line
	5700 2350 5900 2350
Wire Wire Line
	5800 2350 5800 2950
Connection ~ 5800 2350
Wire Wire Line
	5200 2700 5300 2700
Wire Wire Line
	5300 2350 5200 2350
Connection ~ 5200 2350
Wire Wire Line
	5700 2700 5800 2700
Connection ~ 5200 2700
Connection ~ 5800 2700
Connection ~ 6350 2100
Wire Wire Line
	6350 2350 6300 2350
Wire Wire Line
	6350 2000 6350 2350
Wire Wire Line
	6000 2100 6350 2100
Wire Wire Line
	5200 2100 5200 2950
Wire Wire Line
	5200 2100 5600 2100
Wire Wire Line
	5200 2950 5450 2950
Wire Wire Line
	5450 2950 5450 3350
Wire Wire Line
	5800 2950 5550 2950
Wire Wire Line
	5550 2950 5550 3350
$Comp
L GND #PWR08
U 1 1 52E46FD2
P 5450 5950
AR Path="/52E6C2E8/52E46FD2" Ref="#PWR08"  Part="1" 
AR Path="/52E72F84/52E46FD2" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 5450 5950 30  0001 C CNN
F 1 "GND" H 5450 5880 30  0001 C CNN
F 2 "" H 5450 5950 60  0000 C CNN
F 3 "" H 5450 5950 60  0000 C CNN
	1    5450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5750 5450 5950
Wire Wire Line
	5450 5850 5550 5850
Connection ~ 5450 5850
$Comp
L GND #PWR09
U 1 1 52E47021
P 6650 5350
AR Path="/52E6C2E8/52E47021" Ref="#PWR09"  Part="1" 
AR Path="/52E72F84/52E47021" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 6650 5350 30  0001 C CNN
F 1 "GND" H 6650 5280 30  0001 C CNN
F 2 "" H 6650 5350 60  0000 C CNN
F 3 "" H 6650 5350 60  0000 C CNN
	1    6650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 5250 6650 5250
Wire Wire Line
	6650 5250 6650 5350
$Comp
L GND #PWR010
U 1 1 52E47051
P 4450 5550
AR Path="/52E6C2E8/52E47051" Ref="#PWR010"  Part="1" 
AR Path="/52E72F84/52E47051" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 4450 5550 30  0001 C CNN
F 1 "GND" H 4450 5480 30  0001 C CNN
F 2 "" H 4450 5550 60  0000 C CNN
F 3 "" H 4450 5550 60  0000 C CNN
	1    4450 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5450 4450 5450
Wire Wire Line
	4350 5250 4450 5250
Wire Wire Line
	4450 4750 4350 4750
Wire Wire Line
	4350 4650 4450 4650
Wire Wire Line
	4350 4450 4450 4450
Text HLabel 4350 4450 0    60   Input ~ 0
~STBY/RST
Text HLabel 4350 4650 0    60   Input ~ 0
~CS
Text HLabel 4350 4750 0    60   Input ~ 0
SCK
Text HLabel 4350 4850 0    60   Input ~ 0
SDO
Text HLabel 4350 4950 0    60   Input ~ 0
SDI
Wire Wire Line
	4350 4850 4450 4850
Wire Wire Line
	4350 4950 4450 4950
$Comp
L CONN_2 P?
U 1 1 52E4727D
P 4000 5350
AR Path="/52E6C2E8/52E4727D" Ref="P?"  Part="1" 
AR Path="/52E72F84/52E4727D" Ref="P?"  Part="1" 
F 0 "P?" V 3950 5350 40  0000 C CNN
F 1 "CONN_2" V 4050 5350 40  0000 C CNN
F 2 "" H 4000 5350 60  0000 C CNN
F 3 "" H 4000 5350 60  0000 C CNN
	1    4000 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4450 5450 4450 5550
Text HLabel 4350 4150 0    60   Input ~ 0
~FLAG
Text HLabel 4350 4250 0    60   Input ~ 0
~BUSY~/SYNC
Text HLabel 4350 3850 0    60   Input ~ 0
OSCIN
Text HLabel 4350 3950 0    60   Input ~ 0
OSCOUT
Wire Wire Line
	4350 3850 4450 3850
Wire Wire Line
	4350 3950 4450 3950
Wire Wire Line
	4350 4150 4450 4150
Wire Wire Line
	4350 4250 4450 4250
Text HLabel 4350 4350 0    60   Input ~ 0
STCK
Wire Wire Line
	4350 4350 4450 4350
Wire Wire Line
	6550 4350 6650 4350
Wire Wire Line
	6650 4450 6550 4450
Wire Wire Line
	6550 4650 6650 4650
Wire Wire Line
	6650 4750 6550 4750
Wire Wire Line
	5550 5850 5550 5750
$Comp
L R R?
U 1 1 52E475E9
P 7500 3250
AR Path="/52E6C2E8/52E475E9" Ref="R?"  Part="1" 
AR Path="/52E72F84/52E475E9" Ref="R?"  Part="1" 
F 0 "R?" V 7580 3250 40  0000 C CNN
F 1 "16k" V 7507 3251 40  0000 C CNN
F 2 "" V 7430 3250 30  0000 C CNN
F 3 "" H 7500 3250 30  0000 C CNN
	1    7500 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 52E475F4
P 7500 3500
AR Path="/52E6C2E8/52E475F4" Ref="#PWR011"  Part="1" 
AR Path="/52E72F84/52E475F4" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 7500 3500 30  0001 C CNN
F 1 "GND" H 7500 3430 30  0001 C CNN
F 2 "" H 7500 3500 60  0000 C CNN
F 3 "" H 7500 3500 60  0000 C CNN
	1    7500 3500
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR012
U 1 1 52E47672
P 7500 2500
AR Path="/52E6C2E8/52E47672" Ref="#PWR012"  Part="1" 
AR Path="/52E72F84/52E47672" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 7500 2450 20  0001 C CNN
F 1 "+24V" H 7500 2600 30  0000 C CNN
F 2 "" H 7500 2500 60  0000 C CNN
F 3 "" H 7500 2500 60  0000 C CNN
	1    7500 2500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E47703
P 7500 2750
AR Path="/52E6C2E8/52E47703" Ref="R?"  Part="1" 
AR Path="/52E72F84/52E47703" Ref="R?"  Part="1" 
F 0 "R?" V 7580 2750 40  0000 C CNN
F 1 "1.1k" V 7507 2751 40  0000 C CNN
F 2 "" V 7430 2750 30  0000 C CNN
F 3 "" H 7500 2750 30  0000 C CNN
	1    7500 2750
	1    0    0    -1  
$EndComp
Text HLabel 6550 3850 2    60   Input ~ 0
ADCIN
$Comp
L GND #PWR013
U 1 1 52E477BA
P 6700 3200
AR Path="/52E6C2E8/52E477BA" Ref="#PWR013"  Part="1" 
AR Path="/52E72F84/52E477BA" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 6700 3200 30  0001 C CNN
F 1 "GND" H 6700 3130 30  0001 C CNN
F 2 "" H 6700 3200 60  0000 C CNN
F 3 "" H 6700 3200 60  0000 C CNN
	1    6700 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 52E477C5
P 7000 3200
AR Path="/52E6C2E8/52E477C5" Ref="#PWR014"  Part="1" 
AR Path="/52E72F84/52E477C5" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 7000 3200 30  0001 C CNN
F 1 "GND" H 7000 3130 30  0001 C CNN
F 2 "" H 7000 3200 60  0000 C CNN
F 3 "" H 7000 3200 60  0000 C CNN
	1    7000 3200
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR015
U 1 1 52E477D0
P 6700 2600
AR Path="/52E6C2E8/52E477D0" Ref="#PWR015"  Part="1" 
AR Path="/52E72F84/52E477D0" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 6700 2550 20  0001 C CNN
F 1 "+24V" H 6700 2700 30  0000 C CNN
F 2 "" H 6700 2600 60  0000 C CNN
F 3 "" H 6700 2600 60  0000 C CNN
	1    6700 2600
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR016
U 1 1 52E477DB
P 7000 2600
AR Path="/52E6C2E8/52E477DB" Ref="#PWR016"  Part="1" 
AR Path="/52E72F84/52E477DB" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 7000 2550 20  0001 C CNN
F 1 "+24V" H 7000 2700 30  0000 C CNN
F 2 "" H 7000 2600 60  0000 C CNN
F 3 "" H 7000 2600 60  0000 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 52E4789D
P 4450 2900
AR Path="/52E6C2E8/52E4789D" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E4789D" Ref="C?"  Part="1" 
F 0 "C?" H 4450 3000 40  0000 L CNN
F 1 "100nF" H 4456 2815 40  0000 L CNN
F 2 "" H 4488 2750 30  0000 C CNN
F 3 "" H 4450 2900 60  0000 C CNN
	1    4450 2900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 52E478B3
P 6700 2900
AR Path="/52E6C2E8/52E478B3" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E478B3" Ref="C?"  Part="1" 
F 0 "C?" H 6700 3000 40  0000 L CNN
F 1 "220nF" H 6706 2815 40  0000 L CNN
F 2 "" H 6738 2750 30  0000 C CNN
F 3 "" H 6700 2900 60  0000 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 52E478C4
P 7000 2900
AR Path="/52E6C2E8/52E478C4" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E478C4" Ref="C?"  Part="1" 
F 0 "C?" H 7050 3000 50  0000 L CNN
F 1 "100uF" H 7050 2800 50  0000 L CNN
F 2 "" H 7000 2900 60  0000 C CNN
F 3 "" H 7000 2900 60  0000 C CNN
	1    7000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2600 6700 2700
Wire Wire Line
	6700 3100 6700 3200
Wire Wire Line
	7000 3100 7000 3200
Wire Wire Line
	7000 2700 7000 2600
Wire Wire Line
	4450 3100 4450 3200
Wire Wire Line
	4750 3100 4750 3200
$Comp
L CP1 C?
U 1 1 52E47A96
P 4750 2900
AR Path="/52E6C2E8/52E47A96" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E47A96" Ref="C?"  Part="1" 
F 0 "C?" H 4800 3000 50  0000 L CNN
F 1 "10uF" H 4800 2800 50  0000 L CNN
F 2 "" H 4750 2900 60  0000 C CNN
F 3 "" H 4750 2900 60  0000 C CNN
	1    4750 2900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 52E47AD8
P 5800 2100
AR Path="/52E6C2E8/52E47AD8" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E47AD8" Ref="C?"  Part="1" 
F 0 "C?" H 5800 2200 40  0000 L CNN
F 1 "220nF" H 5806 2015 40  0000 L CNN
F 2 "" H 5838 1950 30  0000 C CNN
F 3 "" H 5800 2100 60  0000 C CNN
	1    5800 2100
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 52E47AE3
P 5500 2700
AR Path="/52E6C2E8/52E47AE3" Ref="C?"  Part="1" 
AR Path="/52E72F84/52E47AE3" Ref="C?"  Part="1" 
F 0 "C?" H 5500 2800 40  0000 L CNN
F 1 "10nF" H 5506 2615 40  0000 L CNN
F 2 "" H 5538 2550 30  0000 C CNN
F 3 "" H 5500 2700 60  0000 C CNN
	1    5500 2700
	0    -1   -1   0   
$EndComp
$Comp
L L6470 U?
U 1 1 52E6B5EE
P 5500 4550
AR Path="/52E6C2E8/52E6B5EE" Ref="U?"  Part="1" 
AR Path="/52E72F84/52E6B5EE" Ref="U?"  Part="1" 
F 0 "U?" H 4850 3600 60  0000 C CNN
F 1 "L6470" H 5500 4550 60  0000 C CNN
F 2 "" H 6550 4350 60  0000 C CNN
F 3 "http://www.st.com/web/catalog/sense_power/FM142/CL851/SC1794/SS1498/LN1723/PF248592" H 7000 3200 60  0001 C CNN
	1    5500 4550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
