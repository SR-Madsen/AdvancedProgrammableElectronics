set_property PACKAGE_PIN L17 [get_ports CLK_I]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_I]
create_clock -period 83.333 -name CLK_I -waveform {0.000 41.667} [get_ports CLK_I]

set_property IOSTANDARD TMDS_33 [get_ports DATAN_O]
set_property IOSTANDARD TMDS_33 [get_ports DATAP_O]
set_property PACKAGE_PIN N2 [get_ports DATAP_O]
set_property PACKAGE_PIN N1 [get_ports DATAN_O]