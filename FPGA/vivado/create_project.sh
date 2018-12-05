#!/bin/sh

export VIVADO_PATH=/home/matthias/Xilinx/Vivado/2018.2/
source $VIVADO_PATH/settings64.sh
vivado -mode batch -source create_project.tcl

