EESchema Schematic File Version 4
LIBS:KarisGiftPCB-cache
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
L KarisGiftPCB-rescue:ATtiny85V-10PU-MCU_Microchip_ATtiny-KarisGift-rescue-KarisGiftPCB-rescue U1
U 1 1 5FDE0C7F
P 1900 1700
F 0 "U1" H 1370 1746 50  0000 R CNN
F 1 "ATtiny85V-10PU" H 1370 1655 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 1900 1700 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 1900 1700 50  0001 C CNN
	1    1900 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FDE2B5F
P 1900 2400
F 0 "#PWR0101" H 1900 2150 50  0001 C CNN
F 1 "GND" H 1905 2227 50  0000 C CNN
F 2 "" H 1900 2400 50  0001 C CNN
F 3 "" H 1900 2400 50  0001 C CNN
	1    1900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2300 1900 2400
$Comp
L power:VCC #PWR0102
U 1 1 5FDE309C
P 1900 1000
F 0 "#PWR0102" H 1900 850 50  0001 C CNN
F 1 "VCC" H 1915 1173 50  0000 C CNN
F 2 "" H 1900 1000 50  0001 C CNN
F 3 "" H 1900 1000 50  0001 C CNN
	1    1900 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1000 1900 1100
Text GLabel 2500 1900 2    50   Input ~ 0
Reset
Text GLabel 2500 1700 2    50   Input ~ 0
Vibrate_switch
Text GLabel 2500 1800 2    50   Input ~ 0
RGB_switch
Text GLabel 2500 1500 2    50   Output ~ 0
LED_cutoff
Text GLabel 2500 1600 2    50   Output ~ 0
Vibrate_driver
Text GLabel 2500 1400 2    50   Output ~ 0
RGB_data
Text GLabel 3900 1450 0    50   Output ~ 0
Reset
$Comp
L power:GND #PWR0103
U 1 1 5FDE5522
P 4400 1450
F 0 "#PWR0103" H 4400 1200 50  0001 C CNN
F 1 "GND" V 4405 1322 50  0000 R CNN
F 2 "" H 4400 1450 50  0001 C CNN
F 3 "" H 4400 1450 50  0001 C CNN
	1    4400 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FDE678A
P 4400 1550
F 0 "#PWR0104" H 4400 1300 50  0001 C CNN
F 1 "GND" V 4405 1422 50  0000 R CNN
F 2 "" H 4400 1550 50  0001 C CNN
F 3 "" H 4400 1550 50  0001 C CNN
	1    4400 1550
	0    -1   -1   0   
$EndComp
Text GLabel 3900 1550 0    50   Output ~ 0
RGB_switch
$Comp
L power:GND #PWR0105
U 1 1 5FDE6FEA
P 4400 1650
F 0 "#PWR0105" H 4400 1400 50  0001 C CNN
F 1 "GND" V 4405 1522 50  0000 R CNN
F 2 "" H 4400 1650 50  0001 C CNN
F 3 "" H 4400 1650 50  0001 C CNN
	1    4400 1650
	0    -1   -1   0   
$EndComp
Text GLabel 3900 1650 0    50   Output ~ 0
Vibrate_switch
Text Notes 2050 750  2    50   ~ 0
ATtiny85
Text Notes 4150 800  2    50   ~ 0
Switches
Wire Notes Line
	700  650  700  2650
Wire Notes Line
	700  2650 3150 2650
Wire Notes Line
	3150 2650 3150 650 
Wire Notes Line
	3150 650  700  650 
Wire Notes Line
	3250 650  3250 2350
Wire Notes Line
	3250 2350 4800 2350
Wire Notes Line
	4800 2350 4800 650 
Wire Notes Line
	4800 650  3250 650 
$Comp
L power:VCC #PWR0106
U 1 1 5FDE8E6E
P 5150 1050
F 0 "#PWR0106" H 5150 900 50  0001 C CNN
F 1 "VCC" H 5165 1223 50  0000 C CNN
F 2 "" H 5150 1050 50  0001 C CNN
F 3 "" H 5150 1050 50  0001 C CNN
	1    5150 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FDEA5E8
P 5150 1900
F 0 "R6" H 5220 1946 50  0000 L CNN
F 1 "R" H 5220 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5080 1900 50  0001 C CNN
F 3 "~" H 5150 1900 50  0001 C CNN
	1    5150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5FDEC583
P 6250 1900
F 0 "R19" H 6320 1946 50  0000 L CNN
F 1 "R" H 6320 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 1900 50  0001 C CNN
F 3 "~" H 6250 1900 50  0001 C CNN
	1    6250 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q3
U 1 1 5FDED22E
P 5650 2500
F 0 "Q3" H 5840 2546 50  0000 L CNN
F 1 "2N3904" H 5840 2455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5850 2425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5650 2500 50  0001 L CNN
	1    5650 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5FDEDF2B
P 5300 2500
F 0 "R8" V 5200 2450 50  0000 C CNN
F 1 "500" V 5300 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5230 2500 50  0001 C CNN
F 3 "~" H 5300 2500 50  0001 C CNN
	1    5300 2500
	0    1    1    0   
$EndComp
Text GLabel 5050 2550 3    50   Input ~ 0
LED_cutoff
Text Notes 6750 750  2    50   ~ 0
LEDs on buttons and switches
Wire Notes Line
	4900 3100 7350 3100
Wire Notes Line
	7350 650  4900 650 
$Comp
L Transistor_BJT:2N3904 Q5
U 1 1 5FDF90B3
P 8600 1950
F 0 "Q5" H 8790 1996 50  0000 L CNN
F 1 "2N3904" H 8790 1905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 1875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 8600 1950 50  0001 L CNN
	1    8600 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R30
U 1 1 5FDF90B9
P 8250 1950
F 0 "R30" V 8150 1900 50  0000 C CNN
F 1 "500" V 8250 1950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8180 1950 50  0001 C CNN
F 3 "~" H 8250 1950 50  0001 C CNN
	1    8250 1950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5FDF90C0
P 8700 2250
F 0 "#PWR0107" H 8700 2000 50  0001 C CNN
F 1 "GND" H 8705 2077 50  0000 C CNN
F 2 "" H 8700 2250 50  0001 C CNN
F 3 "" H 8700 2250 50  0001 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5FDF9F3D
P 8350 1400
F 0 "D1" V 8304 1480 50  0000 L CNN
F 1 "D" V 8395 1480 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8350 1400 50  0001 C CNN
F 3 "~" H 8350 1400 50  0001 C CNN
	1    8350 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 1250 8350 1150
Wire Wire Line
	8350 1150 8700 1150
Wire Wire Line
	8350 1550 8350 1650
Wire Wire Line
	8350 1650 8700 1650
Wire Wire Line
	8700 1650 8700 1750
$Comp
L power:VCC #PWR0108
U 1 1 5FDFAE80
P 8700 1050
F 0 "#PWR0108" H 8700 900 50  0001 C CNN
F 1 "VCC" H 8715 1223 50  0000 C CNN
F 2 "" H 8700 1050 50  0001 C CNN
F 3 "" H 8700 1050 50  0001 C CNN
	1    8700 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1050 8700 1150
Text GLabel 8100 1950 0    50   Input ~ 0
Vibrate_driver
Text Notes 8650 800  2    50   ~ 0
Vibration Motor
Wire Notes Line
	7450 2500 9300 2500
Wire Notes Line
	9300 650  7450 650 
$Comp
L Device:R R31
U 1 1 5FF90771
P 8400 2100
F 0 "R31" H 8250 1950 50  0000 L CNN
F 1 "10k" V 8400 2050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8330 2100 50  0001 C CNN
F 3 "~" H 8400 2100 50  0001 C CNN
	1    8400 2100
	1    0    0    -1  
$EndComp
Connection ~ 8400 1950
Wire Wire Line
	8700 2150 8700 2250
Wire Wire Line
	8400 2250 8700 2250
Connection ~ 8700 2250
Wire Notes Line
	9300 650  9300 2500
Wire Notes Line
	7450 650  7450 2500
$Comp
L power:GND #PWR0109
U 1 1 5FDEF68D
P 5750 2800
F 0 "#PWR0109" H 5750 2550 50  0001 C CNN
F 1 "GND" H 5755 2627 50  0000 C CNN
F 2 "" H 5750 2800 50  0001 C CNN
F 3 "" H 5750 2800 50  0001 C CNN
	1    5750 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0110
U 1 1 5FE03943
P 2650 3450
F 0 "#PWR0110" H 2650 3300 50  0001 C CNN
F 1 "VCC" H 2665 3623 50  0000 C CNN
F 2 "" H 2650 3450 50  0001 C CNN
F 3 "" H 2650 3450 50  0001 C CNN
	1    2650 3450
	1    0    0    -1  
$EndComp
Text GLabel 1350 5050 0    50   Input ~ 0
RGB_data
$Comp
L Device:R R1
U 1 1 5FE0932F
P 1350 4000
F 0 "R1" V 1250 3950 50  0000 C CNN
F 1 "500" V 1350 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1280 4000 50  0001 C CNN
F 3 "~" H 1350 4000 50  0001 C CNN
	1    1350 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5FE09335
P 1800 4300
F 0 "#PWR0111" H 1800 4050 50  0001 C CNN
F 1 "GND" H 1805 4127 50  0000 C CNN
F 2 "" H 1800 4300 50  0001 C CNN
F 3 "" H 1800 4300 50  0001 C CNN
	1    1800 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FE148AE
P 1500 5050
F 0 "R3" V 1600 5100 50  0000 C CNN
F 1 "470" V 1500 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1430 5050 50  0001 C CNN
F 3 "~" H 1500 5050 50  0001 C CNN
	1    1500 5050
	0    -1   -1   0   
$EndComp
Text GLabel 1200 4000 0    50   Input ~ 0
LED_cutoff
Text Notes 1700 3400 2    50   ~ 0
RGB LEDs
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 5FE09329
P 1700 4000
F 0 "Q1" H 1890 4046 50  0000 L CNN
F 1 "2N3904" H 1890 3955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 1900 3925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 1700 4000 50  0001 L CNN
	1    1700 4000
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3906 Q2
U 1 1 5FFA5010
P 2550 3800
F 0 "Q2" H 2740 3846 50  0000 L CNN
F 1 "2N3906" H 2740 3755 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2750 3725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3906.pdf" H 2550 3800 50  0001 L CNN
	1    2550 3800
	1    0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 5FFA603B
P 2300 3600
F 0 "R5" H 2200 3750 50  0000 C CNN
F 1 "10k" V 2300 3600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 3600 50  0001 C CNN
F 3 "~" H 2300 3600 50  0001 C CNN
	1    2300 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5FFAFFBD
P 2050 3800
F 0 "R4" V 1950 3700 50  0000 C CNN
F 1 "500" V 2050 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1980 3800 50  0001 C CNN
F 3 "~" H 2050 3800 50  0001 C CNN
	1    2050 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5FFDCB12
P 1500 4150
F 0 "R2" H 1400 4000 50  0000 C CNN
F 1 "10k" V 1500 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1430 4150 50  0001 C CNN
F 3 "~" H 1500 4150 50  0001 C CNN
	1    1500 4150
	1    0    0    -1  
$EndComp
Connection ~ 1500 4000
Wire Wire Line
	1500 4300 1800 4300
Wire Wire Line
	1800 4200 1800 4300
Connection ~ 1800 4300
Wire Notes Line
	700  3200 700  5600
$Comp
L Device:R R11
U 1 1 5FFEAD28
P 5450 2650
F 0 "R11" H 5300 2500 50  0000 L CNN
F 1 "10k" V 5450 2600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5380 2650 50  0001 C CNN
F 3 "~" H 5450 2650 50  0001 C CNN
	1    5450 2650
	1    0    0    -1  
$EndComp
Connection ~ 5450 2500
Wire Wire Line
	5450 2800 5750 2800
Wire Wire Line
	5750 2700 5750 2800
Connection ~ 5750 2800
Wire Notes Line
	7350 650  7350 3100
Wire Notes Line
	4900 650  4900 3100
Connection ~ 2650 3450
Wire Wire Line
	2650 3450 2650 3600
Wire Wire Line
	2950 3750 2950 3800
Wire Wire Line
	2950 3800 3050 3800
Wire Wire Line
	1800 3800 1900 3800
Wire Wire Line
	2200 3800 2300 3800
Wire Wire Line
	2300 3750 2300 3800
Connection ~ 2300 3800
Wire Wire Line
	2300 3800 2350 3800
Wire Wire Line
	2300 3450 2650 3450
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5FFF6A89
P 3100 5050
F 0 "J1" H 3128 5076 50  0000 L CNN
F 1 "RGB LED Connection" H 2300 5300 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 3100 5050 50  0001 C CNN
F 3 "~" H 3100 5050 50  0001 C CNN
	1    3100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5050 2900 5050
Wire Wire Line
	2650 4000 2650 4950
Wire Wire Line
	2650 4950 2900 4950
$Comp
L power:GND #PWR0112
U 1 1 5FFFFDEE
P 2800 5250
F 0 "#PWR0112" H 2800 5000 50  0001 C CNN
F 1 "GND" H 2805 5077 50  0000 C CNN
F 2 "" H 2800 5250 50  0001 C CNN
F 3 "" H 2800 5250 50  0001 C CNN
	1    2800 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5250 2800 5150
Wire Wire Line
	2800 5150 2900 5150
Wire Notes Line
	700  5600 3300 5600
Wire Notes Line
	3300 5600 3300 3200
Wire Notes Line
	3300 3200 700  3200
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5FFE7EB8
P 8900 1350
F 0 "J5" H 8928 1326 50  0000 L CNN
F 1 "Motor Connection" H 8500 1150 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 8900 1350 50  0001 C CNN
F 3 "~" H 8900 1350 50  0001 C CNN
	1    8900 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1150 8700 1350
Connection ~ 8700 1150
Wire Wire Line
	8700 1450 8700 1650
Connection ~ 8700 1650
$Comp
L Device:R R7
U 1 1 5FFF6A4A
P 5250 1900
F 0 "R7" H 5320 1946 50  0000 L CNN
F 1 "R" H 5320 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5180 1900 50  0001 C CNN
F 3 "~" H 5250 1900 50  0001 C CNN
	1    5250 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5FFF6EC3
P 5350 1900
F 0 "R9" H 5420 1946 50  0000 L CNN
F 1 "R" H 5420 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5280 1900 50  0001 C CNN
F 3 "~" H 5350 1900 50  0001 C CNN
	1    5350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5FFF7271
P 5450 1900
F 0 "R10" H 5520 1946 50  0000 L CNN
F 1 "R" H 5520 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5380 1900 50  0001 C CNN
F 3 "~" H 5450 1900 50  0001 C CNN
	1    5450 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5FFF753A
P 5550 1900
F 0 "R12" H 5620 1946 50  0000 L CNN
F 1 "R" H 5620 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5480 1900 50  0001 C CNN
F 3 "~" H 5550 1900 50  0001 C CNN
	1    5550 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5FFF7AD8
P 5650 1900
F 0 "R13" H 5720 1946 50  0000 L CNN
F 1 "R" H 5720 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5580 1900 50  0001 C CNN
F 3 "~" H 5650 1900 50  0001 C CNN
	1    5650 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5FFF7E5F
P 5750 1900
F 0 "R14" H 5820 1946 50  0000 L CNN
F 1 "R" H 5820 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5680 1900 50  0001 C CNN
F 3 "~" H 5750 1900 50  0001 C CNN
	1    5750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5FFF8189
P 5850 1900
F 0 "R15" H 5920 1946 50  0000 L CNN
F 1 "R" H 5920 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5780 1900 50  0001 C CNN
F 3 "~" H 5850 1900 50  0001 C CNN
	1    5850 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5FFF844C
P 5950 1900
F 0 "R16" H 6020 1946 50  0000 L CNN
F 1 "R" H 6020 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5880 1900 50  0001 C CNN
F 3 "~" H 5950 1900 50  0001 C CNN
	1    5950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5FFF8802
P 6050 1900
F 0 "R17" H 6120 1946 50  0000 L CNN
F 1 "R" H 6120 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5980 1900 50  0001 C CNN
F 3 "~" H 6050 1900 50  0001 C CNN
	1    6050 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5FFF8B21
P 6150 1900
F 0 "R18" H 6220 1946 50  0000 L CNN
F 1 "R" H 6220 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6080 1900 50  0001 C CNN
F 3 "~" H 6150 1900 50  0001 C CNN
	1    6150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 5FFF8EB9
P 6350 1900
F 0 "R20" H 6420 1946 50  0000 L CNN
F 1 "R" H 6420 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6280 1900 50  0001 C CNN
F 3 "~" H 6350 1900 50  0001 C CNN
	1    6350 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 5FFF9224
P 6450 1900
F 0 "R21" H 6520 1946 50  0000 L CNN
F 1 "R" H 6520 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6380 1900 50  0001 C CNN
F 3 "~" H 6450 1900 50  0001 C CNN
	1    6450 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5FFF9567
P 6550 1900
F 0 "R23" H 6620 1946 50  0000 L CNN
F 1 "R" H 6620 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6480 1900 50  0001 C CNN
F 3 "~" H 6550 1900 50  0001 C CNN
	1    6550 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R25
U 1 1 5FFF9944
P 6650 1900
F 0 "R25" H 6720 1946 50  0000 L CNN
F 1 "R" H 6720 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6580 1900 50  0001 C CNN
F 3 "~" H 6650 1900 50  0001 C CNN
	1    6650 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R26
U 1 1 5FFF9F6C
P 6750 1900
F 0 "R26" H 6820 1946 50  0000 L CNN
F 1 "R" H 6820 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6680 1900 50  0001 C CNN
F 3 "~" H 6750 1900 50  0001 C CNN
	1    6750 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R27
U 1 1 5FFFA31B
P 6850 1900
F 0 "R27" H 6920 1946 50  0000 L CNN
F 1 "R" H 6920 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6780 1900 50  0001 C CNN
F 3 "~" H 6850 1900 50  0001 C CNN
	1    6850 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R28
U 1 1 5FFFA6C1
P 6950 1900
F 0 "R28" H 7020 1946 50  0000 L CNN
F 1 "R" H 7020 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 1900 50  0001 C CNN
F 3 "~" H 6950 1900 50  0001 C CNN
	1    6950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R29
U 1 1 5FFFAA73
P 7050 1900
F 0 "R29" H 7120 1946 50  0000 L CNN
F 1 "R" H 7120 1855 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6980 1900 50  0001 C CNN
F 3 "~" H 7050 1900 50  0001 C CNN
	1    7050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2500 5150 2500
Wire Wire Line
	5050 2500 5050 2550
$Comp
L Transistor_BJT:2N3904 Q4
U 1 1 60009DE2
P 6800 2500
F 0 "Q4" H 6990 2546 50  0000 L CNN
F 1 "2N3904" H 6990 2455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7000 2425 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 6800 2500 50  0001 L CNN
	1    6800 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 60009DE8
P 6450 2500
F 0 "R22" V 6350 2450 50  0000 C CNN
F 1 "500" V 6450 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6380 2500 50  0001 C CNN
F 3 "~" H 6450 2500 50  0001 C CNN
	1    6450 2500
	0    1    1    0   
$EndComp
Text GLabel 6200 2550 3    50   Input ~ 0
LED_cutoff
$Comp
L power:GND #PWR0113
U 1 1 60009DEF
P 6900 2800
F 0 "#PWR0113" H 6900 2550 50  0001 C CNN
F 1 "GND" H 6905 2627 50  0000 C CNN
F 2 "" H 6900 2800 50  0001 C CNN
F 3 "" H 6900 2800 50  0001 C CNN
	1    6900 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 60009DF5
P 6600 2650
F 0 "R24" H 6450 2500 50  0000 L CNN
F 1 "10k" V 6600 2600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6530 2650 50  0001 C CNN
F 3 "~" H 6600 2650 50  0001 C CNN
	1    6600 2650
	1    0    0    -1  
$EndComp
Connection ~ 6600 2500
Wire Wire Line
	6600 2800 6900 2800
Wire Wire Line
	6900 2700 6900 2800
Connection ~ 6900 2800
Wire Wire Line
	6200 2500 6300 2500
Wire Wire Line
	6200 2500 6200 2550
Wire Wire Line
	5150 2050 5150 2200
Wire Wire Line
	5150 2200 5250 2200
Wire Wire Line
	5750 2200 5750 2300
Wire Wire Line
	6050 2050 6050 2200
Wire Wire Line
	6050 2200 5950 2200
Connection ~ 5750 2200
Wire Wire Line
	5950 2050 5950 2200
Connection ~ 5950 2200
Wire Wire Line
	5950 2200 5850 2200
Wire Wire Line
	5850 2200 5850 2050
Connection ~ 5850 2200
Wire Wire Line
	5850 2200 5750 2200
Wire Wire Line
	5750 2050 5750 2200
Wire Wire Line
	5650 2050 5650 2200
Connection ~ 5650 2200
Wire Wire Line
	5650 2200 5750 2200
Wire Wire Line
	5550 2200 5550 2050
Connection ~ 5550 2200
Wire Wire Line
	5550 2200 5650 2200
Wire Wire Line
	5450 2050 5450 2200
Connection ~ 5450 2200
Wire Wire Line
	5450 2200 5550 2200
Wire Wire Line
	5350 2050 5350 2200
Connection ~ 5350 2200
Wire Wire Line
	5350 2200 5450 2200
Wire Wire Line
	5250 2200 5250 2050
Connection ~ 5250 2200
Wire Wire Line
	5250 2200 5350 2200
Wire Wire Line
	6150 2050 6150 2200
Wire Wire Line
	6150 2200 6250 2200
Wire Wire Line
	6900 2200 6900 2300
Wire Wire Line
	6900 2200 6950 2200
Wire Wire Line
	7050 2200 7050 2050
Connection ~ 6900 2200
Wire Wire Line
	6950 2050 6950 2200
Connection ~ 6950 2200
Wire Wire Line
	6950 2200 7050 2200
Wire Wire Line
	6850 2050 6850 2200
Connection ~ 6850 2200
Wire Wire Line
	6850 2200 6900 2200
Wire Wire Line
	6750 2200 6750 2050
Connection ~ 6750 2200
Wire Wire Line
	6750 2200 6850 2200
Wire Wire Line
	6650 2050 6650 2200
Connection ~ 6650 2200
Wire Wire Line
	6650 2200 6750 2200
Wire Wire Line
	6550 2200 6550 2050
Connection ~ 6550 2200
Wire Wire Line
	6550 2200 6650 2200
Wire Wire Line
	6450 2050 6450 2200
Connection ~ 6450 2200
Wire Wire Line
	6450 2200 6550 2200
Wire Wire Line
	6350 2200 6350 2050
Connection ~ 6350 2200
Wire Wire Line
	6350 2200 6450 2200
Wire Wire Line
	6250 2050 6250 2200
Connection ~ 6250 2200
Wire Wire Line
	6250 2200 6350 2200
Wire Wire Line
	5150 1050 5150 1150
Wire Wire Line
	5150 1650 5150 1750
Wire Wire Line
	5250 1750 5250 1650
Wire Wire Line
	5350 1650 5350 1750
Wire Wire Line
	5450 1750 5450 1650
Wire Wire Line
	5550 1650 5550 1750
Wire Wire Line
	5650 1750 5650 1650
Wire Wire Line
	5750 1650 5750 1750
Wire Wire Line
	5850 1750 5850 1650
Wire Wire Line
	5950 1650 5950 1750
Wire Wire Line
	6050 1750 6050 1650
Wire Wire Line
	6150 1650 6150 1750
Wire Wire Line
	6250 1750 6250 1650
Wire Wire Line
	6350 1650 6350 1750
Wire Wire Line
	6450 1750 6450 1650
Wire Wire Line
	6550 1650 6550 1750
Wire Wire Line
	6650 1750 6650 1650
Wire Wire Line
	6750 1650 6750 1750
Wire Wire Line
	6850 1750 6850 1650
Wire Wire Line
	6950 1650 6950 1750
Wire Wire Line
	7050 1750 7050 1650
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 600A7B57
P 4100 2800
F 0 "J3" H 4128 2776 50  0000 L CNN
F 1 "Battery Connection" H 3600 2550 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4100 2800 50  0001 C CNN
F 3 "~" H 4100 2800 50  0001 C CNN
	1    4100 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0114
U 1 1 600A8406
P 3900 2800
F 0 "#PWR0114" H 3900 2650 50  0001 C CNN
F 1 "VCC" H 3915 2973 50  0000 C CNN
F 2 "" H 3900 2800 50  0001 C CNN
F 3 "" H 3900 2800 50  0001 C CNN
	1    3900 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 600A89F4
P 3900 2900
F 0 "#PWR0115" H 3900 2650 50  0001 C CNN
F 1 "GND" V 3905 2772 50  0000 R CNN
F 2 "" H 3900 2900 50  0001 C CNN
F 3 "" H 3900 2900 50  0001 C CNN
	1    3900 2900
	0    1    1    0   
$EndComp
Text Notes 3650 2650 0    50   ~ 0
Battery Connector
Wire Notes Line
	3550 2500 3550 3150
Wire Notes Line
	3550 3150 4450 3150
Wire Notes Line
	4450 3150 4450 2500
Wire Notes Line
	4450 2500 3550 2500
Wire Wire Line
	5150 1150 5250 1150
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J4
U 1 1 60001D64
P 6050 1450
F 0 "J4" V 6146 2429 50  0000 L CNN
F 1 "LEDs on Buttons and Switches" V 6450 1100 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 6050 1450 50  0001 C CNN
F 3 "~" H 6050 1450 50  0001 C CNN
	1    6050 1450
	0    -1   -1   0   
$EndComp
Connection ~ 5150 1150
Wire Wire Line
	6950 1150 7050 1150
Wire Wire Line
	5250 1150 5350 1150
Connection ~ 5250 1150
Wire Wire Line
	5350 1150 5450 1150
Connection ~ 5350 1150
Wire Wire Line
	5450 1150 5550 1150
Connection ~ 5450 1150
Wire Wire Line
	5650 1150 5550 1150
Connection ~ 5550 1150
Wire Wire Line
	5650 1150 5750 1150
Connection ~ 5650 1150
Wire Wire Line
	5750 1150 5850 1150
Connection ~ 5750 1150
Wire Wire Line
	5850 1150 5950 1150
Connection ~ 5850 1150
Wire Wire Line
	5950 1150 6050 1150
Connection ~ 5950 1150
Wire Wire Line
	6050 1150 6150 1150
Connection ~ 6050 1150
Wire Wire Line
	6150 1150 6250 1150
Connection ~ 6150 1150
Wire Wire Line
	6250 1150 6350 1150
Connection ~ 6250 1150
Wire Wire Line
	6350 1150 6450 1150
Connection ~ 6350 1150
Wire Wire Line
	6450 1150 6550 1150
Connection ~ 6450 1150
Wire Wire Line
	6550 1150 6650 1150
Connection ~ 6550 1150
Wire Wire Line
	6650 1150 6750 1150
Connection ~ 6650 1150
Wire Wire Line
	6750 1150 6850 1150
Connection ~ 6750 1150
Wire Wire Line
	6850 1150 6950 1150
Connection ~ 6850 1150
Connection ~ 6950 1150
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J2
U 1 1 60045888
P 4100 1550
F 0 "J2" H 4150 1867 50  0000 C CNN
F 1 "Switches Connector" H 4150 1776 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x03_P2.54mm_Vertical" H 4100 1550 50  0001 C CNN
F 3 "~" H 4100 1550 50  0001 C CNN
	1    4100 1550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
