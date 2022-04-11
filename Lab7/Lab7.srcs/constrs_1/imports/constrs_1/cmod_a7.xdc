## Modified for CMOD A7 board by Anders Stengaard Sørensen, University of Southern Denmark
## 2022 03 24

## Clock Signal
set_property -dict { PACKAGE_PIN A16  IOSTANDARD LVCMOS33 } [get_ports { CLK24MHZ }];
create_clock -add -name sys_clk_pin -period 41.666 -waveform {0 20.833} [get_ports { CLK24MHZ }];

## LEDs
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN K2   IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN U1   IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN T2   IOSTANDARD LVCMOS33 } [get_ports { led[3] }];
set_property -dict { PACKAGE_PIN T1   IOSTANDARD LVCMOS33 } [get_ports { led[4] }];
set_property -dict { PACKAGE_PIN R2   IOSTANDARD LVCMOS33 } [get_ports { led[5] }];

## HDMI
set_property -dict { PACKAGE_PIN N3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[1] }];
set_property -dict { PACKAGE_PIN P3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[1] }];
set_property -dict { PACKAGE_PIN R3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[0] }];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[0] }];
set_property -dict { PACKAGE_PIN V2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[2] }];
set_property -dict { PACKAGE_PIN W2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[2] }];
set_property -dict { PACKAGE_PIN N2   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_p[3] }];
set_property -dict { PACKAGE_PIN N1   IOSTANDARD TMDS_33 } [get_ports { hdmi_out_n[3] }];

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]