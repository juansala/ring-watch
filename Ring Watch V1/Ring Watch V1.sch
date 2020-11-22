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
L MCU_Microchip_ATmega:ATmega2560-16AU U?
U 1 1 5FBB37C6
P 3500 4300
F 0 "U?" H 3500 1311 50  0000 C CNN
F 1 "ATmega2560-16AU" H 3500 1220 50  0000 C CNN
F 2 "Package_QFP:TQFP-100_14x14mm_P0.5mm" H 3500 4300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2549-8-bit-AVR-Microcontroller-ATmega640-1280-1281-2560-2561_datasheet.pdf" H 3500 4300 50  0001 C CNN
	1    3500 4300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:AP2127K-3.3 U?
U 1 1 5FBB59F4
P 5350 1900
F 0 "U?" H 5350 2242 50  0000 C CNN
F 1 "AP2127K-3.3" H 5350 2151 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5350 2225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2127.pdf" H 5350 2000 50  0001 C CNN
	1    5350 1900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female J?
U 1 1 5FBB7D01
P 6350 1800
F 0 "J?" H 6378 1776 50  0000 L CNN
F 1 "Programming Header" H 6378 1685 50  0000 L CNN
F 2 "" H 6350 1800 50  0001 C CNN
F 3 "~" H 6350 1800 50  0001 C CNN
	1    6350 1800
	1    0    0    -1  
$EndComp
$Comp
L Timer_RTC:PCF8523T U?
U 1 1 5FBB8880
P 5350 2800
F 0 "U?" H 5894 2846 50  0000 L CNN
F 1 "PCF8523T" H 5894 2755 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6150 2450 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/data-sheet/PCF8523.pdf" H 5350 2800 50  0001 C CNN
	1    5350 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5FBBA94D
P 6350 1200
F 0 "J?" H 6378 1176 50  0000 L CNN
F 1 "JST Socket" H 6378 1085 50  0000 L CNN
F 2 "" H 6350 1200 50  0001 C CNN
F 3 "~" H 6350 1200 50  0001 C CNN
	1    6350 1200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
