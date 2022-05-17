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
L digilent:CMOD_A7 U1
U 1 1 622FAFE5
P 5350 1950
F 0 "U1" H 6494 1946 50  0000 L CNN
F 1 "CMOD_A7" H 6494 1855 50  0000 L CNN
F 2 "ass_misc:CMOD_A7" H 6200 3200 50  0001 C CNN
F 3 "" H 6200 3200 50  0001 C CNN
F 4 "Digilent CMOD A7" H 5350 1950 50  0001 C CNN "MFGR info"
	1    5350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3150 6600 3150
Wire Wire Line
	6600 3150 6600 3350
$Comp
L power:GND #PWR0102
U 1 1 6230D1FF
P 6600 3350
F 0 "#PWR0102" H 6600 3100 50  0001 C CNN
F 1 "GND" H 6605 3177 50  0000 C CNN
F 2 "" H 6600 3350 50  0001 C CNN
F 3 "" H 6600 3350 50  0001 C CNN
	1    6600 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0103
U 1 1 62312C6C
P 3700 3200
F 0 "#PWR0103" H 3700 3050 50  0001 C CNN
F 1 "+5V" H 3715 3373 50  0000 C CNN
F 2 "" H 3700 3200 50  0001 C CNN
F 3 "" H 3700 3200 50  0001 C CNN
	1    3700 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 3200 3700 3250
$Comp
L Device:CP1 C2
U 1 1 62329174
P 2400 3950
F 0 "C2" H 2515 3996 50  0000 L CNN
F 1 "100uF" H 2515 3905 50  0000 L CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-6032-20_AVX-F_Pad2.25x2.35mm_HandSolder" H 2400 3950 50  0001 C CNN
F 3 "~" H 2400 3950 50  0001 C CNN
F 4 "Std. tantalium" H 2400 3950 50  0001 C CNN "MFGR info"
	1    2400 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3800 2400 3700
Wire Wire Line
	2400 3700 2200 3700
Wire Wire Line
	1900 4000 1900 4150
Wire Wire Line
	1900 4150 2400 4150
Wire Wire Line
	2400 4150 2400 4100
Connection ~ 1900 4150
$Comp
L power:GND #PWR0105
U 1 1 623418D8
P 1900 4350
F 0 "#PWR0105" H 1900 4100 50  0001 C CNN
F 1 "GND" H 1905 4177 50  0000 C CNN
F 2 "" H 1900 4350 50  0001 C CNN
F 3 "" H 1900 4350 50  0001 C CNN
	1    1900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4150 1900 4350
Wire Wire Line
	2400 3700 2800 3700
Connection ~ 2400 3700
$Comp
L power:+3.3V #PWR0106
U 1 1 62342F93
P 2800 3450
F 0 "#PWR0106" H 2800 3300 50  0001 C CNN
F 1 "+3.3V" H 2815 3623 50  0000 C CNN
F 2 "" H 2800 3450 50  0001 C CNN
F 3 "" H 2800 3450 50  0001 C CNN
	1    2800 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3450 2800 3700
Wire Wire Line
	4250 1250 3900 1250
Text Label 3950 1250 0    50   ~ 0
SCLK
Wire Wire Line
	4250 1450 3900 1450
Wire Wire Line
	4250 1550 3900 1550
Wire Wire Line
	4250 1650 3900 1650
Text Label 3950 1450 0    50   ~ 0
CE0
Text Label 3950 1550 0    50   ~ 0
MISO
Text Label 3950 1650 0    50   ~ 0
MOSI
Wire Wire Line
	4250 1350 3600 1350
$Comp
L power:GND #PWR0108
U 1 1 6238805E
P 3600 1950
F 0 "#PWR0108" H 3600 1700 50  0001 C CNN
F 1 "GND" H 3605 1777 50  0000 C CNN
F 2 "" H 3600 1950 50  0001 C CNN
F 3 "" H 3600 1950 50  0001 C CNN
	1    3600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2050 7000 2050
Text Label 6850 2050 0    50   ~ 0
PCM_CLK
Wire Wire Line
	4250 3050 3900 3050
Text Label 3900 3050 0    50   ~ 0
SPI_DATA
Text Label 3900 2750 0    50   ~ 0
SPI_CLK
$Comp
L Device:C C3
U 1 1 623A2C5D
P 4250 3550
F 0 "C3" H 4365 3596 50  0000 L CNN
F 1 "100nF" H 4365 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4288 3400 50  0001 C CNN
F 3 "~" H 4250 3550 50  0001 C CNN
F 4 "Std. Ceramic" H 4250 3550 50  0001 C CNN "MFGR info"
	1    4250 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3700 4250 3800
$Comp
L power:GND #PWR0109
U 1 1 623AA1CA
P 4250 3800
F 0 "#PWR0109" H 4250 3550 50  0001 C CNN
F 1 "GND" H 4255 3627 50  0000 C CNN
F 2 "" H 4250 3800 50  0001 C CNN
F 3 "" H 4250 3800 50  0001 C CNN
	1    4250 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2450 3900 2450
Text Label 3900 2450 0    50   ~ 0
TxD
Wire Wire Line
	4250 2150 3900 2150
Text Label 3900 2150 0    50   ~ 0
RxD
Wire Wire Line
	4250 2050 3900 2050
Text Label 3900 2050 0    50   ~ 0
GPCLK0
Text Label 6600 1050 0    50   ~ 0
PCM_DOUT
Wire Wire Line
	6450 1050 7050 1050
Wire Wire Line
	6450 1150 7050 1150
Text Label 6600 1150 0    50   ~ 0
PCM_DIN
Wire Wire Line
	6450 1250 7050 1250
Text Label 6600 1250 0    50   ~ 0
PCM_FS
Wire Wire Line
	4250 1150 3900 1150
Text Label 3950 1150 0    50   ~ 0
EE_CLK
Wire Wire Line
	4250 1750 3900 1750
Text Label 3900 1750 0    50   ~ 0
EE_DATA
$Comp
L Connector:HDMI_A J2
U 1 1 62416A6C
P 10300 2600
F 0 "J2" H 10730 2646 50  0000 L CNN
F 1 "HDMI_A" H 10730 2555 50  0000 L CNN
F 2 "Digikey:HDMI_A_Female_2000-1-2-41-00-BK" H 10325 2600 50  0001 C CNN
F 3 "https://en.wikipedia.org/wiki/HDMI" H 10325 2600 50  0001 C CNN
F 4 "HDMI stik" H 10300 2600 50  0001 C CNN "MFGR info"
	1    10300 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 2500 9600 2500
Wire Wire Line
	9900 2400 9600 2400
Text Label 9650 2500 0    50   ~ 0
CK_N
Text Label 9650 2400 0    50   ~ 0
CK_P
Text Label 3500 2950 0    50   ~ 0
CK_P
Text Label 3500 2850 0    50   ~ 0
CK_N
Wire Wire Line
	9900 2300 9600 2300
Wire Wire Line
	9900 2200 9600 2200
Text Label 9650 2300 0    50   ~ 0
D0_N
Text Label 9650 2200 0    50   ~ 0
D0_P
Wire Wire Line
	9900 2100 9600 2100
Wire Wire Line
	9600 2000 9900 2000
Wire Wire Line
	9600 1900 9900 1900
Wire Wire Line
	9900 1800 9600 1800
Text Label 9650 2100 0    50   ~ 0
D1_N
Text Label 9650 2000 0    50   ~ 0
D1_P
Text Label 9650 1900 0    50   ~ 0
D2_N
Text Label 9650 1800 0    50   ~ 0
D2_P
Text Label 6550 3050 0    50   ~ 0
D0_P
Text Label 6550 2950 0    50   ~ 0
D0_N
Text Label 3500 2650 0    50   ~ 0
D1_N
Text Label 3500 2550 0    50   ~ 0
D1_P
Text Label 6500 2450 0    50   ~ 0
D2_N
Text Label 6500 2350 0    50   ~ 0
D2_P
Wire Wire Line
	10100 3700 10100 3900
Wire Wire Line
	10600 3900 10600 3700
Wire Wire Line
	10500 3700 10500 3900
Connection ~ 10500 3900
Wire Wire Line
	10500 3900 10600 3900
Wire Wire Line
	10400 3700 10400 3900
Connection ~ 10400 3900
Wire Wire Line
	10400 3900 10500 3900
Wire Wire Line
	10300 3700 10300 3900
Wire Wire Line
	10100 3900 10200 3900
Connection ~ 10300 3900
Wire Wire Line
	10300 3900 10350 3900
Wire Wire Line
	10200 3700 10200 3900
Connection ~ 10200 3900
Wire Wire Line
	10200 3900 10300 3900
Wire Wire Line
	10350 3900 10350 4000
Connection ~ 10350 3900
Wire Wire Line
	10350 3900 10400 3900
$Comp
L power:GND #PWR0110
U 1 1 62471009
P 10350 4000
F 0 "#PWR0110" H 10350 3750 50  0001 C CNN
F 1 "GND" H 10355 3827 50  0000 C CNN
F 2 "" H 10350 4000 50  0001 C CNN
F 3 "" H 10350 4000 50  0001 C CNN
	1    10350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1500 10300 1400
$Comp
L power:+5V #PWR0111
U 1 1 62475506
P 10300 1400
F 0 "#PWR0111" H 10300 1250 50  0001 C CNN
F 1 "+5V" H 10315 1573 50  0000 C CNN
F 2 "" H 10300 1400 50  0001 C CNN
F 3 "" H 10300 1400 50  0001 C CNN
	1    10300 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ45 J3
U 1 1 6247685D
P 10550 5650
F 0 "J3" H 10220 5746 50  0000 R CNN
F 1 "RJ45" H 10220 5655 50  0000 R CNN
F 2 "Connector_RJ:RJ45_Amphenol_54602-x08_Horizontal" V 10550 5675 50  0001 C CNN
F 3 "~" V 10550 5675 50  0001 C CNN
F 4 "RJ45 kabel stil" H 10550 5650 50  0001 C CNN "MFGR info"
	1    10550 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10150 5950 9700 5950
Wire Wire Line
	10150 5850 9700 5850
Wire Wire Line
	6450 1950 7500 1950
Wire Wire Line
	6450 1850 7500 1850
Text Label 7250 1950 0    50   ~ 0
A_N
Text Label 7250 1850 0    50   ~ 0
A_P
Text Label 9800 5950 0    50   ~ 0
A_N
Text Label 9800 5850 0    50   ~ 0
A_P
Wire Wire Line
	9700 5550 10150 5550
Wire Wire Line
	9700 5650 10150 5650
Text Label 9800 5550 0    50   ~ 0
B_P
Text Label 9800 5650 0    50   ~ 0
B_N
Wire Wire Line
	9700 5250 10150 5250
Wire Wire Line
	9700 5350 10150 5350
Text Label 9800 5250 0    50   ~ 0
C_P
Text Label 9800 5350 0    50   ~ 0
C_N
Wire Wire Line
	10150 5750 10050 5750
Wire Wire Line
	10050 5750 10050 6100
$Comp
L power:GND #PWR0112
U 1 1 6251C29B
P 10050 6100
F 0 "#PWR0112" H 10050 5850 50  0001 C CNN
F 1 "GND" H 10055 5927 50  0000 C CNN
F 2 "" H 10050 6100 50  0001 C CNN
F 3 "" H 10050 6100 50  0001 C CNN
	1    10050 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 950  7500 950 
Wire Wire Line
	6450 850  7500 850 
Text Label 7250 950  0    50   ~ 0
B_P
Text Label 7250 850  0    50   ~ 0
B_N
Wire Wire Line
	3800 950  4250 950 
Wire Wire Line
	3800 850  4250 850 
Text Label 3900 950  0    50   ~ 0
C_P
Text Label 3900 850  0    50   ~ 0
C_N
Wire Wire Line
	6450 1350 7150 1350
Wire Wire Line
	7150 1350 7150 1450
$Comp
L power:GND #PWR0113
U 1 1 62549A0B
P 7150 1450
F 0 "#PWR0113" H 7150 1200 50  0001 C CNN
F 1 "GND" H 7155 1277 50  0000 C CNN
F 2 "" H 7150 1450 50  0001 C CNN
F 3 "" H 7150 1450 50  0001 C CNN
	1    7150 1450
	1    0    0    -1  
$EndComp
Text Notes 6800 1350 0    50   ~ 0
Note 1:
Text Notes 3650 1350 0    50   ~ 0
Note 1:
Text Notes 4650 3950 0    50   ~ 0
Note 1:\nMake sure pins 6, 11 and 43 are configured as outputs\nAnd that they are '0' at all times. This will create a virtual GND\nconnection at those pins, allowing lower impedance return\ncurrents for nearby output pins.
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J4
U 1 1 6256A547
P 8300 5250
F 0 "J4" H 8350 5475 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 8350 5476 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 8300 5250 50  0001 C CNN
F 3 "~" H 8300 5250 50  0001 C CNN
F 4 "For IDC cable or other" H 8300 5250 50  0001 C CNN "MFGR info"
	1    8300 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5150 8650 5150
Wire Wire Line
	8650 5150 8650 5250
Wire Wire Line
	8600 5250 8650 5250
Connection ~ 8650 5250
Wire Wire Line
	8650 5250 8650 5350
Wire Wire Line
	8600 5350 8650 5350
Connection ~ 8650 5350
Wire Wire Line
	8650 5350 8650 5450
Wire Wire Line
	8600 5450 8650 5450
Connection ~ 8650 5450
Wire Wire Line
	8650 5450 8650 5600
Wire Wire Line
	8100 5150 8050 5150
Wire Wire Line
	8050 5150 8050 5450
Wire Wire Line
	8100 5450 8050 5450
Connection ~ 8050 5450
Wire Wire Line
	8050 5450 8050 5600
Wire Wire Line
	8050 5600 8350 5600
Wire Wire Line
	8350 5600 8350 5700
Connection ~ 8350 5600
Wire Wire Line
	8350 5600 8650 5600
$Comp
L power:GND #PWR0114
U 1 1 625ADD0B
P 8350 5700
F 0 "#PWR0114" H 8350 5450 50  0001 C CNN
F 1 "GND" H 8355 5527 50  0000 C CNN
F 2 "" H 8350 5700 50  0001 C CNN
F 3 "" H 8350 5700 50  0001 C CNN
	1    8350 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2250 7150 2250
Wire Wire Line
	6450 2150 7150 2150
Text Label 6500 2150 0    50   ~ 0
X_P
Text Label 6500 2250 0    50   ~ 0
X_N
Text Label 7550 5250 0    50   ~ 0
X_P
Text Label 7550 5350 0    50   ~ 0
X_N
$Comp
L Connector_Generic:Conn_02x02_Odd_Even TP1
U 1 1 625BEF43
P 7850 5950
F 0 "TP1" V 7900 6030 50  0000 L CNN
F 1 "Conn_02x02_Odd_Even" V 7945 6030 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 7850 5950 50  0001 C CNN
F 3 "~" H 7850 5950 50  0001 C CNN
F 4 "For cheap 50R coax probe w. crimp pins" H 7850 5950 50  0001 C CNN "MFGR info"
	1    7850 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 5250 7850 5250
Wire Wire Line
	7450 5350 7750 5350
$Comp
L power:GND #PWR0115
U 1 1 625DFB0C
P 7800 6300
F 0 "#PWR0115" H 7800 6050 50  0001 C CNN
F 1 "GND" H 7805 6127 50  0000 C CNN
F 2 "" H 7800 6300 50  0001 C CNN
F 3 "" H 7800 6300 50  0001 C CNN
	1    7800 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 6250 7750 6300
Wire Wire Line
	7750 6300 7800 6300
Wire Wire Line
	7850 6250 7850 6300
Wire Wire Line
	7850 6300 7800 6300
Connection ~ 7800 6300
$Comp
L Device:R_US R1
U 1 1 625FBE35
P 7750 5600
F 0 "R1" H 7682 5646 50  0000 R CNN
F 1 "1950R" H 7682 5555 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7790 5590 50  0001 C CNN
F 3 "~" H 7750 5600 50  0001 C CNN
F 4 "Std resistor (similar value 1.8k / 2.2k OK)" H 7750 5600 50  0001 C CNN "MFGR info"
	1    7750 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 626286C7
P 7850 5600
F 0 "R2" H 7782 5646 50  0000 R CNN
F 1 "1950R" H 7782 5555 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 7890 5590 50  0001 C CNN
F 3 "~" H 7850 5600 50  0001 C CNN
F 4 "Std resistor (similar value 1.8k / 2.2k OK)" H 7850 5600 50  0001 C CNN "MFGR info"
	1    7850 5600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 5450 7850 5250
Wire Wire Line
	7850 5250 8100 5250
Wire Wire Line
	7750 5450 7750 5350
Wire Wire Line
	7750 5350 8100 5350
$Comp
L Connector_Generic:Conn_02x02_Odd_Even TP2
U 1 1 6266100C
P 5200 6650
F 0 "TP2" V 5250 6730 50  0000 L CNN
F 1 "Conn_02x02_Odd_Even" V 5295 6730 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 5200 6650 50  0001 C CNN
F 3 "~" H 5200 6650 50  0001 C CNN
F 4 "For cheap 50R coax probe w. crimp pins" H 5200 6650 50  0001 C CNN "MFGR info"
	1    5200 6650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 62661012
P 5150 7000
F 0 "#PWR0116" H 5150 6750 50  0001 C CNN
F 1 "GND" H 5155 6827 50  0000 C CNN
F 2 "" H 5150 7000 50  0001 C CNN
F 3 "" H 5150 7000 50  0001 C CNN
	1    5150 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6950 5100 7000
Wire Wire Line
	5100 7000 5150 7000
Wire Wire Line
	5200 6950 5200 7000
Wire Wire Line
	5200 7000 5150 7000
Connection ~ 5150 7000
$Comp
L Device:R_US R3
U 1 1 6266101D
P 4700 6300
F 0 "R3" H 4632 6346 50  0000 R CNN
F 1 "1950R" H 4632 6255 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4740 6290 50  0001 C CNN
F 3 "~" H 4700 6300 50  0001 C CNN
F 4 "Std resistor (similar value 1.8k / 2.2k OK)" H 4700 6300 50  0001 C CNN "MFGR info"
	1    4700 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 62661023
P 5600 6300
F 0 "R4" H 5532 6346 50  0000 R CNN
F 1 "1950R" H 5532 6255 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 5640 6290 50  0001 C CNN
F 3 "~" H 5600 6300 50  0001 C CNN
F 4 "Std resistor (similar value 1.8k / 2.2k OK)" H 5600 6300 50  0001 C CNN "MFGR info"
	1    5600 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4700 6450 5100 6450
Wire Wire Line
	5600 6450 5200 6450
Wire Wire Line
	5600 6150 5600 6050
Wire Wire Line
	4700 6150 4700 6050
Wire Wire Line
	4700 6050 4950 6050
Wire Wire Line
	4950 6050 4950 5700
Wire Wire Line
	4950 5700 5000 5700
Wire Wire Line
	5000 5700 5000 6250
Wire Wire Line
	5000 6250 5050 6250
Wire Wire Line
	5050 6250 5050 5700
Wire Wire Line
	5050 5700 5100 5700
Wire Wire Line
	5100 5700 5100 6250
Wire Wire Line
	5100 6250 5150 6250
Wire Wire Line
	5150 6250 5150 5700
Wire Wire Line
	5150 5700 5200 5700
Wire Wire Line
	5200 5700 5200 6250
Wire Wire Line
	5200 6250 5250 6250
Wire Wire Line
	5250 6250 5250 5700
Wire Wire Line
	5250 5700 5300 5700
Wire Wire Line
	5300 5700 5300 6250
Wire Wire Line
	5300 6250 5350 6250
Wire Wire Line
	5350 6250 5350 6050
Wire Wire Line
	5350 6050 5600 6050
Connection ~ 4700 6050
Connection ~ 5600 6050
Text Label 3600 5750 0    50   ~ 0
TL_A
Text Label 6200 6050 0    50   ~ 0
TL_B
Wire Wire Line
	6450 1550 6900 1550
Wire Wire Line
	6450 1450 6900 1450
Text Label 6500 1550 0    50   ~ 0
TL_A
Text Label 6500 1450 0    50   ~ 0
TL_B
$Comp
L Oscillator:IQXO-70 X1
U 1 1 6273BB59
P 1900 1750
F 0 "X1" H 2244 1796 50  0000 L CNN
F 1 "24MHz" H 2244 1705 50  0000 L CNN
F 2 "Oscillator:Oscillator_SMD_IQD_IQXO70-4Pin_7.5x5.0mm" H 2575 1425 50  0001 C CNN
F 3 "http://www.iqdfrequencyproducts.com/products/details/iqxo-70-11-30.pdf" H 1800 1750 50  0001 C CNN
F 4 "24 MHZ osc ... similar OK" H 1900 1750 50  0001 C CNN "MFGR info"
	1    1900 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 6274690D
P 1050 1750
F 0 "C4" H 1165 1796 50  0000 L CNN
F 1 "100nF" H 1165 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1088 1600 50  0001 C CNN
F 3 "~" H 1050 1750 50  0001 C CNN
F 4 "Std. Ceramic" H 1050 1750 50  0001 C CNN "MFGR info"
	1    1050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1450 1450 1450
Wire Wire Line
	1050 1450 1050 1600
Wire Wire Line
	1900 2050 1050 2050
Wire Wire Line
	1050 2050 1050 1900
Wire Wire Line
	1900 2050 1900 2150
Connection ~ 1900 2050
Wire Wire Line
	1900 1450 1900 1350
Connection ~ 1900 1450
$Comp
L power:+3.3V #PWR0117
U 1 1 6277E389
P 1900 1350
F 0 "#PWR0117" H 1900 1200 50  0001 C CNN
F 1 "+3.3V" H 1915 1523 50  0000 C CNN
F 2 "" H 1900 1350 50  0001 C CNN
F 3 "" H 1900 1350 50  0001 C CNN
	1    1900 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 6278A541
P 1900 2150
F 0 "#PWR0118" H 1900 1900 50  0001 C CNN
F 1 "GND" H 1905 1977 50  0000 C CNN
F 2 "" H 1900 2150 50  0001 C CNN
F 3 "" H 1900 2150 50  0001 C CNN
	1    1900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1750 2750 1750
Text Label 2450 1750 0    50   ~ 0
CLK24
Text Label 3950 1050 0    50   ~ 0
CLK24
$Comp
L Connector:TestPoint_Flag GND2
U 1 1 627F8BF5
P 5500 5700
F 0 "GND2" H 5760 5748 50  0000 L CNN
F 1 "TestPoint_Flag" H 5760 5703 50  0001 L CNN
F 2 "Digikey:PROBE_PAD_1206" H 5700 5700 50  0001 C CNN
F 3 "~" H 5700 5700 50  0001 C CNN
F 4 "For connecting to copper tape" H 5500 5700 50  0001 C CNN "MFGR info"
	1    5500 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Flag GND1
U 1 1 62810734
P 4750 5700
F 0 "GND1" H 5010 5748 50  0000 L CNN
F 1 "TestPoint_Flag" H 5010 5703 50  0001 L CNN
F 2 "Digikey:PROBE_PAD_1206" H 4950 5700 50  0001 C CNN
F 3 "~" H 4950 5700 50  0001 C CNN
F 4 "For connecting to copper tape" H 4750 5700 50  0001 C CNN "MFGR info"
	1    4750 5700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 6281BA0F
P 5500 5750
F 0 "#PWR0119" H 5500 5500 50  0001 C CNN
F 1 "GND" H 5505 5577 50  0000 C CNN
F 2 "" H 5500 5750 50  0001 C CNN
F 3 "" H 5500 5750 50  0001 C CNN
	1    5500 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6281CB76
P 4750 5750
F 0 "#PWR0120" H 4750 5500 50  0001 C CNN
F 1 "GND" H 4755 5577 50  0000 C CNN
F 2 "" H 4750 5750 50  0001 C CNN
F 3 "" H 4750 5750 50  0001 C CNN
	1    4750 5750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 5700 5500 5750
Wire Wire Line
	4750 5700 4750 5750
$Comp
L Connector:TestPoint GND3
U 1 1 62836E94
P 3950 6950
F 0 "GND3" H 4008 7068 50  0000 L CNN
F 1 "TestPoint" H 4008 6977 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_2.0x2.0mm_Drill1.0mm" H 4150 6950 50  0001 C CNN
F 3 "~" H 4150 6950 50  0001 C CNN
F 4 "For (square) GND pin" H 3950 6950 50  0001 C CNN "MFGR info"
	1    3950 6950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 62838A6A
P 3950 7000
F 0 "#PWR0121" H 3950 6750 50  0001 C CNN
F 1 "GND" H 3955 6827 50  0000 C CNN
F 2 "" H 3950 7000 50  0001 C CNN
F 3 "" H 3950 7000 50  0001 C CNN
	1    3950 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6950 3950 7000
$Comp
L Device:R_US R5
U 1 1 6284A9C2
P 4050 6050
F 0 "R5" V 3845 6050 50  0000 C CNN
F 1 "100R" V 3936 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4090 6040 50  0001 C CNN
F 3 "~" H 4050 6050 50  0001 C CNN
F 4 "Std resistor" H 4050 6050 50  0001 C CNN "MFGR info"
	1    4050 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 6050 4350 6050
Wire Wire Line
	3900 6050 3550 6050
Text Label 3600 6050 0    50   ~ 0
TL_AR
Wire Wire Line
	6450 1650 6900 1650
Text Label 6500 1650 0    50   ~ 0
TL_AR
Wire Wire Line
	5600 6050 6150 6050
$Comp
L Device:R_US R6
U 1 1 628A92A7
P 6150 6550
F 0 "R6" H 6082 6504 50  0000 R CNN
F 1 "120R" H 6082 6595 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 6190 6540 50  0001 C CNN
F 3 "~" H 6150 6550 50  0001 C CNN
F 4 "Std resistor" H 6150 6550 50  0001 C CNN "MFGR info"
	1    6150 6550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 628C6486
P 6150 7000
F 0 "#PWR0122" H 6150 6750 50  0001 C CNN
F 1 "GND" H 6155 6827 50  0000 C CNN
F 2 "" H 6150 7000 50  0001 C CNN
F 3 "" H 6150 7000 50  0001 C CNN
	1    6150 7000
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 628DD89A
P 6150 6200
F 0 "JP1" V 6104 6248 50  0000 L CNN
F 1 "Jumper_NO_Small" V 6195 6248 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 6150 6200 50  0001 C CNN
F 3 "~" H 6150 6200 50  0001 C CNN
F 4 "For pull down connection" H 6150 6200 50  0001 C CNN "MFGR info"
	1    6150 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 6100 6150 6050
Connection ~ 6150 6050
Wire Wire Line
	6150 6050 6400 6050
Wire Wire Line
	6150 6400 6150 6300
Connection ~ 1350 7400
Wire Wire Line
	1600 7400 1900 7400
Connection ~ 1600 7400
Wire Wire Line
	2200 7400 2450 7400
Connection ~ 2200 7400
Connection ~ 2450 7400
Text Label 1000 5550 0    50   ~ 0
GPCLK0
Wire Wire Line
	1650 5550 950  5550
Text Label 2550 6550 0    50   ~ 0
EE_CLK
Text Label 1000 6550 0    50   ~ 0
EE_DATA
Wire Wire Line
	2150 6550 3000 6550
Wire Wire Line
	1650 6550 950  6550
Text Label 1000 5450 0    50   ~ 0
SPI_CLK
Text Label 1000 5350 0    50   ~ 0
SPI_DATA
Wire Wire Line
	1650 5450 950  5450
Wire Wire Line
	1650 5350 950  5350
Wire Wire Line
	2150 7050 3000 7050
Wire Wire Line
	2150 7150 3000 7150
Text Label 2550 7150 0    50   ~ 0
PCM_DOUT
Text Label 2550 7050 0    50   ~ 0
PCM_DIN
Text Label 1000 6950 0    50   ~ 0
PCM_FS
Text Label 2550 5750 0    50   ~ 0
PCM_CLK
Wire Wire Line
	1650 6950 950  6950
Wire Wire Line
	2150 5750 3000 5750
Text Label 2550 6350 0    50   ~ 0
CE0
Wire Wire Line
	2150 6350 3000 6350
Text Label 1000 6350 0    50   ~ 0
SCLK
Text Label 1000 6250 0    50   ~ 0
MISO
Text Label 1000 6150 0    50   ~ 0
MOSI
Wire Wire Line
	1650 6350 950  6350
Wire Wire Line
	1650 6250 950  6250
Wire Wire Line
	1650 6150 950  6150
Text Label 2550 5650 0    50   ~ 0
RxD
Text Label 2550 5550 0    50   ~ 0
TxD
Wire Wire Line
	2150 5650 3000 5650
Wire Wire Line
	2150 5550 3000 5550
$Comp
L power:GND #PWR0107
U 1 1 6234FC7E
P 1900 7550
F 0 "#PWR0107" H 1900 7300 50  0001 C CNN
F 1 "GND" H 1905 7377 50  0000 C CNN
F 2 "" H 1900 7550 50  0001 C CNN
F 3 "" H 1900 7550 50  0001 C CNN
	1    1900 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 7400 2200 7400
Connection ~ 1900 7400
Wire Wire Line
	1900 7400 1900 7550
Connection ~ 2450 6850
Connection ~ 1350 7150
Wire Wire Line
	2450 7400 2450 6850
Wire Wire Line
	1350 7400 1600 7400
Wire Wire Line
	1350 7150 1350 7400
Connection ~ 1350 6450
Wire Wire Line
	1350 5650 1350 6450
Wire Wire Line
	1350 6450 1650 6450
Wire Wire Line
	1350 7150 1350 6450
Wire Wire Line
	1650 7150 1350 7150
Connection ~ 2450 6650
Wire Wire Line
	2450 6850 2450 6650
Wire Wire Line
	2150 6850 2450 6850
Connection ~ 2450 6150
Wire Wire Line
	2450 6650 2450 6150
Wire Wire Line
	2150 6650 2450 6650
Connection ~ 2450 5850
Wire Wire Line
	2450 6150 2450 5850
Wire Wire Line
	2150 6150 2450 6150
Wire Wire Line
	1650 5650 1350 5650
Wire Wire Line
	2450 5850 2150 5850
Wire Wire Line
	2450 5450 2450 5850
Wire Wire Line
	2150 5450 2450 5450
Wire Wire Line
	1350 4150 1350 4100
Wire Wire Line
	1900 4150 1350 4150
Wire Wire Line
	1350 3700 950  3700
Connection ~ 1350 3700
Wire Wire Line
	1350 3800 1350 3700
Wire Wire Line
	950  3700 950  3850
Connection ~ 950  3700
Wire Wire Line
	1600 3700 1350 3700
Wire Wire Line
	950  3450 950  3700
$Comp
L Device:C C1
U 1 1 6233471C
P 1350 3950
F 0 "C1" H 1465 3996 50  0000 L CNN
F 1 "10uF" H 1465 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 1388 3800 50  0001 C CNN
F 3 "~" H 1350 3950 50  0001 C CNN
F 4 "Std. ceramic or tantalium" H 1350 3950 50  0001 C CNN "MFGR info"
	1    1350 3950
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U2
U 1 1 62325F41
P 1900 3700
F 0 "U2" H 1900 3942 50  0000 C CNN
F 1 "LM1117-3.3" H 1900 3851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 1900 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 1900 3700 50  0001 C CNN
F 4 "3.3V fixed LDO" H 1900 3700 50  0001 C CNN "MFGR info"
	1    1900 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 6230F8D4
P 950 4000
F 0 "D1" H 950 3783 50  0000 C CNN
F 1 "B260A-13-F" H 950 3874 50  0000 C CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 950 4000 50  0001 C CNN
F 3 "~" H 950 4000 50  0001 C CNN
F 4 "Schottky diode" H 950 4000 50  0001 C CNN "MFGR info"
	1    950  4000
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 6231082F
P 950 3450
F 0 "#PWR0104" H 950 3300 50  0001 C CNN
F 1 "+5V" H 965 3623 50  0000 C CNN
F 2 "" H 950 3450 50  0001 C CNN
F 3 "" H 950 3450 50  0001 C CNN
	1    950  3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 5250 2450 5250
Wire Wire Line
	2450 5350 2450 5250
Wire Wire Line
	2150 5350 2450 5350
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 622F09BE
P 1850 6150
F 0 "J1" H 1900 7267 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 1900 7176 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 1850 6150 50  0001 C CNN
F 3 "~" H 1850 6150 50  0001 C CNN
F 4 "voluntary .. if using raspberry PI" H 1850 6150 50  0001 C CNN "MFGR info"
	1    1850 6150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 622F029C
P 1350 7500
F 0 "H4" H 1450 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1450 7503 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965_Pad" H 1350 7500 50  0001 C CNN
F 3 "~" H 1350 7500 50  0001 C CNN
F 4 "for M2.5" H 1350 7500 50  0001 C CNN "MFGR info"
	1    1350 7500
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 622F0296
P 1600 7500
F 0 "H3" H 1700 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 1700 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965_Pad" H 1600 7500 50  0001 C CNN
F 3 "~" H 1600 7500 50  0001 C CNN
F 4 "for M2.5" H 1600 7500 50  0001 C CNN "MFGR info"
	1    1600 7500
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 622EFD64
P 2200 7500
F 0 "H2" H 2300 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 2300 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965_Pad" H 2200 7500 50  0001 C CNN
F 3 "~" H 2200 7500 50  0001 C CNN
F 4 "for M2.5" H 2200 7500 50  0001 C CNN "MFGR info"
	1    2200 7500
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 622EF189
P 2450 7500
F 0 "H1" H 2550 7549 50  0001 L CNN
F 1 "MountingHole_Pad" H 2550 7458 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5_DIN965_Pad" H 2450 7500 50  0001 C CNN
F 3 "~" H 2450 7500 50  0001 C CNN
F 4 "for M2.5" H 2450 7500 50  0001 C CNN "MFGR info"
	1    2450 7500
	-1   0    0    1   
$EndComp
Wire Notes Line
	500  7750 3100 7750
Wire Notes Line
	3100 7750 3100 4950
Wire Notes Line
	3100 4950 500  4950
Wire Notes Line
	500  4950 500  7750
Text Notes 550  5050 0    50   ~ 0
Raspberry Pi hat outline
Wire Wire Line
	2450 4600 950  4600
Wire Wire Line
	950  4600 950  4150
Wire Wire Line
	2450 4600 2450 5250
Connection ~ 2450 5250
Wire Notes Line
	500  4750 3100 4750
Wire Notes Line
	3100 4750 3100 3050
Wire Notes Line
	3100 3050 500  3050
Wire Notes Line
	500  3050 500  4750
Text Notes 550  3150 0    50   ~ 0
Voltage supply
Wire Notes Line
	500  2450 3100 2450
Wire Notes Line
	3100 2450 3100 1000
Wire Notes Line
	3100 1000 500  1000
Wire Notes Line
	500  1000 500  2450
Text Notes 550  1100 0    50   ~ 0
On board 24MHz oscillator
Wire Wire Line
	1600 1750 1450 1750
Wire Wire Line
	1450 1750 1450 1450
Connection ~ 1450 1450
Wire Wire Line
	1450 1450 1050 1450
Text GLabel 2750 1750 2    50   Input ~ 0
CLK24
Text GLabel 3600 1050 0    50   Input ~ 0
CLK24
Wire Wire Line
	3600 1050 4250 1050
Wire Wire Line
	6150 6700 6150 7000
Text Notes 3850 6200 0    50   ~ 0
Source term
Text Notes 6200 6750 0    50   ~ 0
End term
Wire Wire Line
	3550 5750 4350 5750
Wire Wire Line
	4350 5750 4350 6050
Connection ~ 4350 6050
Wire Wire Line
	4350 6050 4700 6050
Text Notes 5300 6850 0    50   ~ 0
1:20 probes
Text Notes 7950 6150 0    50   ~ 0
1:20 probes
Wire Notes Line
	3400 7750 3400 4950
Wire Notes Line
	3400 4950 6900 4950
Wire Notes Line
	6900 4950 6900 7750
Wire Notes Line
	6900 7750 3400 7750
Text Notes 3450 5050 0    50   ~ 0
Transmission line test circuit
Text Notes 4950 5500 0    50   ~ 0
475mm transmission line\n=> 3ns propagation delay
Text Notes 3700 6700 0    50   ~ 0
For probe GND
Wire Notes Line
	7000 4950 8800 4950
Wire Notes Line
	8800 4950 8800 6500
Wire Notes Line
	8800 6500 7000 6500
Wire Notes Line
	7000 6500 7000 4950
Text Notes 7050 5050 0    50   ~ 0
Diff pair test circuit
Wire Notes Line
	9250 6500 9250 4950
Wire Notes Line
	9250 4950 11150 4950
Wire Notes Line
	11150 4950 11150 6500
Wire Notes Line
	11150 6500 9250 6500
Text Notes 9300 5050 0    50   ~ 0
Diff pair I/O port
Wire Notes Line
	9250 4850 11150 4850
Wire Notes Line
	11150 4850 11150 1050
Wire Notes Line
	11150 1050 9250 1050
Wire Notes Line
	9250 1050 9250 4850
Text Notes 9300 1150 0    50   ~ 0
HDMI port
Entry Wire Line
	3350 2750 3450 2650
Entry Wire Line
	3350 2650 3450 2550
Entry Wire Line
	3350 2950 3450 2850
Entry Wire Line
	3350 3050 3450 2950
Wire Wire Line
	3450 2550 4250 2550
Wire Wire Line
	3450 2650 4250 2650
Wire Wire Line
	3450 2850 4250 2850
Wire Wire Line
	3450 2950 4250 2950
Wire Wire Line
	4250 2750 3900 2750
Entry Wire Line
	7000 2450 6900 2350
Entry Wire Line
	7000 2550 6900 2450
Entry Wire Line
	7000 3050 6900 2950
Entry Wire Line
	7000 3150 6900 3050
Wire Wire Line
	6450 2350 6900 2350
Wire Wire Line
	6450 2450 6900 2450
Wire Wire Line
	6450 2950 6900 2950
Wire Wire Line
	6450 3050 6900 3050
Entry Wire Line
	9600 1800 9500 1900
Entry Wire Line
	9600 1900 9500 2000
Entry Wire Line
	9600 2000 9500 2100
Entry Wire Line
	9600 2100 9500 2200
Entry Wire Line
	9600 2200 9500 2300
Entry Wire Line
	9600 2300 9500 2400
Entry Wire Line
	9600 2400 9500 2500
Entry Wire Line
	9600 2500 9500 2600
Text Notes 7100 3200 3    50   ~ 0
HDMI
Text Notes 9450 3400 1    50   ~ 0
HDMI
Text Notes 3300 3350 1    50   ~ 0
HDMI
Entry Wire Line
	7150 2250 7250 2350
Entry Wire Line
	7150 2150 7250 2250
Text Notes 7350 2650 1    50   ~ 0
Dtest
Connection ~ 7750 5350
Connection ~ 7850 5250
Entry Wire Line
	7450 5350 7350 5450
Entry Wire Line
	7450 5250 7350 5350
Text Notes 7350 5850 1    50   ~ 0
Dtest
Wire Wire Line
	10150 5450 10050 5450
Wire Wire Line
	10050 5450 10050 5750
Connection ~ 10050 5750
Entry Wire Line
	9700 5250 9600 5350
Entry Wire Line
	9700 5350 9600 5450
Entry Wire Line
	9700 5550 9600 5650
Entry Wire Line
	9700 5650 9600 5750
Entry Wire Line
	9700 5850 9600 5950
Entry Wire Line
	9700 5950 9600 6050
Text Notes 9550 6300 1    50   ~ 0
Dport
Entry Wire Line
	7500 1950 7600 2050
Entry Wire Line
	7500 1850 7600 1950
Entry Wire Line
	7500 950  7600 1050
Entry Wire Line
	7500 850  7600 950 
Text Notes 7700 2350 1    50   ~ 0
Dport
Entry Wire Line
	3700 750  3800 850 
Entry Wire Line
	3700 850  3800 950 
Wire Bus Line
	3700 600  7600 600 
Wire Wire Line
	4250 3150 4250 3250
Wire Wire Line
	3700 3250 4250 3250
Connection ~ 4250 3250
Wire Wire Line
	4250 3250 4250 3400
$Comp
L Device:LED D7
U 1 1 63394D10
P 8650 3150
F 0 "D7" V 8689 3032 50  0000 R CNN
F 1 "LED" V 8598 3032 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 3150 50  0001 C CNN
F 3 "~" H 8650 3150 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 3150 50  0001 C CNN "MFGR info"
	1    8650 3150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 63394D16
P 8650 2800
F 0 "D6" V 8689 2682 50  0000 R CNN
F 1 "LED" V 8598 2682 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 2800 50  0001 C CNN
F 3 "~" H 8650 2800 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 2800 50  0001 C CNN "MFGR info"
	1    8650 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 633A8816
P 8650 2450
F 0 "D5" V 8689 2332 50  0000 R CNN
F 1 "LED" V 8598 2332 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 2450 50  0001 C CNN
F 3 "~" H 8650 2450 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 2450 50  0001 C CNN "MFGR info"
	1    8650 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 633A881C
P 8650 2100
F 0 "D4" V 8689 1982 50  0000 R CNN
F 1 "LED" V 8598 1982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 2100 50  0001 C CNN
F 3 "~" H 8650 2100 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 2100 50  0001 C CNN "MFGR info"
	1    8650 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 633A8822
P 8650 1750
F 0 "D3" V 8689 1632 50  0000 R CNN
F 1 "LED" V 8598 1632 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 1750 50  0001 C CNN
F 3 "~" H 8650 1750 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 1750 50  0001 C CNN "MFGR info"
	1    8650 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 633A8828
P 8650 1400
F 0 "D2" V 8689 1282 50  0000 R CNN
F 1 "LED" V 8598 1282 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 1400 50  0001 C CNN
F 3 "~" H 8650 1400 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 1400 50  0001 C CNN "MFGR info"
	1    8650 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R12
U 1 1 633DFF49
P 8350 3150
F 0 "R12" H 8282 3104 50  0000 R CNN
F 1 "120R" H 8282 3195 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 3140 50  0001 C CNN
F 3 "~" H 8350 3150 50  0001 C CNN
F 4 "Std resistor" H 8350 3150 50  0001 C CNN "MFGR info"
	1    8350 3150
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R11
U 1 1 633EFA59
P 8350 2800
F 0 "R11" H 8282 2754 50  0000 R CNN
F 1 "120R" H 8282 2845 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 2790 50  0001 C CNN
F 3 "~" H 8350 2800 50  0001 C CNN
F 4 "Std resistor" H 8350 2800 50  0001 C CNN "MFGR info"
	1    8350 2800
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R10
U 1 1 633FF2BC
P 8350 2450
F 0 "R10" H 8282 2404 50  0000 R CNN
F 1 "120R" H 8282 2495 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 2440 50  0001 C CNN
F 3 "~" H 8350 2450 50  0001 C CNN
F 4 "Std resistor" H 8350 2450 50  0001 C CNN "MFGR info"
	1    8350 2450
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R9
U 1 1 6340EDBB
P 8350 2100
F 0 "R9" H 8282 2054 50  0000 R CNN
F 1 "120R" H 8282 2145 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 2090 50  0001 C CNN
F 3 "~" H 8350 2100 50  0001 C CNN
F 4 "Std resistor" H 8350 2100 50  0001 C CNN "MFGR info"
	1    8350 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R8
U 1 1 6341E39B
P 8350 1750
F 0 "R8" H 8282 1704 50  0000 R CNN
F 1 "120R" H 8282 1795 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 1740 50  0001 C CNN
F 3 "~" H 8350 1750 50  0001 C CNN
F 4 "Std resistor" H 8350 1750 50  0001 C CNN "MFGR info"
	1    8350 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R7
U 1 1 6342E037
P 8350 1400
F 0 "R7" H 8282 1354 50  0000 R CNN
F 1 "120R" H 8282 1445 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 1390 50  0001 C CNN
F 3 "~" H 8350 1400 50  0001 C CNN
F 4 "Std resistor" H 8350 1400 50  0001 C CNN "MFGR info"
	1    8350 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 1400 8800 1750
Connection ~ 8800 1750
Wire Wire Line
	8800 1750 8800 2100
Connection ~ 8800 2100
Wire Wire Line
	8800 2100 8800 2450
Connection ~ 8800 2450
Wire Wire Line
	8800 2450 8800 2800
Connection ~ 8800 2800
Wire Wire Line
	8800 2800 8800 3150
Connection ~ 8800 3150
$Comp
L power:GND #PWR0101
U 1 1 634E5E8A
P 8800 3950
F 0 "#PWR0101" H 8800 3700 50  0001 C CNN
F 1 "GND" H 8805 3777 50  0000 C CNN
F 2 "" H 8800 3950 50  0001 C CNN
F 3 "" H 8800 3950 50  0001 C CNN
	1    8800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1750 6900 1750
Text Label 6500 1750 0    50   ~ 0
LED0
Wire Wire Line
	8200 3150 7850 3150
Wire Wire Line
	8200 2800 7850 2800
Text Label 7950 2800 0    50   ~ 0
LED1
Wire Wire Line
	4250 1950 3900 1950
Text Label 3900 1950 0    50   ~ 0
LED1
Wire Wire Line
	8800 3150 8800 3650
Wire Wire Line
	8200 2450 7850 2450
Text Label 7950 2450 0    50   ~ 0
LED2
Wire Wire Line
	6450 2550 6750 2550
Text Label 6500 2550 0    50   ~ 0
LED2
Wire Wire Line
	8200 2100 7850 2100
Text Label 7950 2100 0    50   ~ 0
LED3
Wire Wire Line
	6450 2650 6750 2650
Text Label 6500 2650 0    50   ~ 0
LED3
Wire Wire Line
	8200 1750 7850 1750
Text Label 7950 1750 0    50   ~ 0
LED4
Wire Wire Line
	6450 2750 6750 2750
Text Label 6500 2750 0    50   ~ 0
LED4
Wire Wire Line
	8200 1400 7850 1400
Text Label 7950 1400 0    50   ~ 0
LED5
Wire Wire Line
	6450 2850 6750 2850
Text Label 6500 2850 0    50   ~ 0
LED5
$Comp
L Device:LED D8
U 1 1 63677C80
P 8650 3650
F 0 "D8" V 8689 3532 50  0000 R CNN
F 1 "LED" V 8598 3532 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 3650 50  0001 C CNN
F 3 "~" H 8650 3650 50  0001 C CNN
F 4 "Std. red/amber/yellow/green LED" H 8650 3650 50  0001 C CNN "MFGR info"
	1    8650 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R13
U 1 1 63677C86
P 8350 3650
F 0 "R13" H 8282 3604 50  0000 R CNN
F 1 "120R" H 8282 3695 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 8390 3640 50  0001 C CNN
F 3 "~" H 8350 3650 50  0001 C CNN
F 4 "Std resistor" H 8350 3650 50  0001 C CNN "MFGR info"
	1    8350 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 3650 7700 3650
Text Label 7950 3150 0    50   ~ 0
LED0
$Comp
L power:+3.3V #PWR0123
U 1 1 63716A13
P 7700 3500
F 0 "#PWR0123" H 7700 3350 50  0001 C CNN
F 1 "+3.3V" H 7715 3673 50  0000 C CNN
F 2 "" H 7700 3500 50  0001 C CNN
F 3 "" H 7700 3500 50  0001 C CNN
	1    7700 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3500 7700 3650
Connection ~ 8800 3650
Wire Wire Line
	8800 3650 8800 3950
Wire Wire Line
	4250 1850 3600 1850
Wire Wire Line
	3600 1350 3600 1850
Wire Wire Line
	3600 1850 3600 1950
Connection ~ 3600 1850
Text Notes 3650 1850 0    50   ~ 0
Note 1:
Wire Bus Line
	7250 2250 7250 2650
Wire Bus Line
	7350 5350 7350 5850
Wire Bus Line
	3700 600  3700 850 
Wire Bus Line
	7000 2450 7000 3400
Wire Bus Line
	3350 2650 3350 3350
Wire Bus Line
	9600 5350 9600 6300
Wire Bus Line
	7600 600  7600 2350
Wire Bus Line
	9500 1900 9500 3400
$EndSCHEMATC
