EESchema Schematic File Version 4
LIBS:KarisGift-cache
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
L KarisGift-rescue:ATtiny85V-10PU-MCU_Microchip_ATtiny U1
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
$Comp
L Switch:SW_Push SW1
U 1 1 5FDE4277
P 4200 1200
F 0 "SW1" H 4200 1485 50  0000 C CNN
F 1 "SW_Push" H 4200 1394 50  0000 C CNN
F 2 "" H 4200 1400 50  0001 C CNN
F 3 "~" H 4200 1400 50  0001 C CNN
	1    4200 1200
	1    0    0    -1  
$EndComp
Text GLabel 4000 1200 0    50   Output ~ 0
Reset
$Comp
L power:GND #PWR0103
U 1 1 5FDE5522
P 4400 1200
F 0 "#PWR0103" H 4400 950 50  0001 C CNN
F 1 "GND" V 4405 1072 50  0000 R CNN
F 2 "" H 4400 1200 50  0001 C CNN
F 3 "" H 4400 1200 50  0001 C CNN
	1    4400 1200
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5FDE63DA
P 4200 1700
F 0 "SW2" H 4200 1985 50  0000 C CNN
F 1 "SW_Push" H 4200 1894 50  0000 C CNN
F 2 "" H 4200 1900 50  0001 C CNN
F 3 "~" H 4200 1900 50  0001 C CNN
	1    4200 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FDE678A
P 4400 1700
F 0 "#PWR0104" H 4400 1450 50  0001 C CNN
F 1 "GND" V 4405 1572 50  0000 R CNN
F 2 "" H 4400 1700 50  0001 C CNN
F 3 "" H 4400 1700 50  0001 C CNN
	1    4400 1700
	0    -1   -1   0   
$EndComp
Text GLabel 4000 1700 0    50   Output ~ 0
RGB_switch
$Comp
L Switch:SW_Push SW3
U 1 1 5FDE6B3D
P 4200 2200
F 0 "SW3" H 4200 2485 50  0000 C CNN
F 1 "SW_Push" H 4200 2394 50  0000 C CNN
F 2 "" H 4200 2400 50  0001 C CNN
F 3 "~" H 4200 2400 50  0001 C CNN
	1    4200 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5FDE6FEA
P 4400 2200
F 0 "#PWR0105" H 4400 1950 50  0001 C CNN
F 1 "GND" V 4405 2072 50  0000 R CNN
F 2 "" H 4400 2200 50  0001 C CNN
F 3 "" H 4400 2200 50  0001 C CNN
	1    4400 2200
	0    -1   -1   0   
$EndComp
Text GLabel 4000 2200 0    50   Output ~ 0
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
L Switch:SW_Push SW4
U 1 1 5FDE9668
P 5150 1250
F 0 "SW4" V 5104 1398 50  0000 L CNN
F 1 "SW_Push" V 5195 1398 50  0000 L CNN
F 2 "" H 5150 1450 50  0001 C CNN
F 3 "~" H 5150 1450 50  0001 C CNN
	1    5150 1250
	0    1    1    0   
$EndComp
$Comp
L Device:LED D6
U 1 1 5FDE9F2C
P 5150 1600
F 0 "D6" V 5189 1482 50  0000 R CNN
F 1 "LED" V 5098 1482 50  0000 R CNN
F 2 "" H 5150 1600 50  0001 C CNN
F 3 "~" H 5150 1600 50  0001 C CNN
	1    5150 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5FDEA5E8
P 5150 1900
F 0 "R6" H 5220 1946 50  0000 L CNN
F 1 "R" H 5220 1855 50  0000 L CNN
F 2 "" V 5080 1900 50  0001 C CNN
F 3 "~" H 5150 1900 50  0001 C CNN
	1    5150 1900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5FDEB887
P 5700 1050
F 0 "#PWR0107" H 5700 900 50  0001 C CNN
F 1 "VCC" H 5715 1223 50  0000 C CNN
F 2 "" H 5700 1050 50  0001 C CNN
F 3 "" H 5700 1050 50  0001 C CNN
	1    5700 1050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW5
U 1 1 5FDEB88D
P 5700 1250
F 0 "SW5" V 5654 1398 50  0000 L CNN
F 1 "SW_Push" V 5745 1398 50  0000 L CNN
F 2 "" H 5700 1450 50  0001 C CNN
F 3 "~" H 5700 1450 50  0001 C CNN
	1    5700 1250
	0    1    1    0   
$EndComp
$Comp
L Device:LED D7
U 1 1 5FDEB893
P 5700 1600
F 0 "D7" V 5739 1482 50  0000 R CNN
F 1 "LED" V 5648 1482 50  0000 R CNN
F 2 "" H 5700 1600 50  0001 C CNN
F 3 "~" H 5700 1600 50  0001 C CNN
	1    5700 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 5FDEB899
P 5700 1900
F 0 "R8" H 5770 1946 50  0000 L CNN
F 1 "R" H 5770 1855 50  0000 L CNN
F 2 "" V 5630 1900 50  0001 C CNN
F 3 "~" H 5700 1900 50  0001 C CNN
	1    5700 1900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0108
U 1 1 5FDEC571
P 6250 1050
F 0 "#PWR0108" H 6250 900 50  0001 C CNN
F 1 "VCC" H 6265 1223 50  0000 C CNN
F 2 "" H 6250 1050 50  0001 C CNN
F 3 "" H 6250 1050 50  0001 C CNN
	1    6250 1050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW6
U 1 1 5FDEC577
P 6250 1250
F 0 "SW6" V 6204 1398 50  0000 L CNN
F 1 "SW_Push" V 6295 1398 50  0000 L CNN
F 2 "" H 6250 1450 50  0001 C CNN
F 3 "~" H 6250 1450 50  0001 C CNN
	1    6250 1250
	0    1    1    0   
$EndComp
$Comp
L Device:LED D9
U 1 1 5FDEC57D
P 6250 1600
F 0 "D9" V 6289 1482 50  0000 R CNN
F 1 "LED" V 6198 1482 50  0000 R CNN
F 2 "" H 6250 1600 50  0001 C CNN
F 3 "~" H 6250 1600 50  0001 C CNN
	1    6250 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 5FDEC583
P 6250 1900
F 0 "R10" H 6320 1946 50  0000 L CNN
F 1 "R" H 6320 1855 50  0000 L CNN
F 2 "" V 6180 1900 50  0001 C CNN
F 3 "~" H 6250 1900 50  0001 C CNN
	1    6250 1900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5FDECBC3
P 6800 1050
F 0 "#PWR0109" H 6800 900 50  0001 C CNN
F 1 "VCC" H 6815 1223 50  0000 C CNN
F 2 "" H 6800 1050 50  0001 C CNN
F 3 "" H 6800 1050 50  0001 C CNN
	1    6800 1050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW7
U 1 1 5FDECBC9
P 6800 1250
F 0 "SW7" V 6754 1398 50  0000 L CNN
F 1 "SW_Push" V 6845 1398 50  0000 L CNN
F 2 "" H 6800 1450 50  0001 C CNN
F 3 "~" H 6800 1450 50  0001 C CNN
	1    6800 1250
	0    1    1    0   
$EndComp
$Comp
L Device:LED D11
U 1 1 5FDECBCF
P 6800 1600
F 0 "D11" V 6839 1482 50  0000 R CNN
F 1 "LED" V 6748 1482 50  0000 R CNN
F 2 "" H 6800 1600 50  0001 C CNN
F 3 "~" H 6800 1600 50  0001 C CNN
	1    6800 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 5FDECBD5
P 6800 1900
F 0 "R11" H 6870 1946 50  0000 L CNN
F 1 "R" H 6870 1855 50  0000 L CNN
F 2 "" V 6730 1900 50  0001 C CNN
F 3 "~" H 6800 1900 50  0001 C CNN
	1    6800 1900
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q3
U 1 1 5FDED22E
P 5950 2550
F 0 "Q3" H 6140 2596 50  0000 L CNN
F 1 "2N3904" H 6140 2505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6150 2475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5950 2550 50  0001 L CNN
	1    5950 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FDEDF2B
P 5600 2550
F 0 "R7" V 5500 2500 50  0000 C CNN
F 1 "500" V 5600 2550 50  0000 C CNN
F 2 "" V 5530 2550 50  0001 C CNN
F 3 "~" H 5600 2550 50  0001 C CNN
	1    5600 2550
	0    1    1    0   
$EndComp
Text GLabel 5450 2550 0    50   Input ~ 0
LED_cutoff
Wire Wire Line
	6050 2350 6050 2200
Wire Wire Line
	6050 2200 5700 2200
Wire Wire Line
	5700 2200 5700 2050
Wire Wire Line
	5700 2200 5150 2200
Wire Wire Line
	5150 2200 5150 2050
Connection ~ 5700 2200
Wire Wire Line
	6050 2200 6250 2200
Wire Wire Line
	6250 2200 6250 2050
Connection ~ 6050 2200
Wire Wire Line
	6250 2200 6800 2200
Wire Wire Line
	6800 2200 6800 2050
Connection ~ 6250 2200
Text Notes 6750 750  2    50   ~ 0
LEDs on buttons and switches
Wire Notes Line
	4900 3100 7350 3100
Wire Notes Line
	7350 650  4900 650 
$Comp
L Transistor_BJT:2N3904 Q4
U 1 1 5FDF90B3
P 8600 1950
F 0 "Q4" H 8790 1996 50  0000 L CNN
F 1 "2N3904" H 8790 1905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 1875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 8600 1950 50  0001 L CNN
	1    8600 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5FDF90B9
P 8250 1950
F 0 "R12" V 8150 1900 50  0000 C CNN
F 1 "500" V 8250 1950 50  0000 C CNN
F 2 "" V 8180 1950 50  0001 C CNN
F 3 "~" H 8250 1950 50  0001 C CNN
	1    8250 1950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5FDF90C0
P 8700 2250
F 0 "#PWR0110" H 8700 2000 50  0001 C CNN
F 1 "GND" H 8705 2077 50  0000 C CNN
F 2 "" H 8700 2250 50  0001 C CNN
F 3 "" H 8700 2250 50  0001 C CNN
	1    8700 2250
	1    0    0    -1  
$EndComp
$Comp
L Motor:Motor_DC M1
U 1 1 5FDF93DD
P 8700 1350
F 0 "M1" H 8858 1346 50  0000 L CNN
F 1 "Motor_DC" H 8858 1255 50  0000 L CNN
F 2 "" H 8700 1260 50  0001 C CNN
F 3 "~" H 8700 1260 50  0001 C CNN
	1    8700 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:D D13
U 1 1 5FDF9F3D
P 8350 1400
F 0 "D13" V 8304 1480 50  0000 L CNN
F 1 "D" V 8395 1480 50  0000 L CNN
F 2 "" H 8350 1400 50  0001 C CNN
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
Connection ~ 8700 1650
$Comp
L power:VCC #PWR0111
U 1 1 5FDFAE80
P 8700 1050
F 0 "#PWR0111" H 8700 900 50  0001 C CNN
F 1 "VCC" H 8715 1223 50  0000 C CNN
F 2 "" H 8700 1050 50  0001 C CNN
F 3 "" H 8700 1050 50  0001 C CNN
	1    8700 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 1050 8700 1150
Connection ~ 8700 1150
Text GLabel 8100 1950 0    50   Input ~ 0
Vibrate_driver
Text Notes 8650 800  2    50   ~ 0
Vibration Motor
Wire Notes Line
	7450 2500 9300 2500
Wire Notes Line
	9300 650  7450 650 
$Comp
L Device:R R13
U 1 1 5FF90771
P 8400 2100
F 0 "R13" H 8250 1950 50  0000 L CNN
F 1 "10k" V 8400 2050 50  0000 L CNN
F 2 "" V 8330 2100 50  0001 C CNN
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
L power:GND #PWR0112
U 1 1 5FDEF68D
P 6050 2850
F 0 "#PWR0112" H 6050 2600 50  0001 C CNN
F 1 "GND" H 6055 2677 50  0000 C CNN
F 2 "" H 6050 2850 50  0001 C CNN
F 3 "" H 6050 2850 50  0001 C CNN
	1    6050 2850
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D1
U 1 1 5FDFECE3
P 2050 5050
F 0 "D1" H 2150 5350 50  0000 L CNN
F 1 "WS2812B" H 2100 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2100 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2150 4675 50  0001 L TNN
	1    2050 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D2
U 1 1 5FE0007F
P 2800 5050
F 0 "D2" H 2900 5350 50  0000 L CNN
F 1 "WS2812B" H 2850 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 2850 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 2900 4675 50  0001 L TNN
	1    2800 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D3
U 1 1 5FE00A53
P 3550 5050
F 0 "D3" H 3700 5350 50  0000 L CNN
F 1 "WS2812B" H 3600 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 3600 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 3650 4675 50  0001 L TNN
	1    3550 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D4
U 1 1 5FE01734
P 4300 5050
F 0 "D4" H 4450 5350 50  0000 L CNN
F 1 "WS2812B" H 4350 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 4350 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 4400 4675 50  0001 L TNN
	1    4300 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D5
U 1 1 5FE01CF7
P 5050 5050
F 0 "D5" H 5200 5350 50  0000 L CNN
F 1 "WS2812B" H 5100 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5100 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5150 4675 50  0001 L TNN
	1    5050 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D8
U 1 1 5FE0227A
P 5800 5050
F 0 "D8" H 5950 5350 50  0000 L CNN
F 1 "WS2812B" H 5850 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5850 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5900 4675 50  0001 L TNN
	1    5800 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D10
U 1 1 5FE0273A
P 6550 5050
F 0 "D10" H 6700 5350 50  0000 L CNN
F 1 "WS2812B" H 6600 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 6600 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 6650 4675 50  0001 L TNN
	1    6550 5050
	1    0    0    -1  
$EndComp
$Comp
L LED:WS2812B D12
U 1 1 5FE02D2C
P 7300 5050
F 0 "D12" H 7450 5350 50  0000 L CNN
F 1 "WS2812B" H 7350 4750 50  0000 L CNN
F 2 "LED_SMD:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 7350 4750 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 7400 4675 50  0001 L TNN
	1    7300 5050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 5FE03943
P 2650 3450
F 0 "#PWR0113" H 2650 3300 50  0001 C CNN
F 1 "VCC" H 2665 3623 50  0000 C CNN
F 2 "" H 2650 3450 50  0001 C CNN
F 3 "" H 2650 3450 50  0001 C CNN
	1    2650 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5050 2500 5050
Wire Wire Line
	3100 5050 3250 5050
Wire Wire Line
	3850 5050 4000 5050
Wire Wire Line
	4600 5050 4750 5050
Wire Wire Line
	5350 5050 5500 5050
Wire Wire Line
	6100 5050 6250 5050
Wire Wire Line
	6850 5050 7000 5050
Text GLabel 1350 5050 0    50   Input ~ 0
RGB_data
$Comp
L Device:R R1
U 1 1 5FE0932F
P 1350 4000
F 0 "R1" V 1250 3950 50  0000 C CNN
F 1 "500" V 1350 4000 50  0000 C CNN
F 2 "" V 1280 4000 50  0001 C CNN
F 3 "~" H 1350 4000 50  0001 C CNN
	1    1350 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5FE09335
P 1800 4300
F 0 "#PWR0114" H 1800 4050 50  0001 C CNN
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
F 2 "" V 1430 5050 50  0001 C CNN
F 3 "~" H 1500 5050 50  0001 C CNN
	1    1500 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 5050 1750 5050
Text GLabel 1200 4000 0    50   Input ~ 0
LED_cutoff
Text Notes 4350 3350 2    50   ~ 0
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
F 2 "" V 2230 3600 50  0001 C CNN
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
F 2 "" V 1980 3800 50  0001 C CNN
F 3 "~" H 2050 3800 50  0001 C CNN
	1    2050 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5FFBAB68
P 2050 5350
F 0 "#PWR0115" H 2050 5100 50  0001 C CNN
F 1 "GND" H 2055 5177 50  0000 C CNN
F 2 "" H 2050 5350 50  0001 C CNN
F 3 "" H 2050 5350 50  0001 C CNN
	1    2050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5FFBAF1D
P 2800 5350
F 0 "#PWR0116" H 2800 5100 50  0001 C CNN
F 1 "GND" H 2805 5177 50  0000 C CNN
F 2 "" H 2800 5350 50  0001 C CNN
F 3 "" H 2800 5350 50  0001 C CNN
	1    2800 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5FFBB25D
P 3550 5350
F 0 "#PWR0117" H 3550 5100 50  0001 C CNN
F 1 "GND" H 3555 5177 50  0000 C CNN
F 2 "" H 3550 5350 50  0001 C CNN
F 3 "" H 3550 5350 50  0001 C CNN
	1    3550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5FFBB58F
P 4300 5350
F 0 "#PWR0118" H 4300 5100 50  0001 C CNN
F 1 "GND" H 4305 5177 50  0000 C CNN
F 2 "" H 4300 5350 50  0001 C CNN
F 3 "" H 4300 5350 50  0001 C CNN
	1    4300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4000 2650 4550
Wire Wire Line
	2650 4550 2050 4550
Wire Wire Line
	2050 4550 2050 4750
Wire Wire Line
	2650 4550 2800 4550
Wire Wire Line
	2800 4550 2800 4750
Connection ~ 2650 4550
Wire Wire Line
	2800 4550 3550 4550
Wire Wire Line
	3550 4550 3550 4750
Connection ~ 2800 4550
Wire Wire Line
	3550 4550 4300 4550
Wire Wire Line
	4300 4550 4300 4750
Connection ~ 3550 4550
$Comp
L power:GND #PWR0119
U 1 1 5FFC7D1B
P 5050 5350
F 0 "#PWR0119" H 5050 5100 50  0001 C CNN
F 1 "GND" H 5055 5177 50  0000 C CNN
F 2 "" H 5050 5350 50  0001 C CNN
F 3 "" H 5050 5350 50  0001 C CNN
	1    5050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5FFC7F36
P 5800 5350
F 0 "#PWR0120" H 5800 5100 50  0001 C CNN
F 1 "GND" H 5805 5177 50  0000 C CNN
F 2 "" H 5800 5350 50  0001 C CNN
F 3 "" H 5800 5350 50  0001 C CNN
	1    5800 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5FFC824F
P 6550 5350
F 0 "#PWR0121" H 6550 5100 50  0001 C CNN
F 1 "GND" H 6555 5177 50  0000 C CNN
F 2 "" H 6550 5350 50  0001 C CNN
F 3 "" H 6550 5350 50  0001 C CNN
	1    6550 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5FFC85AA
P 7300 5350
F 0 "#PWR0122" H 7300 5100 50  0001 C CNN
F 1 "GND" H 7305 5177 50  0000 C CNN
F 2 "" H 7300 5350 50  0001 C CNN
F 3 "" H 7300 5350 50  0001 C CNN
	1    7300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4550 5050 4750
Wire Wire Line
	5800 4550 5800 4750
Wire Wire Line
	5800 4550 6550 4550
Wire Wire Line
	6550 4550 6550 4750
Connection ~ 5800 4550
Wire Wire Line
	6550 4550 7300 4550
Wire Wire Line
	7300 4550 7300 4750
Connection ~ 6550 4550
$Comp
L Device:R R2
U 1 1 5FFDCB12
P 1500 4150
F 0 "R2" H 1400 4000 50  0000 C CNN
F 1 "10k" V 1500 4150 50  0000 C CNN
F 2 "" V 1430 4150 50  0001 C CNN
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
	700  5600 7750 5600
Wire Notes Line
	7750 5600 7750 3200
Wire Notes Line
	700  3200 700  5600
Wire Notes Line
	700  3200 7750 3200
$Comp
L Device:R R9
U 1 1 5FFEAD28
P 5750 2700
F 0 "R9" H 5600 2550 50  0000 L CNN
F 1 "10k" V 5750 2650 50  0000 L CNN
F 2 "" V 5680 2700 50  0001 C CNN
F 3 "~" H 5750 2700 50  0001 C CNN
	1    5750 2700
	1    0    0    -1  
$EndComp
Connection ~ 5750 2550
Wire Wire Line
	5750 2850 6050 2850
Wire Wire Line
	6050 2750 6050 2850
Connection ~ 6050 2850
Wire Notes Line
	7350 650  7350 3100
Wire Notes Line
	4900 650  4900 3100
Wire Wire Line
	5050 4550 5800 4550
Wire Wire Line
	5050 4550 4300 4550
Connection ~ 5050 4550
Connection ~ 4300 4550
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
$EndSCHEMATC
