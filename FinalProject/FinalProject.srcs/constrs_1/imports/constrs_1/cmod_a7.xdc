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

## SPI
set_property -dict { PACKAGE_PIN A14  IOSTANDARD LVCMOS33 } [get_ports { spi_mosi }];
set_property -dict { PACKAGE_PIN B15  IOSTANDARD LVCMOS33 } [get_ports { spi_miso }];
set_property -dict { PACKAGE_PIN C15  IOSTANDARD LVCMOS33 } [get_ports { spi_clk }];
set_property -dict { PACKAGE_PIN A15  IOSTANDARD LVCMOS33 } [get_ports { spi_ss }];

## SRAM
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[0]  }];
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS33 } [get_ports { memaddr[1]  }];
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[2]  }];
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[3]  }];
set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[4]  }];
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[5]  }];
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[6]  }];
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports { memaddr[7]  }];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { memaddr[8]  }];
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { memaddr[9]  }];
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[10] }];
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[11] }];
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[12] }];
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[13] }];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { memaddr[14] }];
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { memaddr[15] }];
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { memaddr[16] }];
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { memaddr[17] }];
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { memaddr[18] }];
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { memdata[0]  }];
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports { memdata[1]  }];
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports { memdata[2]  }];
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { memdata[3]  }];
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { memdata[4]  }];
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { memdata[5]  }];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { memdata[6]  }];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { memdata[7]  }];
set_property -dict { PACKAGE_PIN P19   IOSTANDARD LVCMOS33 } [get_ports { memoen      }];
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { memwen      }];
set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports { memcen      }];


## Set buswidth for memory configuration file
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]