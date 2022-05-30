#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon May 30 09:04:31 CEST 2022
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 604ddc9e5e814cbd8e128beed78a136a --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot data_controller_behav xil_defaultlib.data_controller xil_defaultlib.glbl -log elaborate.log"
xelab -wto 604ddc9e5e814cbd8e128beed78a136a --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot data_controller_behav xil_defaultlib.data_controller xil_defaultlib.glbl -log elaborate.log

