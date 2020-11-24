EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Female J1
U 1 1 5FBB7D01
P 4050 1600
F 0 "J1" H 4078 1576 50  0000 L CNN
F 1 "Programming Header" H 4078 1485 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x03_P1.00mm_Vertical" H 4050 1600 50  0001 C CNN
F 3 "~" H 4050 1600 50  0001 C CNN
	1    4050 1600
	1    0    0    -1  
$EndComp
$Comp
L Timer_RTC:PCF8523T U2
U 1 1 5FBB8880
P 5950 2800
F 0 "U2" H 6494 2846 50  0000 L CNN
F 1 "PCF8523T" H 6494 2755 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6750 2450 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF8523.pdf" H 5950 2800 50  0001 C CNN
	1    5950 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5FBBA94D
P 5650 1550
F 0 "J2" H 5678 1526 50  0000 L CNN
F 1 "CR2023 Socket" H 5678 1435 50  0000 L CNN
F 2 "Battery:BatteryHolder_Keystone_3034_1x20mm" H 5650 1550 50  0001 C CNN
F 3 "~" H 5650 1550 50  0001 C CNN
	1    5650 1550
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20SU U1
U 1 1 5FBAB800
P 2100 2900
F 0 "U1" H 1571 2946 50  0000 R CNN
F 1 "ATtiny85-20SU" H 1571 2855 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 2100 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 2100 2900 50  0001 C CNN
	1    2100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2150 2100 2250
$Comp
L Device:C C1
U 1 1 5FBC4359
P 3100 2650
F 0 "C1" H 3215 2696 50  0000 L CNN
F 1 "2.2uf" H 3215 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3138 2500 50  0001 C CNN
F 3 "~" H 3100 2650 50  0001 C CNN
	1    3100 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FBC4E8A
P 3100 2850
F 0 "#PWR0101" H 3100 2600 50  0001 C CNN
F 1 "GND" H 3105 2677 50  0000 C CNN
F 2 "" H 3100 2850 50  0001 C CNN
F 3 "" H 3100 2850 50  0001 C CNN
	1    3100 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2800 3100 2850
$Comp
L power:+BATT #PWR0103
U 1 1 5FBD3C42
P 5250 1500
F 0 "#PWR0103" H 5250 1350 50  0001 C CNN
F 1 "+BATT" H 5265 1673 50  0000 C CNN
F 2 "" H 5250 1500 50  0001 C CNN
F 3 "" H 5250 1500 50  0001 C CNN
	1    5250 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1550 5250 1550
$Comp
L power:+BATT #PWR0104
U 1 1 5FBD428D
P 6050 2050
F 0 "#PWR0104" H 6050 1900 50  0001 C CNN
F 1 "+BATT" H 6065 2223 50  0000 C CNN
F 2 "" H 6050 2050 50  0001 C CNN
F 3 "" H 6050 2050 50  0001 C CNN
	1    6050 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5FBD65C1
P 6550 2250
F 0 "C2" H 6665 2296 50  0000 L CNN
F 1 "2.2uf" H 6665 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6588 2100 50  0001 C CNN
F 3 "~" H 6550 2250 50  0001 C CNN
	1    6550 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2100 6550 2100
$Comp
L power:GND #PWR0105
U 1 1 5FBD7095
P 6550 2450
F 0 "#PWR0105" H 6550 2200 50  0001 C CNN
F 1 "GND" H 6555 2277 50  0000 C CNN
F 2 "" H 6550 2450 50  0001 C CNN
F 3 "" H 6550 2450 50  0001 C CNN
	1    6550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2450 6550 2400
Wire Wire Line
	6050 2100 6050 2400
Connection ~ 6050 2100
Wire Wire Line
	6050 2050 6050 2100
$Comp
L power:GND #PWR0106
U 1 1 5FBD834A
P 5950 3250
F 0 "#PWR0106" H 5950 3000 50  0001 C CNN
F 1 "GND" H 5955 3077 50  0000 C CNN
F 2 "" H 5950 3250 50  0001 C CNN
F 3 "" H 5950 3250 50  0001 C CNN
	1    5950 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3200 5950 3250
$Comp
L power:GND #PWR0107
U 1 1 5FBDC151
P 2100 3550
F 0 "#PWR0107" H 2100 3300 50  0001 C CNN
F 1 "GND" H 2105 3377 50  0000 C CNN
F 2 "" H 2100 3550 50  0001 C CNN
F 3 "" H 2100 3550 50  0001 C CNN
	1    2100 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3500 2100 3550
Text GLabel 2750 2800 2    50   Input ~ 0
B2
Wire Wire Line
	2700 2800 2750 2800
Text GLabel 2750 2600 2    50   Input ~ 0
B0
Wire Wire Line
	2700 2600 2750 2600
Text GLabel 5400 2700 0    50   Input ~ 0
B0
Text GLabel 5400 2600 0    50   Input ~ 0
B2
$Comp
L power:GND #PWR0109
U 1 1 5FBE591F
P 3650 1950
F 0 "#PWR0109" H 3650 1700 50  0001 C CNN
F 1 "GND" H 3655 1777 50  0000 C CNN
F 2 "" H 3650 1950 50  0001 C CNN
F 3 "" H 3650 1950 50  0001 C CNN
	1    3650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1950 3650 1900
Wire Wire Line
	3650 1900 3850 1900
Text GLabel 3800 1500 0    50   Input ~ 0
B0
Text GLabel 3800 1600 0    50   Input ~ 0
B1
Text GLabel 3800 1700 0    50   Input ~ 0
B2
Text GLabel 3800 1800 0    50   Input ~ 0
B5
Wire Wire Line
	3800 1500 3850 1500
Wire Wire Line
	3800 1600 3850 1600
Wire Wire Line
	3800 1700 3850 1700
Wire Wire Line
	3800 1800 3850 1800
Wire Wire Line
	5400 2700 5450 2700
Wire Wire Line
	5400 2600 5450 2600
$Comp
L Device:Crystal Y1
U 1 1 5FBEADBB
P 5050 3000
F 0 "Y1" V 5096 2869 50  0000 R CNN
F 1 "32.768" V 5005 2869 50  0000 R CNN
F 2 "Crystal:Crystal_SMD_Abracon_ABM7-2Pin_6.0x3.5mm" H 5050 3000 50  0001 C CNN
F 3 "~" H 5050 3000 50  0001 C CNN
	1    5050 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 2850 5450 2900
Wire Wire Line
	5450 3150 5450 3000
Wire Wire Line
	5050 2850 5450 2850
Wire Wire Line
	5050 3150 5450 3150
NoConn ~ 6450 2800
Text GLabel 2750 2700 2    50   Input ~ 0
B1
Wire Wire Line
	2700 2700 2750 2700
Text GLabel 2750 2900 2    50   Input ~ 0
B3
Wire Wire Line
	2700 2900 2750 2900
Text GLabel 2750 3000 2    50   Input ~ 0
B4
Text GLabel 2750 3100 2    50   Input ~ 0
B5
Wire Wire Line
	2700 3000 2750 3000
Wire Wire Line
	2700 3100 2750 3100
$Comp
L power:GND #PWR0110
U 1 1 5FBF6E7A
P 5250 1700
F 0 "#PWR0110" H 5250 1450 50  0001 C CNN
F 1 "GND" H 5255 1527 50  0000 C CNN
F 2 "" H 5250 1700 50  0001 C CNN
F 3 "" H 5250 1700 50  0001 C CNN
	1    5250 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1700 5250 1650
Wire Wire Line
	5250 1650 5450 1650
Wire Wire Line
	5250 1500 5250 1550
$Comp
L Device:LED_RGB D1
U 1 1 5FBB0105
P 4400 2800
F 0 "D1" H 4400 2333 50  0000 C CNN
F 1 "LED_RGB" H 4400 2424 50  0000 C CNN
F 2 "LED_SMD:LED_RGB_5050-6" H 4400 2750 50  0001 C CNN
F 3 "~" H 4400 2750 50  0001 C CNN
	1    4400 2800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5FBBD4C1
P 4750 3050
F 0 "#PWR0111" H 4750 2800 50  0001 C CNN
F 1 "GND" H 4755 2877 50  0000 C CNN
F 2 "" H 4750 3050 50  0001 C CNN
F 3 "" H 4750 3050 50  0001 C CNN
	1    4750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2600 4600 2800
Wire Wire Line
	4600 2800 4600 3000
Connection ~ 4600 2800
Connection ~ 4600 3000
Wire Wire Line
	4750 3000 4750 3050
Wire Wire Line
	4600 3000 4750 3000
Text GLabel 3800 2600 0    50   Input ~ 0
B1
Text GLabel 3800 2800 0    50   Input ~ 0
B3
Text GLabel 3800 3000 0    50   Input ~ 0
B4
Wire Wire Line
	4150 2600 4200 2600
Wire Wire Line
	4150 2800 4200 2800
Wire Wire Line
	4150 3000 4200 3000
$Comp
L Device:R R1
U 1 1 5FBCEB5D
P 4000 2600
F 0 "R1" V 3793 2600 50  0000 C CNN
F 1 "30 ohm" V 3884 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 2600 50  0001 C CNN
F 3 "~" H 4000 2600 50  0001 C CNN
	1    4000 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FBD0351
P 4000 2800
F 0 "R2" V 3900 2800 50  0000 C CNN
F 1 "30 ohm" V 4100 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 2800 50  0001 C CNN
F 3 "~" H 4000 2800 50  0001 C CNN
	1    4000 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FBD0E6B
P 4000 3000
F 0 "R3" V 4100 3000 50  0000 C CNN
F 1 "30 ohm" V 4200 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3930 3000 50  0001 C CNN
F 3 "~" H 4000 3000 50  0001 C CNN
	1    4000 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2600 3850 2600
Wire Wire Line
	3800 2800 3850 2800
Wire Wire Line
	3800 3000 3850 3000
Wire Wire Line
	2100 2250 3100 2250
Wire Wire Line
	3100 2250 3100 2500
Connection ~ 2100 2250
Wire Wire Line
	2100 2250 2100 2300
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5FBCE2ED
P 2000 2150
F 0 "H1" V 2237 2153 50  0000 C CNN
F 1 "Battery Mechanical Switch Pad" V 2146 2153 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_4.0x4.0mm" H 2000 2150 50  0001 C CNN
F 3 "~" H 2000 2150 50  0001 C CNN
	1    2000 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 2250 5850 2250
Wire Wire Line
	5850 2250 5850 2400
Connection ~ 3100 2250
Wire Wire Line
	3100 1400 3100 2250
Wire Wire Line
	3100 1400 3850 1400
$EndSCHEMATC
