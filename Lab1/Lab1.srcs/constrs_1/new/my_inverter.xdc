set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Q_O[0]}]


set_property PACKAGE_PIN A16 [get_ports CLK_I]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_I]
set_property PACKAGE_PIN M1 [get_ports {Q_O[6]}]
set_property PACKAGE_PIN N3 [get_ports {Q_O[5]}]
set_property PACKAGE_PIN P3 [get_ports {Q_O[4]}]
set_property PACKAGE_PIN M2 [get_ports {Q_O[3]}]
set_property PACKAGE_PIN N1 [get_ports {Q_O[2]}]
set_property PACKAGE_PIN N2 [get_ports {Q_O[1]}]
set_property PACKAGE_PIN P1 [get_ports {Q_O[0]}]

create_clock -period 400000000.000 -name CLK_I -waveform {0.000 200000000.000} [get_ports CLK_I]
set_output_delay -clock [get_clocks CLK_I] -min -add_delay 0.100 [get_ports {Q_O[*]}]
set_output_delay -clock [get_clocks CLK_I] -max -add_delay 0.100 [get_ports {Q_O[*]}]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]