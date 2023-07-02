-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/29/2023 21:07:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          FPALU
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY FPALU_vhd_vec_tst IS
END FPALU_vhd_vec_tst;
ARCHITECTURE FPALU_arch OF FPALU_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL iclock : STD_LOGIC;
SIGNAL icontrol : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL idataa : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL idatab : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL istart : STD_LOGIC;
SIGNAL oready : STD_LOGIC;
SIGNAL oresult : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT FPALU
	PORT (
	iclock : IN STD_LOGIC;
	icontrol : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	idataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	idatab : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	istart : IN STD_LOGIC;
	oready : OUT STD_LOGIC;
	oresult : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : FPALU
	PORT MAP (
-- list connections between master ports and signals
	iclock => iclock,
	icontrol => icontrol,
	idataa => idataa,
	idatab => idatab,
	istart => istart,
	oready => oready,
	oresult => oresult
	);

-- iclock
t_prcs_iclock: PROCESS
BEGIN
LOOP
	iclock <= '0';
	WAIT FOR 10000 ps;
	iclock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 8000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_iclock;

-- istart
t_prcs_istart: PROCESS
BEGIN
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
	WAIT FOR 370000 ps;
	istart <= '0';
	WAIT FOR 30000 ps;
	istart <= '1';
WAIT;
END PROCESS t_prcs_istart;
-- icontrol[4]
t_prcs_icontrol_4: PROCESS
BEGIN
	icontrol(4) <= '0';
	WAIT FOR 6400000 ps;
	icontrol(4) <= '1';
WAIT;
END PROCESS t_prcs_icontrol_4;
-- icontrol[3]
t_prcs_icontrol_3: PROCESS
BEGIN
	icontrol(3) <= '0';
	WAIT FOR 3200000 ps;
	icontrol(3) <= '1';
	WAIT FOR 3200000 ps;
	icontrol(3) <= '0';
WAIT;
END PROCESS t_prcs_icontrol_3;
-- icontrol[2]
t_prcs_icontrol_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		icontrol(2) <= '0';
		WAIT FOR 1600000 ps;
		icontrol(2) <= '1';
		WAIT FOR 1600000 ps;
	END LOOP;
	icontrol(2) <= '0';
WAIT;
END PROCESS t_prcs_icontrol_2;
-- icontrol[1]
t_prcs_icontrol_1: PROCESS
BEGIN
LOOP
	icontrol(1) <= '0';
	WAIT FOR 800000 ps;
	icontrol(1) <= '1';
	WAIT FOR 800000 ps;
	IF (NOW >= 8000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_icontrol_1;
-- icontrol[0]
t_prcs_icontrol_0: PROCESS
BEGIN
LOOP
	icontrol(0) <= '0';
	WAIT FOR 400000 ps;
	icontrol(0) <= '1';
	WAIT FOR 400000 ps;
	IF (NOW >= 8000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_icontrol_0;
-- idataa[31]
t_prcs_idataa_31: PROCESS
BEGIN
	idataa(31) <= '0';
WAIT;
END PROCESS t_prcs_idataa_31;
-- idataa[30]
t_prcs_idataa_30: PROCESS
BEGIN
	idataa(30) <= '1';
WAIT;
END PROCESS t_prcs_idataa_30;
-- idataa[29]
t_prcs_idataa_29: PROCESS
BEGIN
	idataa(29) <= '0';
WAIT;
END PROCESS t_prcs_idataa_29;
-- idataa[28]
t_prcs_idataa_28: PROCESS
BEGIN
	idataa(28) <= '0';
WAIT;
END PROCESS t_prcs_idataa_28;
-- idataa[27]
t_prcs_idataa_27: PROCESS
BEGIN
	idataa(27) <= '0';
WAIT;
END PROCESS t_prcs_idataa_27;
-- idataa[26]
t_prcs_idataa_26: PROCESS
BEGIN
	idataa(26) <= '0';
WAIT;
END PROCESS t_prcs_idataa_26;
-- idataa[25]
t_prcs_idataa_25: PROCESS
BEGIN
	idataa(25) <= '0';
WAIT;
END PROCESS t_prcs_idataa_25;
-- idataa[24]
t_prcs_idataa_24: PROCESS
BEGIN
	idataa(24) <= '0';
WAIT;
END PROCESS t_prcs_idataa_24;
-- idataa[23]
t_prcs_idataa_23: PROCESS
BEGIN
	idataa(23) <= '0';
WAIT;
END PROCESS t_prcs_idataa_23;
-- idataa[22]
t_prcs_idataa_22: PROCESS
BEGIN
	idataa(22) <= '0';
WAIT;
END PROCESS t_prcs_idataa_22;
-- idataa[21]
t_prcs_idataa_21: PROCESS
BEGIN
	idataa(21) <= '0';
WAIT;
END PROCESS t_prcs_idataa_21;
-- idataa[20]
t_prcs_idataa_20: PROCESS
BEGIN
	idataa(20) <= '0';
WAIT;
END PROCESS t_prcs_idataa_20;
-- idataa[19]
t_prcs_idataa_19: PROCESS
BEGIN
	idataa(19) <= '0';
WAIT;
END PROCESS t_prcs_idataa_19;
-- idataa[18]
t_prcs_idataa_18: PROCESS
BEGIN
	idataa(18) <= '0';
WAIT;
END PROCESS t_prcs_idataa_18;
-- idataa[17]
t_prcs_idataa_17: PROCESS
BEGIN
	idataa(17) <= '0';
WAIT;
END PROCESS t_prcs_idataa_17;
-- idataa[16]
t_prcs_idataa_16: PROCESS
BEGIN
	idataa(16) <= '0';
WAIT;
END PROCESS t_prcs_idataa_16;
-- idataa[15]
t_prcs_idataa_15: PROCESS
BEGIN
	idataa(15) <= '0';
WAIT;
END PROCESS t_prcs_idataa_15;
-- idataa[14]
t_prcs_idataa_14: PROCESS
BEGIN
	idataa(14) <= '0';
WAIT;
END PROCESS t_prcs_idataa_14;
-- idataa[13]
t_prcs_idataa_13: PROCESS
BEGIN
	idataa(13) <= '0';
WAIT;
END PROCESS t_prcs_idataa_13;
-- idataa[12]
t_prcs_idataa_12: PROCESS
BEGIN
	idataa(12) <= '0';
WAIT;
END PROCESS t_prcs_idataa_12;
-- idataa[11]
t_prcs_idataa_11: PROCESS
BEGIN
	idataa(11) <= '0';
WAIT;
END PROCESS t_prcs_idataa_11;
-- idataa[10]
t_prcs_idataa_10: PROCESS
BEGIN
	idataa(10) <= '0';
WAIT;
END PROCESS t_prcs_idataa_10;
-- idataa[9]
t_prcs_idataa_9: PROCESS
BEGIN
	idataa(9) <= '0';
WAIT;
END PROCESS t_prcs_idataa_9;
-- idataa[8]
t_prcs_idataa_8: PROCESS
BEGIN
	idataa(8) <= '0';
WAIT;
END PROCESS t_prcs_idataa_8;
-- idataa[7]
t_prcs_idataa_7: PROCESS
BEGIN
	idataa(7) <= '0';
WAIT;
END PROCESS t_prcs_idataa_7;
-- idataa[6]
t_prcs_idataa_6: PROCESS
BEGIN
	idataa(6) <= '0';
WAIT;
END PROCESS t_prcs_idataa_6;
-- idataa[5]
t_prcs_idataa_5: PROCESS
BEGIN
	idataa(5) <= '0';
WAIT;
END PROCESS t_prcs_idataa_5;
-- idataa[4]
t_prcs_idataa_4: PROCESS
BEGIN
	idataa(4) <= '0';
WAIT;
END PROCESS t_prcs_idataa_4;
-- idataa[3]
t_prcs_idataa_3: PROCESS
BEGIN
	idataa(3) <= '0';
WAIT;
END PROCESS t_prcs_idataa_3;
-- idataa[2]
t_prcs_idataa_2: PROCESS
BEGIN
	idataa(2) <= '0';
WAIT;
END PROCESS t_prcs_idataa_2;
-- idataa[1]
t_prcs_idataa_1: PROCESS
BEGIN
	idataa(1) <= '0';
WAIT;
END PROCESS t_prcs_idataa_1;
-- idataa[0]
t_prcs_idataa_0: PROCESS
BEGIN
	idataa(0) <= '0';
WAIT;
END PROCESS t_prcs_idataa_0;
-- idatab[31]
t_prcs_idatab_31: PROCESS
BEGIN
	idatab(31) <= '1';
WAIT;
END PROCESS t_prcs_idatab_31;
-- idatab[30]
t_prcs_idatab_30: PROCESS
BEGIN
	idatab(30) <= '1';
WAIT;
END PROCESS t_prcs_idatab_30;
-- idatab[29]
t_prcs_idatab_29: PROCESS
BEGIN
	idatab(29) <= '0';
WAIT;
END PROCESS t_prcs_idatab_29;
-- idatab[28]
t_prcs_idatab_28: PROCESS
BEGIN
	idatab(28) <= '0';
WAIT;
END PROCESS t_prcs_idatab_28;
-- idatab[27]
t_prcs_idatab_27: PROCESS
BEGIN
	idatab(27) <= '0';
WAIT;
END PROCESS t_prcs_idatab_27;
-- idatab[26]
t_prcs_idatab_26: PROCESS
BEGIN
	idatab(26) <= '0';
WAIT;
END PROCESS t_prcs_idatab_26;
-- idatab[25]
t_prcs_idatab_25: PROCESS
BEGIN
	idatab(25) <= '0';
WAIT;
END PROCESS t_prcs_idatab_25;
-- idatab[24]
t_prcs_idatab_24: PROCESS
BEGIN
	idatab(24) <= '0';
WAIT;
END PROCESS t_prcs_idatab_24;
-- idatab[23]
t_prcs_idatab_23: PROCESS
BEGIN
	idatab(23) <= '0';
WAIT;
END PROCESS t_prcs_idatab_23;
-- idatab[22]
t_prcs_idatab_22: PROCESS
BEGIN
	idatab(22) <= '1';
WAIT;
END PROCESS t_prcs_idatab_22;
-- idatab[21]
t_prcs_idatab_21: PROCESS
BEGIN
	idatab(21) <= '0';
WAIT;
END PROCESS t_prcs_idatab_21;
-- idatab[20]
t_prcs_idatab_20: PROCESS
BEGIN
	idatab(20) <= '0';
WAIT;
END PROCESS t_prcs_idatab_20;
-- idatab[19]
t_prcs_idatab_19: PROCESS
BEGIN
	idatab(19) <= '0';
WAIT;
END PROCESS t_prcs_idatab_19;
-- idatab[18]
t_prcs_idatab_18: PROCESS
BEGIN
	idatab(18) <= '0';
WAIT;
END PROCESS t_prcs_idatab_18;
-- idatab[17]
t_prcs_idatab_17: PROCESS
BEGIN
	idatab(17) <= '0';
WAIT;
END PROCESS t_prcs_idatab_17;
-- idatab[16]
t_prcs_idatab_16: PROCESS
BEGIN
	idatab(16) <= '0';
WAIT;
END PROCESS t_prcs_idatab_16;
-- idatab[15]
t_prcs_idatab_15: PROCESS
BEGIN
	idatab(15) <= '0';
WAIT;
END PROCESS t_prcs_idatab_15;
-- idatab[14]
t_prcs_idatab_14: PROCESS
BEGIN
	idatab(14) <= '0';
WAIT;
END PROCESS t_prcs_idatab_14;
-- idatab[13]
t_prcs_idatab_13: PROCESS
BEGIN
	idatab(13) <= '0';
WAIT;
END PROCESS t_prcs_idatab_13;
-- idatab[12]
t_prcs_idatab_12: PROCESS
BEGIN
	idatab(12) <= '0';
WAIT;
END PROCESS t_prcs_idatab_12;
-- idatab[11]
t_prcs_idatab_11: PROCESS
BEGIN
	idatab(11) <= '0';
WAIT;
END PROCESS t_prcs_idatab_11;
-- idatab[10]
t_prcs_idatab_10: PROCESS
BEGIN
	idatab(10) <= '0';
WAIT;
END PROCESS t_prcs_idatab_10;
-- idatab[9]
t_prcs_idatab_9: PROCESS
BEGIN
	idatab(9) <= '0';
WAIT;
END PROCESS t_prcs_idatab_9;
-- idatab[8]
t_prcs_idatab_8: PROCESS
BEGIN
	idatab(8) <= '0';
WAIT;
END PROCESS t_prcs_idatab_8;
-- idatab[7]
t_prcs_idatab_7: PROCESS
BEGIN
	idatab(7) <= '0';
WAIT;
END PROCESS t_prcs_idatab_7;
-- idatab[6]
t_prcs_idatab_6: PROCESS
BEGIN
	idatab(6) <= '0';
WAIT;
END PROCESS t_prcs_idatab_6;
-- idatab[5]
t_prcs_idatab_5: PROCESS
BEGIN
	idatab(5) <= '0';
WAIT;
END PROCESS t_prcs_idatab_5;
-- idatab[4]
t_prcs_idatab_4: PROCESS
BEGIN
	idatab(4) <= '0';
WAIT;
END PROCESS t_prcs_idatab_4;
-- idatab[3]
t_prcs_idatab_3: PROCESS
BEGIN
	idatab(3) <= '0';
WAIT;
END PROCESS t_prcs_idatab_3;
-- idatab[2]
t_prcs_idatab_2: PROCESS
BEGIN
	idatab(2) <= '0';
WAIT;
END PROCESS t_prcs_idatab_2;
-- idatab[1]
t_prcs_idatab_1: PROCESS
BEGIN
	idatab(1) <= '0';
WAIT;
END PROCESS t_prcs_idatab_1;
-- idatab[0]
t_prcs_idatab_0: PROCESS
BEGIN
	idatab(0) <= '0';
WAIT;
END PROCESS t_prcs_idatab_0;
END FPALU_arch;
