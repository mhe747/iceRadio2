create_project project_1 project_1 -part xc7a100tfgg484-2 -force
set_property target_language VHDL [current_project]
set_property  ip_repo_paths  ip_lib [current_project]
update_ip_catalog
source TOP.tcl
start_gui
update_compile_order -fileset sources_1
make_wrapper -files [get_files [pwd]/project_1/project_1.srcs/sources_1/bd/TOP/TOP.bd] -top
add_files -norecurse [pwd]/project_1/project_1.srcs/sources_1/bd/TOP/hdl/TOP_wrapper.vhd
add_files -fileset constrs_1 -norecurse [pwd]/constraints/top.xdc
