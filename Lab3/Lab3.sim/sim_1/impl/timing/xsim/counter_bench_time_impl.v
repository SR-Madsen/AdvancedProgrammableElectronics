// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 22 09:42:45 2022
// Host        : Ubuntu-ZBook-15-G2 running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/sebastian/Desktop/Git/AdvancedProgrammableElectronics/Lab3/Lab3.sim/sim_1/impl/timing/xsim/counter_bench_time_impl.v
// Design      : counter_top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a15tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module binary_cnt
   (Q,
    CLK,
    RESET_I);
  output [7:0]Q;
  input CLK;
  input RESET_I;

  wire CLK;
  wire [7:0]Q;
  wire RESET_I;
  wire [7:0]plusOp;
  wire \q[7]_i_2_n_0 ;

  LUT1 #(
    .INIT(2'h1)) 
    \q[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \q[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \q[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \q[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \q[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \q[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \q[6]_i_1 
       (.I0(\q[7]_i_2_n_0 ),
        .I1(Q[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \q[7]_i_1 
       (.I0(\q[7]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \q[7]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\q[7]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(plusOp[7]),
        .Q(Q[7]));
endmodule

(* ECO_CHECKSUM = "16a92de4" *) 
(* NotValidForBitStream *)
module counter_top
   (CLK_I,
    RESET_I,
    Q_BIN_O,
    Q_HOT_O,
    Q_RIP_O);
  input CLK_I;
  input RESET_I;
  output [7:0]Q_BIN_O;
  output [15:0]Q_HOT_O;
  output [7:0]Q_RIP_O;

  wire CLK_I;
  wire CLK_I_IBUF;
  wire CLK_I_IBUF_BUFG;
  wire [7:0]Q_BIN_O;
  wire [7:0]Q_BIN_O_OBUF;
  wire [15:0]Q_HOT_O;
  wire [7:0]Q_RIP_O;
  wire [7:0]Q_RIP_O_OBUF;
  wire RESET_I;
  wire RESET_I_IBUF;
  wire lopt;
  wire lopt_1;
  wire lopt_10;
  wire lopt_11;
  wire lopt_12;
  wire lopt_13;
  wire lopt_14;
  wire lopt_15;
  wire lopt_2;
  wire lopt_3;
  wire lopt_4;
  wire lopt_5;
  wire lopt_6;
  wire lopt_7;
  wire lopt_8;
  wire lopt_9;
  wire [15:0]NLW_U3_Q_UNCONNECTED;

initial begin
 $sdf_annotate("counter_bench_time_impl.sdf",,,,"tool_control");
end
  BUFG CLK_I_IBUF_BUFG_inst
       (.I(CLK_I_IBUF),
        .O(CLK_I_IBUF_BUFG));
  IBUF CLK_I_IBUF_inst
       (.I(CLK_I),
        .O(CLK_I_IBUF));
  OBUF \Q_BIN_O_OBUF[0]_inst 
       (.I(Q_BIN_O_OBUF[0]),
        .O(Q_BIN_O[0]));
  OBUF \Q_BIN_O_OBUF[1]_inst 
       (.I(Q_BIN_O_OBUF[1]),
        .O(Q_BIN_O[1]));
  OBUF \Q_BIN_O_OBUF[2]_inst 
       (.I(Q_BIN_O_OBUF[2]),
        .O(Q_BIN_O[2]));
  OBUF \Q_BIN_O_OBUF[3]_inst 
       (.I(Q_BIN_O_OBUF[3]),
        .O(Q_BIN_O[3]));
  OBUF \Q_BIN_O_OBUF[4]_inst 
       (.I(Q_BIN_O_OBUF[4]),
        .O(Q_BIN_O[4]));
  OBUF \Q_BIN_O_OBUF[5]_inst 
       (.I(Q_BIN_O_OBUF[5]),
        .O(Q_BIN_O[5]));
  OBUF \Q_BIN_O_OBUF[6]_inst 
       (.I(Q_BIN_O_OBUF[6]),
        .O(Q_BIN_O[6]));
  OBUF \Q_BIN_O_OBUF[7]_inst 
       (.I(Q_BIN_O_OBUF[7]),
        .O(Q_BIN_O[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[0]_inst 
       (.I(lopt),
        .O(Q_HOT_O[0]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[10]_inst 
       (.I(lopt_1),
        .O(Q_HOT_O[10]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[11]_inst 
       (.I(lopt_2),
        .O(Q_HOT_O[11]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[12]_inst 
       (.I(lopt_3),
        .O(Q_HOT_O[12]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[13]_inst 
       (.I(lopt_4),
        .O(Q_HOT_O[13]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[14]_inst 
       (.I(lopt_5),
        .O(Q_HOT_O[14]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[15]_inst 
       (.I(lopt_6),
        .O(Q_HOT_O[15]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[1]_inst 
       (.I(lopt_7),
        .O(Q_HOT_O[1]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[2]_inst 
       (.I(lopt_8),
        .O(Q_HOT_O[2]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[3]_inst 
       (.I(lopt_9),
        .O(Q_HOT_O[3]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[4]_inst 
       (.I(lopt_10),
        .O(Q_HOT_O[4]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[5]_inst 
       (.I(lopt_11),
        .O(Q_HOT_O[5]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[6]_inst 
       (.I(lopt_12),
        .O(Q_HOT_O[6]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[7]_inst 
       (.I(lopt_13),
        .O(Q_HOT_O[7]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[8]_inst 
       (.I(lopt_14),
        .O(Q_HOT_O[8]));
  (* OPT_MODIFIED = "SWEEP" *) 
  OBUF \Q_HOT_O_OBUF[9]_inst 
       (.I(lopt_15),
        .O(Q_HOT_O[9]));
  OBUF \Q_RIP_O_OBUF[0]_inst 
       (.I(Q_RIP_O_OBUF[0]),
        .O(Q_RIP_O[0]));
  OBUF \Q_RIP_O_OBUF[1]_inst 
       (.I(Q_RIP_O_OBUF[1]),
        .O(Q_RIP_O[1]));
  OBUF \Q_RIP_O_OBUF[2]_inst 
       (.I(Q_RIP_O_OBUF[2]),
        .O(Q_RIP_O[2]));
  OBUF \Q_RIP_O_OBUF[3]_inst 
       (.I(Q_RIP_O_OBUF[3]),
        .O(Q_RIP_O[3]));
  OBUF \Q_RIP_O_OBUF[4]_inst 
       (.I(Q_RIP_O_OBUF[4]),
        .O(Q_RIP_O[4]));
  OBUF \Q_RIP_O_OBUF[5]_inst 
       (.I(Q_RIP_O_OBUF[5]),
        .O(Q_RIP_O[5]));
  OBUF \Q_RIP_O_OBUF[6]_inst 
       (.I(Q_RIP_O_OBUF[6]),
        .O(Q_RIP_O[6]));
  OBUF \Q_RIP_O_OBUF[7]_inst 
       (.I(Q_RIP_O_OBUF[7]),
        .O(Q_RIP_O[7]));
  IBUF RESET_I_IBUF_inst
       (.I(RESET_I),
        .O(RESET_I_IBUF));
  binary_cnt U1
       (.CLK(CLK_I_IBUF_BUFG),
        .Q(Q_BIN_O_OBUF),
        .RESET_I(RESET_I_IBUF));
  ripple_cnt U2
       (.Q_RIP_O(Q_RIP_O_OBUF),
        .RESET_I(RESET_I_IBUF),
        .nclk(CLK_I_IBUF_BUFG));
  onehot_cnt U3
       (.CLK_I(CLK_I_IBUF_BUFG),
        .Q(NLW_U3_Q_UNCONNECTED[15:0]),
        .RESET_I(RESET_I_IBUF),
        .lopt(lopt),
        .lopt_1(lopt_1),
        .lopt_10(lopt_10),
        .lopt_11(lopt_11),
        .lopt_12(lopt_12),
        .lopt_13(lopt_13),
        .lopt_14(lopt_14),
        .lopt_15(lopt_15),
        .lopt_2(lopt_2),
        .lopt_3(lopt_3),
        .lopt_4(lopt_4),
        .lopt_5(lopt_5),
        .lopt_6(lopt_6),
        .lopt_7(lopt_7),
        .lopt_8(lopt_8),
        .lopt_9(lopt_9));
endmodule

module onehot_cnt
   (Q,
    CLK_I,
    RESET_I,
    lopt,
    lopt_1,
    lopt_2,
    lopt_3,
    lopt_4,
    lopt_5,
    lopt_6,
    lopt_7,
    lopt_8,
    lopt_9,
    lopt_10,
    lopt_11,
    lopt_12,
    lopt_13,
    lopt_14,
    lopt_15);
  output [15:0]Q;
  input CLK_I;
  input RESET_I;
  output lopt;
  output lopt_1;
  output lopt_2;
  output lopt_3;
  output lopt_4;
  output lopt_5;
  output lopt_6;
  output lopt_7;
  output lopt_8;
  output lopt_9;
  output lopt_10;
  output lopt_11;
  output lopt_12;
  output lopt_13;
  output lopt_14;
  output lopt_15;

  wire CLK_I;
  wire [15:0]Q;
  wire RESET_I;
  wire \q_reg[0]_lopt_replica_1 ;
  wire \q_reg[10]_lopt_replica_1 ;
  wire \q_reg[11]_lopt_replica_1 ;
  wire \q_reg[12]_lopt_replica_1 ;
  wire \q_reg[13]_lopt_replica_1 ;
  wire \q_reg[14]_lopt_replica_1 ;
  wire \q_reg[15]_lopt_replica_1 ;
  wire \q_reg[1]_lopt_replica_1 ;
  wire \q_reg[2]_lopt_replica_1 ;
  wire \q_reg[3]_lopt_replica_1 ;
  wire \q_reg[4]_lopt_replica_1 ;
  wire \q_reg[5]_lopt_replica_1 ;
  wire \q_reg[6]_lopt_replica_1 ;
  wire \q_reg[7]_lopt_replica_1 ;
  wire \q_reg[8]_lopt_replica_1 ;
  wire \q_reg[9]_lopt_replica_1 ;

  assign lopt = \q_reg[0]_lopt_replica_1 ;
  assign lopt_1 = \q_reg[10]_lopt_replica_1 ;
  assign lopt_10 = \q_reg[4]_lopt_replica_1 ;
  assign lopt_11 = \q_reg[5]_lopt_replica_1 ;
  assign lopt_12 = \q_reg[6]_lopt_replica_1 ;
  assign lopt_13 = \q_reg[7]_lopt_replica_1 ;
  assign lopt_14 = \q_reg[8]_lopt_replica_1 ;
  assign lopt_15 = \q_reg[9]_lopt_replica_1 ;
  assign lopt_2 = \q_reg[11]_lopt_replica_1 ;
  assign lopt_3 = \q_reg[12]_lopt_replica_1 ;
  assign lopt_4 = \q_reg[13]_lopt_replica_1 ;
  assign lopt_5 = \q_reg[14]_lopt_replica_1 ;
  assign lopt_6 = \q_reg[15]_lopt_replica_1 ;
  assign lopt_7 = \q_reg[1]_lopt_replica_1 ;
  assign lopt_8 = \q_reg[2]_lopt_replica_1 ;
  assign lopt_9 = \q_reg[3]_lopt_replica_1 ;
  FDPE #(
    .INIT(1'b1)) 
    \q_reg[0] 
       (.C(CLK_I),
        .CE(1'b1),
        .D(Q[15]),
        .PRE(RESET_I),
        .Q(Q[0]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDPE #(
    .INIT(1'b1)) 
    \q_reg[0]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .D(Q[15]),
        .PRE(RESET_I),
        .Q(\q_reg[0]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[10] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[9]),
        .Q(Q[10]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[10]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[9]),
        .Q(\q_reg[10]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[11] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[10]),
        .Q(Q[11]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[11]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[10]),
        .Q(\q_reg[11]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[12] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[11]),
        .Q(Q[12]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[12]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[11]),
        .Q(\q_reg[12]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[13] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[12]),
        .Q(Q[13]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[13]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[12]),
        .Q(\q_reg[13]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[14] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[13]),
        .Q(Q[14]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[14]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[13]),
        .Q(\q_reg[14]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[15] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[14]),
        .Q(Q[15]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[15]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[14]),
        .Q(\q_reg[15]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[0]),
        .Q(Q[1]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[1]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[0]),
        .Q(\q_reg[1]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[1]),
        .Q(Q[2]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[2]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[1]),
        .Q(\q_reg[2]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[2]),
        .Q(Q[3]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[3]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[2]),
        .Q(\q_reg[3]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[3]),
        .Q(Q[4]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[4]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[3]),
        .Q(\q_reg[4]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[4]),
        .Q(Q[5]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[5]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[4]),
        .Q(\q_reg[5]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[5]),
        .Q(Q[6]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[6]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[5]),
        .Q(\q_reg[6]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[6]),
        .Q(Q[7]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[7]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[6]),
        .Q(\q_reg[7]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[8] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[7]),
        .Q(Q[8]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[8]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[7]),
        .Q(\q_reg[8]_lopt_replica_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[9] 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[8]),
        .Q(Q[9]));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  FDCE #(
    .INIT(1'b0)) 
    \q_reg[9]_lopt_replica 
       (.C(CLK_I),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(Q[8]),
        .Q(\q_reg[9]_lopt_replica_1 ));
endmodule

module ripple_cnt
   (Q_RIP_O,
    nclk,
    RESET_I);
  output [7:0]Q_RIP_O;
  input nclk;
  input RESET_I;

  wire [7:0]Q_RIP_O;
  wire RESET_I;
  wire nclk;
  wire p_0_in;
  wire p_0_in1_in;
  wire \q[2]_i_1__0_n_0 ;
  wire \q[3]_i_1__0_n_0 ;
  wire \q[4]_i_1__0_n_0 ;
  wire \q[5]_i_1__0_n_0 ;
  wire \q[6]_i_1__0_n_0 ;
  wire \q[7]_i_1__0_n_0 ;

  LUT1 #(
    .INIT(2'h1)) 
    \q[0]_i_1__0 
       (.I0(Q_RIP_O[0]),
        .O(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \q[1]_i_1__0 
       (.I0(Q_RIP_O[1]),
        .O(p_0_in1_in));
  LUT1 #(
    .INIT(2'h1)) 
    \q[2]_i_1__0 
       (.I0(Q_RIP_O[2]),
        .O(\q[2]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \q[3]_i_1__0 
       (.I0(Q_RIP_O[3]),
        .O(\q[3]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \q[4]_i_1__0 
       (.I0(Q_RIP_O[4]),
        .O(\q[4]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \q[5]_i_1__0 
       (.I0(Q_RIP_O[5]),
        .O(\q[5]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \q[6]_i_1__0 
       (.I0(Q_RIP_O[6]),
        .O(\q[6]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \q[7]_i_1__0 
       (.I0(Q_RIP_O[7]),
        .O(\q[7]_i_1__0_n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0)) 
    \q_reg[0] 
       (.C(nclk),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(p_0_in),
        .Q(Q_RIP_O[0]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[1] 
       (.C(Q_RIP_O[0]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(p_0_in1_in),
        .Q(Q_RIP_O[1]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[2] 
       (.C(Q_RIP_O[1]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[2]_i_1__0_n_0 ),
        .Q(Q_RIP_O[2]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[3] 
       (.C(Q_RIP_O[2]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[3]_i_1__0_n_0 ),
        .Q(Q_RIP_O[3]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[4] 
       (.C(Q_RIP_O[3]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[4]_i_1__0_n_0 ),
        .Q(Q_RIP_O[4]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[5] 
       (.C(Q_RIP_O[4]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[5]_i_1__0_n_0 ),
        .Q(Q_RIP_O[5]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[6] 
       (.C(Q_RIP_O[5]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[6]_i_1__0_n_0 ),
        .Q(Q_RIP_O[6]));
  FDCE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \q_reg[7] 
       (.C(Q_RIP_O[6]),
        .CE(1'b1),
        .CLR(RESET_I),
        .D(\q[7]_i_1__0_n_0 ),
        .Q(Q_RIP_O[7]));
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
