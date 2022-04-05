## Modified for CMOD A7 board by Anders Stengaard Sørensen, University of Southern Denmark
## 2022 03 24

## Clock Signal
set_property -dict { PACKAGE_PIN A16    IOSTANDARD LVCMOS33 } [get_ports { CLK24MHZ }]; #IO_L12P_T1_MRCC_34 Sch=ddr3_clk[200]
create_clock -add -name sys_clk_pin -period 41.666 [get_ports { CLK24MHZ }];

## LEDs
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; #IO_L16N_T2_A27_15 Sch=led[2]
set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; #IO_L17P_T2_A26_15 Sch=led[3]
set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; #IO_L17N_T2_A25_15 Sch=led[4]
set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; #IO_L18P_T2_A24_15 Sch=led[5]

## HDMI
set_property -dict { PACKAGE_PIN N3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[1] }]; #IO_L4P_T0_D04_14 Sch=ja_p[1]
set_property -dict { PACKAGE_PIN P3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[1] }]; #IO_L4N_T0_D05_14 Sch=ja_n[1]
set_property -dict { PACKAGE_PIN R3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[0] }]; #IO_L5P_T0_D06_14 Sch=ja_p[2]
set_property -dict { PACKAGE_PIN T3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[0] }]; #IO_L5N_T0_D07_14 Sch=ja_n[2]
set_property -dict { PACKAGE_PIN V2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[2] }]; #IO_L7P_T1_D09_14 Sch=ja_p[3]
set_property -dict { PACKAGE_PIN W2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[2] }]; #IO_L7N_T1_D10_14 Sch=ja_n[3]
set_property -dict { PACKAGE_PIN N2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[3] }]; #IO_L8P_T1_D11_14 Sch=ja_p[4]
set_property -dict { PACKAGE_PIN N1   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[3] }]; #IO_L8N_T1_D12_14 Sch=ja_n[4]