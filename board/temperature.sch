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
Sheet 3 26
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
Text HLabel 6100 3150 2    60   Output ~ 0
SO
$Comp
L C C201
U 1 1 52E6B9FE
P 4850 3800
AR Path="/52EEE819/52E6B9FE" Ref="C201"  Part="1" 
AR Path="/52E79355/52E6B9FE" Ref="C301"  Part="1" 
F 0 "C201" H 4850 3900 40  0000 L CNN
F 1 "100nF" H 4856 3715 40  0000 L CNN
F 2 "" H 4888 3650 30  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/CL10F104ZA8NNNC/1276-1011-1-ND/3889097" H 4850 3800 60  0001 C CNN
F 4 "1276-1011-1-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    4850 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0120
U 1 1 52E6BA13
P 5200 4100
AR Path="/52EEE819/52E6BA13" Ref="#PWR0120"  Part="1" 
AR Path="/52E79355/52E6BA13" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 5200 4100 30  0001 C CNN
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
L +3.3V #PWR0121
U 1 1 52E6BA4F
P 4850 3400
AR Path="/52EEE819/52E6BA4F" Ref="#PWR0121"  Part="1" 
AR Path="/52E79355/52E6BA4F" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 4850 3360 30  0001 C CNN
F 1 "+3.3V" H 4850 3510 30  0000 C CNN
F 2 "" H 4850 3400 60  0000 C CNN
F 3 "" H 4850 3400 60  0000 C CNN
	1    4850 3400
	1    0    0    -1  
$EndComp
Connection ~ 4850 3500
$Comp
L GND #PWR0122
U 1 1 52E6BA82
P 4850 4100
AR Path="/52EEE819/52E6BA82" Ref="#PWR0122"  Part="1" 
AR Path="/52E79355/52E6BA82" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 4850 4100 30  0001 C CNN
F 1 "GND" H 4850 4030 30  0001 C CNN
F 2 "" H 4850 4100 60  0000 C CNN
F 3 "" H 4850 4100 60  0000 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4000 4850 4100
$Comp
L CONN_2 J201
U 1 1 52E6BAA9
P 5100 2700
AR Path="/52EEE819/52E6BAA9" Ref="J201"  Part="1" 
AR Path="/52E79355/52E6BAA9" Ref="J301"  Part="1" 
F 0 "J201" V 5100 2700 40  0000 C CNN
F 1 "Temp Probe" V 5250 2700 40  0000 C CNN
F 2 "" H 5100 2700 60  0000 C CNN
F 3 "http://www.digikey.ca/product-search/en?vendor=0&keywords=1716020000" H 5100 2700 60  0001 C CNN
F 4 "281-1435-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
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
L MAX6675 U201
U 1 1 52E6BBF9
P 5650 3400
AR Path="/52EEE819/52E6BBF9" Ref="U201"  Part="1" 
AR Path="/52E79355/52E6BBF9" Ref="U301"  Part="1" 
F 0 "U201" H 5500 3100 60  0000 C CNN
F 1 "MAX6675" H 5650 3750 60  0000 C CNN
F 2 "" H 5650 3400 60  0000 C CNN
F 3 "http://www.digikey.ca/product-detail/en/MAX6675ISA%2BT/MAX6675ISA%2BTCT-ND/1859231" H 5650 3400 60  0001 C CNN
F 4 "MAX6675ISA+TCT-ND" H 6900 4550 60  0001 C CNN "Digikey Number"
	1    5650 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0123
U 1 1 52E6BC15
P 5000 3350
AR Path="/52EEE819/52E6BC15" Ref="#PWR0123"  Part="1" 
AR Path="/52E79355/52E6BC15" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 5000 3350 30  0001 C CNN
F 1 "GND" H 5000 3280 30  0001 C CNN
F 2 "" H 5000 3350 60  0000 C CNN
F 3 "" H 5000 3350 60  0000 C CNN
	1    5000 3350
	1    0    0    -1  
$EndComp
Connection ~ 5000 3250
$EndSCHEMATC
