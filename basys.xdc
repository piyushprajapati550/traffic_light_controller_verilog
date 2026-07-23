## =========================
## CLOCK (100 MHz)
## =========================
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 [get_ports clk]


## =========================
## RESET BUTTON (Center Button)
## =========================
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]


## =========================
## TRAFFIC LIGHT M1
## =========================
set_property PACKAGE_PIN U16 [get_ports {light_M1[0]}]
set_property PACKAGE_PIN E19 [get_ports {light_M1[1]}]
set_property PACKAGE_PIN U19 [get_ports {light_M1[2]}]


## =========================
## TRAFFIC LIGHT M2
## =========================
set_property PACKAGE_PIN V19 [get_ports {light_M2[0]}]
set_property PACKAGE_PIN W18 [get_ports {light_M2[1]}]
set_property PACKAGE_PIN U15 [get_ports {light_M2[2]}]


## =========================
## TRAFFIC LIGHT MT
## =========================
set_property PACKAGE_PIN U14 [get_ports {light_MT[0]}]
set_property PACKAGE_PIN V14 [get_ports {light_MT[1]}]
set_property PACKAGE_PIN V13 [get_ports {light_MT[2]}]


## =========================
## TRAFFIC LIGHT S
## =========================
set_property PACKAGE_PIN V3 [get_ports {light_S[0]}]
set_property PACKAGE_PIN W3 [get_ports {light_S[1]}]
set_property PACKAGE_PIN U3 [get_ports {light_S[2]}]


## =========================
## IOSTANDARD FOR ALL LIGHTS
## =========================
set_property IOSTANDARD LVCMOS33 [get_ports {light_M1[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light_M2[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light_MT[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {light_S[*]}]
