
T
Command: %s
53*	vivadotcl2#
phys_opt_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a15t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a15t2default:defaultZ17-349h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2851.8672default:default2
0.0002default:default2
78542default:default2
129092default:defaultZ17-722h px? 
a

Starting %s Task
103*constraints2&
Physical Synthesis2default:defaultZ18-103h px? 
?

Phase %s%s
101*constraints2
1 2default:default25
!Physical Synthesis Initialization2default:defaultZ18-101h px? 
?
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
82default:defaultZ32-721h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.2402default:default2
-45.3132default:defaultZ32-619h px? 
U
@Phase 1 Physical Synthesis Initialization | Checksum: 12a935e99
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.56 ; elapsed = 00:00:00.43 . Memory (MB): peak = 2851.867 ; gain = 0.000 ; free physical = 7854 ; free virtual = 129082default:defaulth px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.2402default:default2
-45.3132default:defaultZ32-619h px? 
z

Phase %s%s
101*constraints2
2 2default:default2-
DSP Register Optimization2default:defaultZ18-101h px? 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
M
8Phase 2 DSP Register Optimization | Checksum: 12a935e99
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.69 ; elapsed = 00:00:00.83 . Memory (MB): peak = 2851.867 ; gain = 0.000 ; free physical = 7853 ; free virtual = 129082default:defaulth px? 
{

Phase %s%s
101*constraints2
3 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.2402default:default2
-45.3132default:defaultZ32-619h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
dvid_1/TDMS_encoder_red/Q[3]dvid_1/TDMS_encoder_red/Q[3]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth22
count_reg[22]count_reg[22]2default:default22
count_reg[22]	count_reg[22]2default:default8Z32-662h px? 
?
'Processed net %s. Replicated %s times.
81*physynth22
count_reg[22]count_reg[22]2default:default2
22default:default8Z32-81h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth22
count_reg[22]count_reg[22]2default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.2192default:default2
-43.3112default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default2B
count_reg[22]_replica	count_reg[22]_replica2default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default2N
Inst_vga_gen/dc_bias[3]_i_3	Inst_vga_gen/dc_bias[3]_i_32default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-572h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.1412default:default2
-43.1862default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2^
#Inst_vga_gen/dc_bias[3]_i_14__1_n_0#Inst_vga_gen/dc_bias[3]_i_14__1_n_02default:default2V
Inst_vga_gen/dc_bias[3]_i_14__1	Inst_vga_gen/dc_bias[3]_i_14__12default:default8Z32-662h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2^
#Inst_vga_gen/dc_bias[3]_i_14__1_n_0#Inst_vga_gen/dc_bias[3]_i_14__1_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.1112default:default2
-43.1562default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2^
#Inst_vga_gen/dc_bias[3]_i_14__1_n_0#Inst_vga_gen/dc_bias[3]_i_14__1_n_02default:default2V
Inst_vga_gen/dc_bias[3]_i_14__1	Inst_vga_gen/dc_bias[3]_i_14__12default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2^
#Inst_vga_gen/dc_bias[3]_i_14__1_n_0#Inst_vga_gen/dc_bias[3]_i_14__1_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default2P
Inst_vga_gen/dc_bias[2]_i_10	Inst_vga_gen/dc_bias[2]_i_102default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.1062default:default2
-43.0112default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_15_n_0 Inst_vga_gen/dc_bias[3]_i_15_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_15	Inst_vga_gen/dc_bias[3]_i_152default:default8Z32-662h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[3]_i_15_n_0 Inst_vga_gen/dc_bias[3]_i_15_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0962default:default2
-42.9622default:defaultZ32-619h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
dvid_1/TDMS_encoder_red/Q[2]dvid_1/TDMS_encoder_red/Q[2]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[2]_i_2_n_0Inst_vga_gen/dc_bias[2]_i_2_n_02default:default2N
Inst_vga_gen/dc_bias[2]_i_2	Inst_vga_gen/dc_bias[2]_i_22default:default8Z32-662h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2V
Inst_vga_gen/dc_bias[2]_i_2_n_0Inst_vga_gen/dc_bias[2]_i_2_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0572default:default2
-42.7302default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
'Processed net %s. Replicated %s times.
81*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2
12default:default8Z32-81h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0512default:default2
-42.9502default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-572h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0442default:default2
-42.9432default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[3]_i_2_n_0Inst_vga_gen/dc_bias[3]_i_2_n_02default:default2N
Inst_vga_gen/dc_bias[3]_i_2	Inst_vga_gen/dc_bias[3]_i_22default:default8Z32-662h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2V
Inst_vga_gen/dc_bias[3]_i_2_n_0Inst_vga_gen/dc_bias[3]_i_2_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0442default:default2
-42.9182default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[2]_i_2_n_0Inst_vga_gen/dc_bias[2]_i_2_n_02default:default2N
Inst_vga_gen/dc_bias[2]_i_2	Inst_vga_gen/dc_bias[2]_i_22default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/dc_bias[2]_i_2_n_0Inst_vga_gen/dc_bias[2]_i_2_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2b
%Inst_vga_gen/dc_bias[3]_i_16_n_0_repN%Inst_vga_gen/dc_bias[3]_i_16_n_0_repN2default:default2`
$Inst_vga_gen/dc_bias[3]_i_16_replica	$Inst_vga_gen/dc_bias[3]_i_16_replica2default:default8Z32-662h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2b
%Inst_vga_gen/dc_bias[3]_i_16_n_0_repN%Inst_vga_gen/dc_bias[3]_i_16_n_0_repN2default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.0192default:default2
-42.7392default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default2P
Inst_vga_gen/dc_bias[2]_i_10	Inst_vga_gen/dc_bias[2]_i_102default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default2N
Inst_vga_gen/dc_bias[3]_i_5	Inst_vga_gen/dc_bias[3]_i_52default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_19	Inst_vga_gen/dc_bias[3]_i_192default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-572h px? 
?
;Processed net %s. Optimization improves timing on the net.
394*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-735h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-1.9372default:default2
-41.6732default:defaultZ32-619h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_19	Inst_vga_gen/dc_bias[3]_i_192default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/count_reg[27]_1[2]Inst_vga_gen/count_reg[27]_1[2]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
Inst_vga_gen/e[1]_i_5_n_0Inst_vga_gen/e[1]_i_5_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2:
Inst_vga_gen/D[3]Inst_vga_gen/D[3]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
CLK24MHZ_IBUFCLK24MHZ_IBUF2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
CLK24MHZCLK24MHZ2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default2H
dvid_1/shift_blue_reg[8]	dvid_1/shift_blue_reg[8]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,clock_eng_1280_720B/clock_x5pixel_unbuffered,clock_eng_1280_720B/clock_x5pixel_unbuffered2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default2F
dvid_1/shift_red[9]_i_2	dvid_1/shift_red[9]_i_22default:default8Z32-662h px? 
?
5Processed net %s. Rewiring did not optimize the net.
134*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-134h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default2F
dvid_1/shift_red[9]_i_1	dvid_1/shift_red[9]_i_12default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default2J
dvid_1/shift_clock_reg[9]	dvid_1/shift_clock_reg[9]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
dvid_1/TDMS_encoder_red/Q[3]dvid_1/TDMS_encoder_red/Q[3]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default2B
count_reg[22]_replica	count_reg[22]_replica2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default2N
Inst_vga_gen/dc_bias[3]_i_3	Inst_vga_gen/dc_bias[3]_i_32default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default2P
Inst_vga_gen/dc_bias[2]_i_10	Inst_vga_gen/dc_bias[2]_i_102default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default2N
Inst_vga_gen/dc_bias[3]_i_5	Inst_vga_gen/dc_bias[3]_i_52default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_19	Inst_vga_gen/dc_bias[3]_i_192default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/count_reg[27]_1[2]Inst_vga_gen/count_reg[27]_1[2]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
Inst_vga_gen/e[1]_i_5_n_0Inst_vga_gen/e[1]_i_5_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2:
Inst_vga_gen/D[3]Inst_vga_gen/D[3]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
CLK24MHZ_IBUFCLK24MHZ_IBUF2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
CLK24MHZCLK24MHZ2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default2H
dvid_1/shift_blue_reg[8]	dvid_1/shift_blue_reg[8]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,clock_eng_1280_720B/clock_x5pixel_unbuffered,clock_eng_1280_720B/clock_x5pixel_unbuffered2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default2F
dvid_1/shift_red[9]_i_2	dvid_1/shift_red[9]_i_22default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default2F
dvid_1/shift_red[9]_i_1	dvid_1/shift_red[9]_i_12default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default2J
dvid_1/shift_clock_reg[9]	dvid_1/shift_clock_reg[9]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default8Z32-702h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-1.9372default:default2
-41.6732default:defaultZ32-619h px? 
N
9Phase 3 Critical Path Optimization | Checksum: 12a935e99
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:11 ; elapsed = 00:00:04 . Memory (MB): peak = 2851.867 ; gain = 0.000 ; free physical = 7843 ; free virtual = 128982default:defaulth px? 
{

Phase %s%s
101*constraints2
4 2default:default2.
Critical Path Optimization2default:defaultZ18-101h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-1.9372default:default2
-41.6732default:defaultZ32-619h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
dvid_1/TDMS_encoder_red/Q[3]dvid_1/TDMS_encoder_red/Q[3]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default2B
count_reg[22]_replica	count_reg[22]_replica2default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default2N
Inst_vga_gen/dc_bias[3]_i_3	Inst_vga_gen/dc_bias[3]_i_32default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default2P
Inst_vga_gen/dc_bias[2]_i_10	Inst_vga_gen/dc_bias[2]_i_102default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default2N
Inst_vga_gen/dc_bias[3]_i_5	Inst_vga_gen/dc_bias[3]_i_52default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_19	Inst_vga_gen/dc_bias[3]_i_192default:default8Z32-662h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-572h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/count_reg[27]_1[2]Inst_vga_gen/count_reg[27]_1[2]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
Inst_vga_gen/e[1]_i_5_n_0Inst_vga_gen/e[1]_i_5_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2:
Inst_vga_gen/D[3]Inst_vga_gen/D[3]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
CLK24MHZ_IBUFCLK24MHZ_IBUF2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
CLK24MHZCLK24MHZ2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default2H
dvid_1/shift_blue_reg[8]	dvid_1/shift_blue_reg[8]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,clock_eng_1280_720B/clock_x5pixel_unbuffered,clock_eng_1280_720B/clock_x5pixel_unbuffered2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default2F
dvid_1/shift_red[9]_i_2	dvid_1/shift_red[9]_i_22default:default8Z32-662h px? 
?
5Processed net %s. Rewiring did not optimize the net.
134*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-134h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-702h px? 
?
BNet %s was not replicated - recommend -force_replication_on_nets.
315*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-572h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default2F
dvid_1/shift_red[9]_i_1	dvid_1/shift_red[9]_i_12default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default2J
dvid_1/shift_clock_reg[9]	dvid_1/shift_clock_reg[9]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2P
dvid_1/TDMS_encoder_red/Q[3]dvid_1/TDMS_encoder_red/Q[3]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default2B
count_reg[22]_replica	count_reg[22]_replica2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2<
count_reg[22]_repNcount_reg[22]_repN2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default2N
Inst_vga_gen/dc_bias[3]_i_3	Inst_vga_gen/dc_bias[3]_i_32default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/dc_bias[3]_i_3_n_0Inst_vga_gen/dc_bias[3]_i_3_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_16	Inst_vga_gen/dc_bias[3]_i_162default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_16_n_0 Inst_vga_gen/dc_bias[3]_i_16_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default2P
Inst_vga_gen/dc_bias[2]_i_10	Inst_vga_gen/dc_bias[2]_i_102default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[2]_i_10_n_0 Inst_vga_gen/dc_bias[2]_i_10_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default2N
Inst_vga_gen/dc_bias[3]_i_5	Inst_vga_gen/dc_bias[3]_i_52default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2L
Inst_vga_gen/count_reg[27]Inst_vga_gen/count_reg[27]2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default2P
Inst_vga_gen/dc_bias[3]_i_19	Inst_vga_gen/dc_bias[3]_i_192default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2X
 Inst_vga_gen/dc_bias[3]_i_19_n_0 Inst_vga_gen/dc_bias[3]_i_19_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2V
Inst_vga_gen/count_reg[27]_1[2]Inst_vga_gen/count_reg[27]_1[2]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2J
Inst_vga_gen/e[1]_i_5_n_0Inst_vga_gen/e[1]_i_5_n_02default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2:
Inst_vga_gen/D[3]Inst_vga_gen/D[3]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth22
CLK24MHZ_IBUFCLK24MHZ_IBUF2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2(
CLK24MHZCLK24MHZ2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default2H
dvid_1/shift_blue_reg[8]	dvid_1/shift_blue_reg[8]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2@
dvid_1/shift_blue[8]dvid_1/shift_blue[8]2default:default8Z32-702h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2p
,clock_eng_1280_720B/clock_x5pixel_unbuffered,clock_eng_1280_720B/clock_x5pixel_unbuffered2default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default2F
dvid_1/shift_red[9]_i_2	dvid_1/shift_red[9]_i_22default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_2_n_0dvid_1/shift_red[9]_i_2_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default2F
dvid_1/shift_red[9]_i_1	dvid_1/shift_red[9]_i_12default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2N
dvid_1/shift_red[9]_i_1_n_0dvid_1/shift_red[9]_i_1_n_02default:default8Z32-702h px? 
?
/Processed net %s.  Did not re-place instance %s336*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default2J
dvid_1/shift_clock_reg[9]	dvid_1/shift_clock_reg[9]2default:default8Z32-662h px? 
?
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2T
dvid_1/shift_clock_reg_n_0_[9]dvid_1/shift_clock_reg_n_0_[9]2default:default8Z32-702h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-1.9372default:default2
-41.6732default:defaultZ32-619h px? 
N
9Phase 4 Critical Path Optimization | Checksum: 12a935e99
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:06 . Memory (MB): peak = 2851.867 ; gain = 0.000 ; free physical = 7840 ; free virtual = 128952default:defaulth px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:00.012default:default2
2851.8672default:default2
0.0002default:default2
78412default:default2
128962default:defaultZ17-722h px? 
?
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-1.9372default:default2
-41.6732default:defaultZ32-603h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
?-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          0.303  |          3.640  |            3  |              0  |                    11  |           0  |           2  |  00:00:05  |
|  Total          |          0.303  |          3.640  |            3  |              0  |                    11  |           0  |           3  |  00:00:05  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
2851.8672default:default2
0.0002default:default2
78412default:default2
128962default:defaultZ17-722h px? 
J
5Ending Physical Synthesis Task | Checksum: 18720face
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:16 ; elapsed = 00:00:06 . Memory (MB): peak = 2851.867 ; gain = 0.000 ; free physical = 7841 ; free virtual = 128962default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2532default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
a
%s completed successfully
29*	vivadotcl2#
phys_opt_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2%
phys_opt_design: 2default:default2
00:00:162default:default2
00:00:062default:default2
2851.8672default:default2
0.0002default:default2
78422default:default2
128972default:defaultZ17-722h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.122default:default2
00:00:00.042default:default2
2851.8672default:default2
0.0002default:default2
78382default:default2
128952default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2
k/home/sebastian/Desktop/Git/AdvancedProgrammableElectronics/HDMI_unit/HDMI_unit.runs/impl_1/top_physopt.dcp2default:defaultZ17-1381h px? 


End Record