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
$Descr E 44000 34000
encoding utf-8
Sheet 1 5
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
L STM32F405-144 U2
U 1 1 52E41F67
P 37850 17150
F 0 "U2" H 36350 13600 60  0000 C CNN
F 1 "STM32F405-144" H 37850 17150 60  0000 C CNN
F 2 "" H 35850 14500 60  0000 C CNN
F 3 "" H 35850 14500 60  0000 C CNN
	1    37850 17150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 52E46471
P 36000 13450
F 0 "#PWR01" H 36000 13450 30  0001 C CNN
F 1 "GND" H 36000 13380 30  0001 C CNN
F 2 "" H 36000 13450 60  0000 C CNN
F 3 "" H 36000 13450 60  0000 C CNN
	1    36000 13450
	1    0    0    -1  
$EndComp
Text Label 38800 13250 1    60   ~ 0
MCU_RESET
Text Label 40600 12900 2    60   ~ 0
MCU_RESET
$Comp
L CAP C?
U 1 1 52E46E20
P 40700 13250
F 0 "C?" H 40800 13400 50  0000 C CNN
F 1 "100nF" H 40850 13100 50  0000 C CNN
F 2 "" H 40700 13250 60  0000 C CNN
F 3 "" H 40700 13250 60  0000 C CNN
	1    40700 13250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E46E34
P 40700 13600
F 0 "#PWR?" H 40700 13600 30  0001 C CNN
F 1 "GND" H 40700 13530 30  0001 C CNN
F 2 "" H 40700 13600 60  0000 C CNN
F 3 "" H 40700 13600 60  0000 C CNN
	1    40700 13600
	1    0    0    -1  
$EndComp
$Comp
L SPST SW?
U 1 1 52E4700C
P 41300 12900
F 0 "SW?" H 41300 13000 70  0000 C CNN
F 1 "SPST" H 41300 12800 70  0000 C CNN
F 2 "" H 41300 12900 60  0000 C CNN
F 3 "" H 41300 12900 60  0000 C CNN
	1    41300 12900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E4704D
P 41900 13000
F 0 "#PWR?" H 41900 13000 30  0001 C CNN
F 1 "GND" H 41900 12930 30  0001 C CNN
F 2 "" H 41900 13000 60  0000 C CNN
F 3 "" H 41900 13000 60  0000 C CNN
	1    41900 13000
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 52E474FF
P 37000 13150
F 0 "#PWR?" H 37000 13110 30  0001 C CNN
F 1 "+3.3V" H 37000 13260 30  0000 C CNN
F 2 "" H 37000 13150 60  0000 C CNN
F 3 "" H 37000 13150 60  0000 C CNN
	1    37000 13150
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 52E477FB
P 36350 13250
F 0 "C?" V 36300 13150 50  0000 R CNN
F 1 "2.2uF" V 36450 13150 50  0000 R CNN
F 2 "" H 36350 13250 60  0000 C CNN
F 3 "" H 36350 13250 60  0000 C CNN
	1    36350 13250
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 52E478D0
P 36350 12850
F 0 "C?" V 36300 12750 50  0000 R CNN
F 1 "2.2uF" V 36450 12750 50  0000 R CNN
F 2 "" H 36350 12850 60  0000 C CNN
F 3 "" H 36350 12850 60  0000 C CNN
	1    36350 12850
	0    -1   -1   0   
$EndComp
$Sheet
S 20250 18250 900  1300
U 52E6C2E8
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 19150 60 
F3 "~CS" I L 20250 19350 60 
F4 "SCK" I L 20250 19450 60 
F5 "SDO" I R 21150 19450 60 
F6 "SDI" I L 20250 18350 60 
F7 "~FLAG" I L 20250 18850 60 
F8 "~BUSY~/SYNC" I L 20250 18950 60 
F9 "OSCIN" I L 20250 18550 60 
F10 "OSCOUT" I L 20250 18650 60 
F11 "STCK" I L 20250 19050 60 
F12 "ADCIN" I R 21150 18350 60 
$EndSheet
Text Label 19550 19350 0    60   ~ 0
STEPPER0-~CS
Text Label 20050 19450 0    60   ~ 0
SCK
$Comp
L R R?
U 1 1 52E86082
P 22000 20550
F 0 "R?" V 22080 20550 40  0000 C CNN
F 1 "1.1k" V 22007 20551 40  0000 C CNN
F 2 "" V 21930 20550 30  0000 C CNN
F 3 "" H 22000 20550 30  0000 C CNN
	1    22000 20550
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E86096
P 22000 21150
F 0 "R?" V 22080 21150 40  0000 C CNN
F 1 "16k" V 22007 21151 40  0000 C CNN
F 2 "" V 21930 21150 30  0000 C CNN
F 3 "" H 22000 21150 30  0000 C CNN
	1    22000 21150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E865EF
P 22000 21500
F 0 "#PWR?" H 22000 21500 30  0001 C CNN
F 1 "GND" H 22000 21430 30  0001 C CNN
F 2 "" H 22000 21500 60  0000 C CNN
F 3 "" H 22000 21500 60  0000 C CNN
	1    22000 21500
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 52E8699F
P 22000 20200
F 0 "#PWR?" H 22000 20150 20  0001 C CNN
F 1 "+24V" H 22000 20300 30  0000 C CNN
F 2 "" H 22000 20200 60  0000 C CNN
F 3 "" H 22000 20200 60  0000 C CNN
	1    22000 20200
	1    0    0    -1  
$EndComp
Text Label 22050 20850 0    60   ~ 0
24V_ADC
Text Label 19950 18350 0    60   ~ 0
MOSI
Text Label 21200 24250 0    60   ~ 0
MISO
Text Label 19450 18550 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19600 18650 0    60   ~ 0
STEPPER_OSC
Text Label 19500 19050 0    60   ~ 0
STEPPERS_STCK
Text Label 19550 19150 0    60   ~ 0
STEPPERS_~RST
$Sheet
S 20250 19850 900  1300
U 52EA07F5
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 20750 60 
F3 "~CS" I L 20250 20950 60 
F4 "SCK" I L 20250 21050 60 
F5 "SDO" I R 21150 21050 60 
F6 "SDI" I L 20250 19950 60 
F7 "~FLAG" I L 20250 20450 60 
F8 "~BUSY~/SYNC" I L 20250 20550 60 
F9 "OSCIN" I L 20250 20150 60 
F10 "OSCOUT" I L 20250 20250 60 
F11 "STCK" I L 20250 20650 60 
F12 "ADCIN" I R 21150 19950 60 
$EndSheet
$Sheet
S 20250 21450 900  1300
U 52EA366A
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 22350 60 
F3 "~CS" I L 20250 22550 60 
F4 "SCK" I L 20250 22650 60 
F5 "SDO" I R 21150 22650 60 
F6 "SDI" I L 20250 21550 60 
F7 "~FLAG" I L 20250 22050 60 
F8 "~BUSY~/SYNC" I L 20250 22150 60 
F9 "OSCIN" I L 20250 21750 60 
F10 "OSCOUT" I L 20250 21850 60 
F11 "STCK" I L 20250 22250 60 
F12 "ADCIN" I R 21150 21550 60 
$EndSheet
$Sheet
S 20250 23050 900  1300
U 52EA3677
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 23950 60 
F3 "~CS" I L 20250 24150 60 
F4 "SCK" I L 20250 24250 60 
F5 "SDO" I R 21150 24250 60 
F6 "SDI" I L 20250 23150 60 
F7 "~FLAG" I L 20250 23650 60 
F8 "~BUSY~/SYNC" I L 20250 23750 60 
F9 "OSCIN" I L 20250 23350 60 
F10 "OSCOUT" I L 20250 23450 60 
F11 "STCK" I L 20250 23850 60 
F12 "ADCIN" I R 21150 23150 60 
$EndSheet
Connection ~ 36000 13250
Wire Wire Line
	36000 13250 36150 13250
Wire Wire Line
	36000 12850 36000 13450
Wire Wire Line
	36000 12850 36150 12850
Wire Wire Line
	36800 12850 36800 13350
Wire Wire Line
	36550 12850 36800 12850
Wire Wire Line
	36700 13250 36700 13350
Wire Wire Line
	36550 13250 36700 13250
Wire Wire Line
	38800 13250 38800 13350
Wire Wire Line
	40600 12900 40800 12900
Wire Wire Line
	40700 13500 40700 13600
Wire Wire Line
	40700 12900 40700 13000
Connection ~ 40700 12900
Wire Wire Line
	41800 12900 41900 12900
Wire Wire Line
	41900 12900 41900 13000
Wire Wire Line
	37000 13150 37000 13350
Wire Wire Line
	37000 13250 38600 13250
Wire Wire Line
	38600 13250 38600 13350
Connection ~ 37000 13250
Wire Wire Line
	38300 13350 38300 13250
Connection ~ 38300 13250
Wire Wire Line
	38200 13350 38200 13250
Connection ~ 38200 13250
Wire Wire Line
	38100 13350 38100 13250
Connection ~ 38100 13250
Wire Wire Line
	38000 13350 38000 13250
Connection ~ 38000 13250
Wire Wire Line
	37900 13250 37900 13350
Connection ~ 37900 13250
Wire Wire Line
	37800 13250 37800 13350
Connection ~ 37800 13250
Wire Wire Line
	37700 13350 37700 13250
Connection ~ 37700 13250
Wire Wire Line
	37600 13350 37600 13250
Connection ~ 37600 13250
Wire Wire Line
	37500 13350 37500 13250
Connection ~ 37500 13250
Wire Wire Line
	37400 13350 37400 13250
Connection ~ 37400 13250
Wire Wire Line
	37300 13350 37300 13250
Connection ~ 37300 13250
Wire Wire Line
	37200 13250 37200 13350
Connection ~ 37200 13250
Wire Wire Line
	38500 13350 38500 13250
Connection ~ 38500 13250
Wire Wire Line
	19450 19350 20250 19350
Wire Wire Line
	20000 19450 20250 19450
Wire Wire Line
	22000 20200 22000 20300
Wire Wire Line
	22000 20800 22000 20900
Wire Wire Line
	22000 21400 22000 21500
Wire Wire Line
	22450 20850 22000 20850
Connection ~ 22000 20850
Wire Wire Line
	19900 18350 20250 18350
Wire Wire Line
	21150 24250 21450 24250
Wire Wire Line
	19450 18650 20250 18650
Wire Wire Line
	19450 18550 20250 18550
Wire Wire Line
	19200 19050 20250 19050
Wire Wire Line
	19200 19150 20250 19150
Text Label 21200 21050 0    60   ~ 0
MISO
Wire Wire Line
	21150 21050 21450 21050
Text Label 21200 22650 0    60   ~ 0
MISO
Wire Wire Line
	21150 22650 21450 22650
Text Label 21200 19450 0    60   ~ 0
MISO
Wire Wire Line
	21150 19450 21450 19450
Wire Wire Line
	21600 18350 21150 18350
Text Label 21200 18350 0    60   ~ 0
24V_ADC
Wire Wire Line
	21600 19950 21150 19950
Text Label 21200 19950 0    60   ~ 0
24V_ADC
Wire Wire Line
	21600 21550 21150 21550
Text Label 21200 21550 0    60   ~ 0
24V_ADC
Wire Wire Line
	21600 23150 21150 23150
Text Label 21200 23150 0    60   ~ 0
24V_ADC
Text Label 19550 20950 0    60   ~ 0
STEPPER1-~CS
Text Label 20050 21050 0    60   ~ 0
SCK
Text Label 19950 19950 0    60   ~ 0
MOSI
Text Label 19450 20150 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19600 20250 0    60   ~ 0
STEPPER_OSC
Text Label 19500 20650 0    60   ~ 0
STEPPERS_STCK
Text Label 19550 20750 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19450 20950 20250 20950
Wire Wire Line
	20000 21050 20250 21050
Wire Wire Line
	19900 19950 20250 19950
Wire Wire Line
	19450 20250 20250 20250
Wire Wire Line
	19450 20150 20250 20150
Wire Wire Line
	19200 20650 20250 20650
Wire Wire Line
	19200 20750 20250 20750
Text Label 19550 22550 0    60   ~ 0
STEPPER2-~CS
Text Label 20050 22650 0    60   ~ 0
SCK
Text Label 19950 21550 0    60   ~ 0
MOSI
Text Label 19450 21750 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19600 21850 0    60   ~ 0
STEPPER_OSC
Text Label 19500 22250 0    60   ~ 0
STEPPERS_STCK
Text Label 19550 22350 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19450 22550 20250 22550
Wire Wire Line
	20000 22650 20250 22650
Wire Wire Line
	19900 21550 20250 21550
Wire Wire Line
	19450 21850 20250 21850
Wire Wire Line
	19450 21750 20250 21750
Wire Wire Line
	19200 22250 20250 22250
Wire Wire Line
	19200 22350 20250 22350
Text Label 19550 24150 0    60   ~ 0
STEPPER3-~CS
Text Label 20050 24250 0    60   ~ 0
SCK
Text Label 19950 23150 0    60   ~ 0
MOSI
Text Label 19450 23350 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19600 23450 0    60   ~ 0
STEPPER_OSC
Text Label 19500 23850 0    60   ~ 0
STEPPERS_STCK
Text Label 19550 23950 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19450 24150 20250 24150
Wire Wire Line
	20000 24250 20250 24250
Wire Wire Line
	19900 23150 20250 23150
Wire Wire Line
	19450 23450 20250 23450
Wire Wire Line
	19450 23350 20250 23350
Wire Wire Line
	19200 23850 20250 23850
Wire Wire Line
	19200 23950 20250 23950
Wire Wire Line
	19200 18850 20250 18850
Wire Wire Line
	19200 18950 20250 18950
Text Label 19500 18850 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 18950 0    60   ~ 0
STEPPER0_~BUSY~/SYNC
Wire Wire Line
	19200 20450 20250 20450
Wire Wire Line
	19200 20550 20250 20550
Text Label 19500 20450 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 20550 0    60   ~ 0
STEPPER1_~BUSY~/SYNC
Wire Wire Line
	19200 22050 20250 22050
Wire Wire Line
	19200 22150 20250 22150
Text Label 19500 22050 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 22150 0    60   ~ 0
STEPPER2_~BUSY~/SYNC
Wire Wire Line
	19200 23650 20250 23650
Wire Wire Line
	19200 23750 20250 23750
Text Label 19500 23650 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 23750 0    60   ~ 0
STEPPER3_~BUSY~/SYNC
$EndSCHEMATC
