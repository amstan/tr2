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
Sheet 1 9
Title "Main Schematic (MCU and the rest)"
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
Text Label 38800 12800 3    60   ~ 0
MCU_RESET
Text Label 40150 12900 0    60   ~ 0
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
Text Label 19200 19350 0    60   ~ 0
STEPPER0-~CS
Text Label 19200 19450 0    60   ~ 0
SCK
$Comp
L R R?
U 1 1 52E86082
P 22100 18600
F 0 "R?" V 22180 18600 40  0000 C CNN
F 1 "1.1k" V 22107 18601 40  0000 C CNN
F 2 "" V 22030 18600 30  0000 C CNN
F 3 "" H 22100 18600 30  0000 C CNN
	1    22100 18600
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 52E86096
P 22100 19200
F 0 "R?" V 22180 19200 40  0000 C CNN
F 1 "16k" V 22107 19201 40  0000 C CNN
F 2 "" V 22030 19200 30  0000 C CNN
F 3 "" H 22100 19200 30  0000 C CNN
	1    22100 19200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 52E865EF
P 22100 19550
F 0 "#PWR?" H 22100 19550 30  0001 C CNN
F 1 "GND" H 22100 19480 30  0001 C CNN
F 2 "" H 22100 19550 60  0000 C CNN
F 3 "" H 22100 19550 60  0000 C CNN
	1    22100 19550
	1    0    0    -1  
$EndComp
$Comp
L +24V #PWR?
U 1 1 52E8699F
P 22100 18250
F 0 "#PWR?" H 22100 18200 20  0001 C CNN
F 1 "+24V" H 22100 18350 30  0000 C CNN
F 2 "" H 22100 18250 60  0000 C CNN
F 3 "" H 22100 18250 60  0000 C CNN
	1    22100 18250
	1    0    0    -1  
$EndComp
Text Label 22150 18900 0    60   ~ 0
24V_ADC
Text Label 19200 18350 0    60   ~ 0
MOSI
Text Label 19200 18550 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19200 18650 0    60   ~ 0
STEPPERS_OSC_SYNC
Text Label 19200 19050 0    60   ~ 0
STEPPERS_STCK
Text Label 19200 19150 0    60   ~ 0
STEPPERS_~RST
$Sheet
S 20250 19800 900  1300
U 52EA07F5
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 20700 60 
F3 "~CS" I L 20250 20900 60 
F4 "SCK" I L 20250 21000 60 
F5 "SDO" I R 21150 21000 60 
F6 "SDI" I L 20250 19900 60 
F7 "~FLAG" I L 20250 20400 60 
F8 "~BUSY~/SYNC" I L 20250 20500 60 
F9 "OSCIN" I L 20250 20100 60 
F10 "OSCOUT" I L 20250 20200 60 
F11 "STCK" I L 20250 20600 60 
F12 "ADCIN" I R 21150 19900 60 
$EndSheet
$Sheet
S 20250 21350 900  1300
U 52EA366A
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 22250 60 
F3 "~CS" I L 20250 22450 60 
F4 "SCK" I L 20250 22550 60 
F5 "SDO" I R 21150 22550 60 
F6 "SDI" I L 20250 21450 60 
F7 "~FLAG" I L 20250 21950 60 
F8 "~BUSY~/SYNC" I L 20250 22050 60 
F9 "OSCIN" I L 20250 21650 60 
F10 "OSCOUT" I L 20250 21750 60 
F11 "STCK" I L 20250 22150 60 
F12 "ADCIN" I R 21150 21450 60 
$EndSheet
$Sheet
S 20250 22900 900  1300
U 52EA3677
F0 "Stepper Driver" 50
F1 "stepper_driver.sch" 50
F2 "~STBY/RST" I L 20250 23800 60 
F3 "~CS" I L 20250 24000 60 
F4 "SCK" I L 20250 24100 60 
F5 "SDO" I R 21150 24100 60 
F6 "SDI" I L 20250 23000 60 
F7 "~FLAG" I L 20250 23500 60 
F8 "~BUSY~/SYNC" I L 20250 23600 60 
F9 "OSCIN" I L 20250 23200 60 
F10 "OSCOUT" I L 20250 23300 60 
F11 "STCK" I L 20250 23700 60 
F12 "ADCIN" I R 21150 23000 60 
$EndSheet
Connection ~ 36000 13250
Wire Wire Line
	36000 13250 36150 13250
Wire Wire Line
	36000 12850 36000 13250
Wire Wire Line
	36000 13250 36000 13450
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
	38800 12800 38800 13350
Wire Wire Line
	40150 12900 40700 12900
Wire Wire Line
	40700 12900 40800 12900
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
	37000 13150 37000 13250
Wire Wire Line
	37000 13250 37000 13350
Wire Wire Line
	37000 13250 37200 13250
Wire Wire Line
	37200 13250 37300 13250
Wire Wire Line
	37300 13250 37400 13250
Wire Wire Line
	37400 13250 37500 13250
Wire Wire Line
	37500 13250 37600 13250
Wire Wire Line
	37600 13250 37700 13250
Wire Wire Line
	37700 13250 37800 13250
Wire Wire Line
	37800 13250 37900 13250
Wire Wire Line
	37900 13250 38000 13250
Wire Wire Line
	38000 13250 38100 13250
Wire Wire Line
	38100 13250 38200 13250
Wire Wire Line
	38200 13250 38300 13250
Wire Wire Line
	38300 13250 38500 13250
Wire Wire Line
	38500 13250 38600 13250
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
	19200 19350 20250 19350
Wire Wire Line
	19200 19450 20250 19450
Wire Wire Line
	22100 18250 22100 18350
Wire Wire Line
	22100 18850 22100 18900
Wire Wire Line
	22100 18900 22100 18950
Wire Wire Line
	22100 19450 22100 19550
Wire Wire Line
	22550 18900 22100 18900
Connection ~ 22100 18900
Wire Wire Line
	19200 18350 20250 18350
Wire Wire Line
	19200 18650 20250 18650
Wire Wire Line
	19200 18550 20250 18550
Wire Wire Line
	19200 19050 20250 19050
Wire Wire Line
	19200 19150 20250 19150
Text Label 21550 19450 2    60   ~ 0
MISO
Wire Wire Line
	21150 19450 21550 19450
Wire Wire Line
	21150 18350 21550 18350
Text Label 21550 18350 2    60   ~ 0
24V_ADC
Wire Wire Line
	19200 18850 20250 18850
Wire Wire Line
	19200 18950 20250 18950
Text Label 19200 18850 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 18950 0    60   ~ 0
STEPPER0_~BUSY~/SYNC
Text Label 19200 20900 0    60   ~ 0
STEPPER1-~CS
Text Label 19200 21000 0    60   ~ 0
SCK
Text Label 19200 19900 0    60   ~ 0
MOSI
Text Label 19200 20100 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19200 20200 0    60   ~ 0
STEPPERS_OSC_SYNC
Text Label 19200 20600 0    60   ~ 0
STEPPERS_STCK
Text Label 19200 20700 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19200 20900 20250 20900
Wire Wire Line
	19200 21000 20250 21000
Wire Wire Line
	19200 19900 20250 19900
Wire Wire Line
	19200 20200 20250 20200
Wire Wire Line
	19200 20100 20250 20100
Wire Wire Line
	19200 20600 20250 20600
Wire Wire Line
	19200 20700 20250 20700
Wire Wire Line
	19200 20400 20250 20400
Wire Wire Line
	19200 20500 20250 20500
Text Label 19200 20400 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 20500 0    60   ~ 0
STEPPER1_~BUSY~/SYNC
Text Label 19200 22450 0    60   ~ 0
STEPPER2-~CS
Text Label 19200 22550 0    60   ~ 0
SCK
Text Label 19200 21450 0    60   ~ 0
MOSI
Text Label 19200 21650 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19200 21750 0    60   ~ 0
STEPPERS_OSC_SYNC
Text Label 19200 22150 0    60   ~ 0
STEPPERS_STCK
Text Label 19200 22250 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19200 22450 20250 22450
Wire Wire Line
	19200 22550 20250 22550
Wire Wire Line
	19200 21450 20250 21450
Wire Wire Line
	19200 21750 20250 21750
Wire Wire Line
	19200 21650 20250 21650
Wire Wire Line
	19200 22150 20250 22150
Wire Wire Line
	19200 22250 20250 22250
Wire Wire Line
	19200 21950 20250 21950
Wire Wire Line
	19200 22050 20250 22050
Text Label 19200 21950 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 22050 0    60   ~ 0
STEPPER2_~BUSY~/SYNC
Text Label 19200 24000 0    60   ~ 0
STEPPER3-~CS
Text Label 19200 24100 0    60   ~ 0
SCK
Text Label 19200 23000 0    60   ~ 0
MOSI
Text Label 19200 23200 0    60   ~ 0
STEPPERS_OSCIN
Text Label 19200 23300 0    60   ~ 0
STEPPERS_OSC_SYNC
Text Label 19200 23700 0    60   ~ 0
STEPPERS_STCK
Text Label 19200 23800 0    60   ~ 0
STEPPERS_~RST
Wire Wire Line
	19200 24000 20250 24000
Wire Wire Line
	19200 24100 20250 24100
Wire Wire Line
	19200 23000 20250 23000
Wire Wire Line
	19200 23300 20250 23300
Wire Wire Line
	19200 23200 20250 23200
Wire Wire Line
	19200 23700 20250 23700
Wire Wire Line
	19200 23800 20250 23800
Wire Wire Line
	19200 23500 20250 23500
Wire Wire Line
	19200 23600 20250 23600
Text Label 19200 23500 0    60   ~ 0
STEPPERS_~FLAG
Text Label 19200 23600 0    60   ~ 0
STEPPER3_~BUSY~/SYNC
Text Label 21550 21000 2    60   ~ 0
MISO
Wire Wire Line
	21150 21000 21550 21000
Wire Wire Line
	21150 19900 21550 19900
Text Label 21550 19900 2    60   ~ 0
24V_ADC
Text Label 21550 22550 2    60   ~ 0
MISO
Wire Wire Line
	21150 22550 21550 22550
Wire Wire Line
	21150 21450 21550 21450
Text Label 21550 21450 2    60   ~ 0
24V_ADC
Text Label 21550 24100 2    60   ~ 0
MISO
Wire Wire Line
	21150 24100 21550 24100
Wire Wire Line
	21150 23000 21550 23000
Text Label 21550 23000 2    60   ~ 0
24V_ADC
$Sheet
S 23800 18250 550  400 
U 52EEE819
F0 "K-Type Temperature Sensor" 50
F1 "temperature.sch" 50
F2 "SCK" I L 23800 18450 60 
F3 "~CS" I L 23800 18550 60 
F4 "SO" I L 23800 18350 60 
$EndSheet
Wire Wire Line
	23250 18350 23800 18350
Wire Wire Line
	23250 18450 23800 18450
Wire Wire Line
	23250 18550 23800 18550
Text Label 23250 18450 0    60   ~ 0
SCK
Text Label 23250 18550 0    60   ~ 0
TEMP0_~CS
Text Label 23250 18350 0    60   ~ 0
SO
$Sheet
S 23800 18900 550  400 
U 52E79355
F0 "K-Type Temperature Sensor" 50
F1 "temperature.sch" 50
F2 "SCK" I L 23800 19100 60 
F3 "~CS" I L 23800 19200 60 
F4 "SO" I L 23800 19000 60 
$EndSheet
Wire Wire Line
	23250 19000 23800 19000
Wire Wire Line
	23250 19100 23800 19100
Wire Wire Line
	23250 19200 23800 19200
Text Label 23250 19100 0    60   ~ 0
SCK
Text Label 23250 19200 0    60   ~ 0
TEMP1_~CS
Text Label 23250 19000 0    60   ~ 0
SO
$Sheet
S 23800 19550 550  400 
U 52E799AE
F0 "K-Type Temperature Sensor" 50
F1 "temperature.sch" 50
F2 "SCK" I L 23800 19750 60 
F3 "~CS" I L 23800 19850 60 
F4 "SO" I L 23800 19650 60 
$EndSheet
Wire Wire Line
	23250 19650 23800 19650
Wire Wire Line
	23250 19750 23800 19750
Wire Wire Line
	23250 19850 23800 19850
Text Label 23250 19750 0    60   ~ 0
SCK
Text Label 23250 19850 0    60   ~ 0
TEMP2_~CS
Text Label 23250 19650 0    60   ~ 0
SO
$Sheet
S 23800 20200 550  400 
U 52E799B9
F0 "K-Type Temperature Sensor" 50
F1 "temperature.sch" 50
F2 "SCK" I L 23800 20400 60 
F3 "~CS" I L 23800 20500 60 
F4 "SO" I L 23800 20300 60 
$EndSheet
Wire Wire Line
	23250 20300 23800 20300
Wire Wire Line
	23250 20400 23800 20400
Wire Wire Line
	23250 20500 23800 20500
Text Label 23250 20400 0    60   ~ 0
SCK
Text Label 23250 20500 0    60   ~ 0
TEMP3_~CS
Text Label 23250 20300 0    60   ~ 0
SO
$EndSCHEMATC
