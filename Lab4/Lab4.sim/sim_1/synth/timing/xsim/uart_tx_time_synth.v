// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Feb 28 21:45:44 2022
// Host        : Ubuntu-ZBook-15-G2 running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/sebastian/Desktop/Git/AdvancedProgrammableElectronics/Lab4/Lab4.sim/sim_1/synth/timing/xsim/uart_tx_time_synth.v
// Design      : lab4_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a15tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module lab4_top
   (CLK_I,
    UART_RX_I,
    UART_TX_O);
  input CLK_I;
  input UART_RX_I;
  output UART_TX_O;

  wire CLK_I;
  wire CLK_I_IBUF;
  wire READY;
  wire TX_DONE;
  wire UART_TX_O;
  wire UART_TX_O_OBUF;
  wire baud_clock;
  wire clk16;
  wire comm_master_n_1;
  wire tx_slave_n_3;
  wire tx_slave_n_4;
  wire tx_slave_n_5;
  wire tx_slave_n_6;
  wire tx_slave_n_7;
  wire tx_slave_n_8;
  wire tx_slave_n_9;

initial begin
 $sdf_annotate("uart_tx_time_synth.sdf",,,,"tool_control");
end
  IBUF CLK_I_IBUF_inst
       (.I(CLK_I),
        .O(CLK_I_IBUF));
  OBUF UART_TX_O_OBUF_inst
       (.I(UART_TX_O_OBUF),
        .O(UART_TX_O));
  mmcm clock
       (.CLK(clk16),
        .CLK_I_IBUF(CLK_I_IBUF));
  uart_master comm_master
       (.E(TX_DONE),
        .\FSM_onehot_state_reg[9]_0 (comm_master_n_1),
        .Q(baud_clock),
        .READY(READY),
        .TX_reg(tx_slave_n_9),
        .TX_reg_0(tx_slave_n_5),
        .TX_reg_1(tx_slave_n_4),
        .TX_reg_2(tx_slave_n_3),
        .TX_reg_3(tx_slave_n_8),
        .TX_reg_4(tx_slave_n_7),
        .TX_reg_5(tx_slave_n_6));
  uart_tx tx_slave
       (.CLK(clk16),
        .E(TX_DONE),
        .\FSM_onehot_state_reg[1]_0 (tx_slave_n_3),
        .\FSM_onehot_state_reg[2]_0 (tx_slave_n_4),
        .\FSM_onehot_state_reg[3]_0 (tx_slave_n_5),
        .\FSM_onehot_state_reg[4]_0 (tx_slave_n_6),
        .\FSM_onehot_state_reg[5]_0 (tx_slave_n_7),
        .\FSM_onehot_state_reg[7]_0 (tx_slave_n_8),
        .\FSM_onehot_state_reg[9]_0 (tx_slave_n_9),
        .READY(READY),
        .TX_reg_0(comm_master_n_1),
        .UART_TX_O_OBUF(UART_TX_O_OBUF),
        .out(baud_clock));
endmodule

module mmcm
   (CLK,
    CLK_I_IBUF);
  output CLK;
  input CLK_I_IBUF;

  wire CLK;
  wire CLK_I_IBUF;
  wire clk_feedback;
  wire NLW_MMCME2_BASE_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT1_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT2_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT3_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT4_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT5_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_CLKOUT6_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_DRDY_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_LOCKED_UNCONNECTED;
  wire NLW_MMCME2_BASE_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_MMCME2_BASE_inst_DO_UNCONNECTED;

  (* XILINX_LEGACY_PRIM = "MMCME2_BASE" *) 
  (* box_type = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(64.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(83.330000),
    .CLKIN2_PERIOD(10.000000),
    .CLKOUT0_DIVIDE_F(1.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.000000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    MMCME2_BASE_inst
       (.CLKFBIN(clk_feedback),
        .CLKFBOUT(clk_feedback),
        .CLKFBOUTB(NLW_MMCME2_BASE_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_MMCME2_BASE_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(CLK_I_IBUF),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_MMCME2_BASE_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(CLK),
        .CLKOUT0B(NLW_MMCME2_BASE_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_MMCME2_BASE_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_MMCME2_BASE_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_MMCME2_BASE_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_MMCME2_BASE_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_MMCME2_BASE_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_MMCME2_BASE_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_MMCME2_BASE_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_MMCME2_BASE_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_MMCME2_BASE_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_MMCME2_BASE_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_MMCME2_BASE_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_MMCME2_BASE_inst_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_MMCME2_BASE_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule

module uart_master
   (READY,
    \FSM_onehot_state_reg[9]_0 ,
    E,
    Q,
    TX_reg,
    TX_reg_0,
    TX_reg_1,
    TX_reg_2,
    TX_reg_3,
    TX_reg_4,
    TX_reg_5);
  output READY;
  output \FSM_onehot_state_reg[9]_0 ;
  input [0:0]E;
  input [0:0]Q;
  input TX_reg;
  input TX_reg_0;
  input TX_reg_1;
  input TX_reg_2;
  input TX_reg_3;
  input TX_reg_4;
  input TX_reg_5;

  wire [6:0]DATA_OUT;
  wire \DATA_OUT[3]_i_2_n_0 ;
  wire \DATA_OUT[6]_i_2_n_0 ;
  wire [0:0]E;
  wire \FSM_onehot_state_reg[9]_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[10] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire \FSM_onehot_state_reg_n_0_[7] ;
  wire \FSM_onehot_state_reg_n_0_[8] ;
  wire \FSM_onehot_state_reg_n_0_[9] ;
  wire [0:0]Q;
  wire READY;
  wire [6:0]TX_DATA;
  wire TX_i_2_n_0;
  wire TX_i_3_n_0;
  wire TX_reg;
  wire TX_reg_0;
  wire TX_reg_1;
  wire TX_reg_2;
  wire TX_reg_3;
  wire TX_reg_4;
  wire TX_reg_5;

  LUT4 #(
    .INIT(16'hFFFE)) 
    \DATA_OUT[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(\FSM_onehot_state_reg_n_0_[1] ),
        .O(DATA_OUT[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \DATA_OUT[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[7] ),
        .I1(\FSM_onehot_state_reg_n_0_[5] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .I3(\FSM_onehot_state_reg_n_0_[6] ),
        .I4(\FSM_onehot_state_reg_n_0_[10] ),
        .O(DATA_OUT[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \DATA_OUT[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\DATA_OUT[6]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(\FSM_onehot_state_reg_n_0_[8] ),
        .O(DATA_OUT[2]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \DATA_OUT[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[8] ),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(\DATA_OUT[3]_i_2_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_state_reg_n_0_[10] ),
        .O(DATA_OUT[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \DATA_OUT[3]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\DATA_OUT[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \DATA_OUT[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_state_reg_n_0_[7] ),
        .O(DATA_OUT[4]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \DATA_OUT[6]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\DATA_OUT[6]_i_2_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[7] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[8] ),
        .O(DATA_OUT[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \DATA_OUT[6]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .I4(\FSM_onehot_state_reg_n_0_[6] ),
        .O(\DATA_OUT[6]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[0] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[0]),
        .Q(TX_DATA[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[1] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[1]),
        .Q(TX_DATA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[2] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[2]),
        .Q(TX_DATA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[3] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[3]),
        .Q(TX_DATA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[4] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[4]),
        .Q(TX_DATA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DATA_OUT_reg[6] 
       (.C(Q),
        .CE(E),
        .D(DATA_OUT[6]),
        .Q(TX_DATA[6]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[10] ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[10] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[9] ),
        .Q(\FSM_onehot_state_reg_n_0_[10] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[1] ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[2] ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(\FSM_onehot_state_reg_n_0_[6] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[6] ),
        .Q(\FSM_onehot_state_reg_n_0_[7] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[8] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[7] ),
        .Q(\FSM_onehot_state_reg_n_0_[8] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "byte4:00000001000,byte5:00000010000,byte3:00000000100,byte11:10000000000,byte2:00000000010,byte1:00000000001,byte10:01000000000,byte8:00010000000,byte9:00100000000,byte7:00001000000,byte6:00000100000" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[9] 
       (.C(Q),
        .CE(E),
        .D(\FSM_onehot_state_reg_n_0_[8] ),
        .Q(\FSM_onehot_state_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    TX_READY_reg
       (.C(Q),
        .CE(1'b1),
        .D(E),
        .Q(READY),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hFE)) 
    TX_i_1
       (.I0(TX_reg),
        .I1(TX_i_2_n_0),
        .I2(TX_i_3_n_0),
        .O(\FSM_onehot_state_reg[9]_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    TX_i_2
       (.I0(TX_DATA[6]),
        .I1(TX_reg_3),
        .I2(TX_DATA[4]),
        .I3(TX_reg_4),
        .I4(TX_reg_5),
        .I5(TX_DATA[3]),
        .O(TX_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    TX_i_3
       (.I0(TX_DATA[2]),
        .I1(TX_reg_0),
        .I2(TX_DATA[1]),
        .I3(TX_reg_1),
        .I4(TX_reg_2),
        .I5(TX_DATA[0]),
        .O(TX_i_3_n_0));
endmodule

module uart_tx
   (UART_TX_O_OBUF,
    out,
    E,
    \FSM_onehot_state_reg[1]_0 ,
    \FSM_onehot_state_reg[2]_0 ,
    \FSM_onehot_state_reg[3]_0 ,
    \FSM_onehot_state_reg[4]_0 ,
    \FSM_onehot_state_reg[5]_0 ,
    \FSM_onehot_state_reg[7]_0 ,
    \FSM_onehot_state_reg[9]_0 ,
    TX_reg_0,
    READY,
    CLK);
  output UART_TX_O_OBUF;
  output [0:0]out;
  output [0:0]E;
  output \FSM_onehot_state_reg[1]_0 ;
  output \FSM_onehot_state_reg[2]_0 ;
  output \FSM_onehot_state_reg[3]_0 ;
  output \FSM_onehot_state_reg[4]_0 ;
  output \FSM_onehot_state_reg[5]_0 ;
  output \FSM_onehot_state_reg[7]_0 ;
  output \FSM_onehot_state_reg[9]_0 ;
  input TX_reg_0;
  input READY;
  input CLK;

  wire CLK;
  wire DONE_i_1_n_0;
  wire [0:0]E;
  wire \FSM_onehot_state[9]_i_1_n_0 ;
  wire \FSM_onehot_state[9]_i_2_n_0 ;
  wire \FSM_onehot_state_reg[1]_0 ;
  wire \FSM_onehot_state_reg[2]_0 ;
  wire \FSM_onehot_state_reg[3]_0 ;
  wire \FSM_onehot_state_reg[4]_0 ;
  wire \FSM_onehot_state_reg[5]_0 ;
  wire \FSM_onehot_state_reg[7]_0 ;
  wire \FSM_onehot_state_reg[9]_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire \FSM_onehot_state_reg_n_0_[8] ;
  wire READY;
  wire TX_reg_0;
  wire UART_TX_O_OBUF;
  wire \baud_counter_reg_n_0_[0] ;
  wire \baud_counter_reg_n_0_[1] ;
  wire \baud_counter_reg_n_0_[2] ;
  wire [0:0]out;
  wire [3:0]plusOp;

  LUT4 #(
    .INIT(16'hF7F0)) 
    DONE_i_1
       (.I0(READY),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg[9]_0 ),
        .I3(E),
        .O(DONE_i_1_n_0));
  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    DONE_reg
       (.C(out),
        .CE(1'b1),
        .D(DONE_i_1_n_0),
        .Q(E),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_state[9]_i_1 
       (.I0(\FSM_onehot_state_reg[1]_0 ),
        .I1(\FSM_onehot_state_reg[2]_0 ),
        .I2(\FSM_onehot_state_reg[3]_0 ),
        .I3(\FSM_onehot_state_reg[4]_0 ),
        .I4(\FSM_onehot_state_reg[5]_0 ),
        .I5(\FSM_onehot_state[9]_i_2_n_0 ),
        .O(\FSM_onehot_state[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFEEE)) 
    \FSM_onehot_state[9]_i_2 
       (.I0(\FSM_onehot_state_reg[7]_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[6] ),
        .I2(READY),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_state_reg[9]_0 ),
        .I5(\FSM_onehot_state_reg_n_0_[8] ),
        .O(\FSM_onehot_state[9]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[9]_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[0] ),
        .Q(\FSM_onehot_state_reg[1]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[2] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[1]_0 ),
        .Q(\FSM_onehot_state_reg[2]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[3] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[2]_0 ),
        .Q(\FSM_onehot_state_reg[3]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[4] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[3]_0 ),
        .Q(\FSM_onehot_state_reg[4]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[5] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[4]_0 ),
        .Q(\FSM_onehot_state_reg[5]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[6] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[5]_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[6] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[7] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[6] ),
        .Q(\FSM_onehot_state_reg[7]_0 ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[8] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg[7]_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[8] ),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "bit1:0000001000,bit2:0000010000,bit0:0000000100,start:0000000010,stop:0000000001,bit7:1000000000,bit5:0010000000,bit4:0001000000,bit6:0100000000,bit3:0000100000" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[9] 
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[8] ),
        .Q(\FSM_onehot_state_reg[9]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    TX_reg
       (.C(out),
        .CE(\FSM_onehot_state[9]_i_1_n_0 ),
        .D(TX_reg_0),
        .Q(UART_TX_O_OBUF),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \baud_counter[0]_i_1 
       (.I0(\baud_counter_reg_n_0_[0] ),
        .O(plusOp[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \baud_counter[1]_i_1 
       (.I0(\baud_counter_reg_n_0_[0] ),
        .I1(\baud_counter_reg_n_0_[1] ),
        .O(plusOp[1]));
  LUT3 #(
    .INIT(8'h78)) 
    \baud_counter[2]_i_1 
       (.I0(\baud_counter_reg_n_0_[0] ),
        .I1(\baud_counter_reg_n_0_[1] ),
        .I2(\baud_counter_reg_n_0_[2] ),
        .O(plusOp[2]));
  LUT4 #(
    .INIT(16'h7F80)) 
    \baud_counter[3]_i_1 
       (.I0(\baud_counter_reg_n_0_[1] ),
        .I1(\baud_counter_reg_n_0_[0] ),
        .I2(\baud_counter_reg_n_0_[2] ),
        .I3(out),
        .O(plusOp[3]));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp[0]),
        .Q(\baud_counter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(\baud_counter_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(\baud_counter_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \baud_counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(out),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
