#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Mon Feb 28 21:45:50 CET 2022
# SW Build 2902540 on Wed May 27 19:54:35 MDT 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xsim uart_tx_time_synth -key {Post-Synthesis:sim_1:Timing:uart_tx} -tclbatch uart_tx.tcl -log simulate.log"
xsim uart_tx_time_synth -key {Post-Synthesis:sim_1:Timing:uart_tx} -tclbatch uart_tx.tcl -log simulate.log

