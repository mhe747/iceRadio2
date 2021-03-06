# Bitstream settings
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]

# Clock and reset
set_property PACKAGE_PIN Y18 [get_ports clk_in]
set_property IOSTANDARD LVCMOS25 [get_ports clk_in]
set_property PACKAGE_PIN T3 [get_ports reset_n_in]
set_property IOSTANDARD LVCMOS25 [get_ports reset_n_in]

# Bank 14
set_property PACKAGE_PIN N13 [get_ports I2C2_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports I2C2_scl_io]
set_property PACKAGE_PIN N14 [get_ports I2C2_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports I2C2_sda_io]

# ADC Interface
set_property PACKAGE_PIN W9 [get_ports ADC_SCLK]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_SCLK]
set_property PACKAGE_PIN Y9 [get_ports ADC_SDATA]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_SDATA]
set_property PACKAGE_PIN U7 [get_ports ADC_SEN]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_SEN]

set_property PACKAGE_PIN W5 [get_ports {ADC_D[0]}]
set_property PACKAGE_PIN U6 [get_ports {ADC_D[1]}]
set_property PACKAGE_PIN V5 [get_ports {ADC_D[2]}]
set_property PACKAGE_PIN R6 [get_ports {ADC_D[3]}]
set_property PACKAGE_PIN T6 [get_ports {ADC_D[4]}]
set_property PACKAGE_PIN Y6 [get_ports {ADC_D[5]}]
set_property PACKAGE_PIN AA6 [get_ports {ADC_D[6]}]
set_property PACKAGE_PIN V7 [get_ports {ADC_D[7]}]
set_property PACKAGE_PIN W7 [get_ports {ADC_D[8]}]
set_property PACKAGE_PIN AB7 [get_ports {ADC_D[9]}]
set_property PACKAGE_PIN AB6 [get_ports {ADC_D[10]}]
set_property PACKAGE_PIN V9 [get_ports {ADC_D[11]}]
set_property PACKAGE_PIN V8 [get_ports {ADC_D[12]}]
set_property PACKAGE_PIN AA8 [get_ports {ADC_D[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_D*]
set_property PACKAGE_PIN AB8 [get_ports ADC_OVR]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_OVR]
set_property PACKAGE_PIN V4 [get_ports ADC_CLKOUT]
set_property IOSTANDARD LVCMOS25 [get_ports ADC_CLKOUT]
set_property PACKAGE_PIN Y8 [get_ports {ADC_RESET[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ADC_RESET[0]}]
set_property IOSTANDARD LVDS_25 [get_ports ADC_CLK_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports ADC_CLK_clk_n]
set_property PACKAGE_PIN Y3 [get_ports ADC_CLK_clk_p]
set_property PACKAGE_PIN AA3 [get_ports ADC_CLK_clk_n]

# DAC Interface
set_property PACKAGE_PIN T1 [get_ports {DAC_D[0]}]
set_property PACKAGE_PIN U1 [get_ports {DAC_D[1]}]
set_property PACKAGE_PIN U2 [get_ports {DAC_D[2]}]
set_property PACKAGE_PIN V2 [get_ports {DAC_D[3]}]
set_property PACKAGE_PIN R3 [get_ports {DAC_D[4]}]
set_property PACKAGE_PIN R2 [get_ports {DAC_D[5]}]
set_property PACKAGE_PIN W2 [get_ports {DAC_D[6]}]
set_property PACKAGE_PIN Y2 [get_ports {DAC_D[7]}]
set_property PACKAGE_PIN W1 [get_ports {DAC_D[8]}]
set_property PACKAGE_PIN Y1 [get_ports {DAC_D[9]}]
set_property PACKAGE_PIN U3 [get_ports {DAC_D[10]}]
set_property PACKAGE_PIN V3 [get_ports {DAC_D[11]}]
set_property PACKAGE_PIN AA1 [get_ports {DAC_D[12]}]
set_property PACKAGE_PIN AB1 [get_ports {DAC_D[13]}]
set_property PACKAGE_PIN AB3 [get_ports DAC_CLK]
set_property PACKAGE_PIN AB2 [get_ports DAC_SLEEP]
set_property IOSTANDARD LVCMOS25 [get_ports DAC_*]

# Ethernet
set_property PACKAGE_PIN H17 [get_ports MDIO_mdc]
set_property PACKAGE_PIN H15 [get_ports MDIO_mdio_io]
set_property IOSTANDARD LVCMOS25 [get_ports MDIO_*]
set_property PACKAGE_PIN G18 [get_ports RMII_crs_dv]
# Fake signal to unused pin
set_property PACKAGE_PIN H13 [get_ports RMII_rx_er]
set_property PULLDOWN true [get_ports RMII_rx_er]
set_property PACKAGE_PIN J14 [get_ports {RMII_rxd[0]}]
set_property PACKAGE_PIN H14 [get_ports {RMII_rxd[1]}]
set_property PACKAGE_PIN G17 [get_ports RMII_tx_en]
set_property PACKAGE_PIN G15 [get_ports {RMII_txd[0]}]
set_property PACKAGE_PIN G16 [get_ports {RMII_txd[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports RMII_*]

# FPGA_SPI
set_property PACKAGE_PIN Y4 [get_ports FPGA_SPI_io0_io]
set_property PACKAGE_PIN AA4 [get_ports FPGA_SPI_io1_io]
set_property PACKAGE_PIN W4 [get_ports FPGA_SPI_sck_io]
set_property PACKAGE_PIN AB5 [get_ports {FPGA_SPI_ss_io[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports FPGA_SPI_*]

# FPGA_SPI2
set_property PACKAGE_PIN T4 [get_ports FPGA_SPI2_MOSI]
set_property PACKAGE_PIN T5 [get_ports FPGA_SPI2_MISO]
set_property PACKAGE_PIN U5 [get_ports FPGA_SPI2_SCLK]
set_property PACKAGE_PIN R4 [get_ports FPGA_SPI2_SS]
set_property IOSTANDARD LVCMOS25 [get_ports FPGA_SPI2_*]

# UART
set_property PACKAGE_PIN M16 [get_ports UART_rxd]
set_property PACKAGE_PIN M17 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS25 [get_ports UART_*]

# LEDs
set_property PACKAGE_PIN N17 [get_ports {LED_USER_tri_o[0]}]
set_property PACKAGE_PIN V22 [get_ports {LED_USER_tri_o[1]}]
set_property PACKAGE_PIN T21 [get_ports {LED_USER_tri_o[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports LED_USER_tri_o*]

set_max_delay -from [get_clocks TOP_i/axi_ethernetlite_0/U0/phy_tx_clk] -to [get_clocks -of_objects [get_pins TOP_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1]] 10.000
