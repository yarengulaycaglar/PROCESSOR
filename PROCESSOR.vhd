library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

ENTITY PROCESSOR IS
PORT (
	SEL, RESET, CLK, WR_A, WR_B : IN STD_LOGIC; -- SEL_A ve SEL_B eklendi
	A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	OPCODE : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	PROCESSOR_OUT : OUT STD_LOGIC_VECTOR (0 TO 3);
	REGA_DISPLAY : OUT STD_LOGIC_VECTOR (0 TO 6);
	REGB_DISPLAY : OUT STD_LOGIC_VECTOR (0 TO 6);
	ALU_DISPLAY : OUT STD_LOGIC_VECTOR (0 TO 6);
	Cin :IN STD_LOGIC
	);
END PROCESSOR;

ARCHITECTURE Structure OF PROCESSOR IS
	COMPONENT ALU
		PORT( a	:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				b	:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				Cin :IN STD_LOGIC;
				sel	:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				y	:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT mux2
		PORT(	x0 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				x1 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				sel1	:IN STD_LOGIC;
				y 	:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
			);
	END COMPONENT;
	
	COMPONENT reg
		PORT( CLK,WR,RST : IN STD_LOGIC;
				DATAIN : IN STD_LOGIC_VECTOR(0 TO 3);
				DATAOUT : OUT STD_LOGIC_VECTOR(0 TO 3)
				);
	END COMPONENT;
	
	COMPONENT hex2led 
		PORT (
			HEX : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END COMPONENT;

SIGNAL MuxA_OUT, ALU_OUT, MuxB_OUT, regA_OUT, regB_OUT : STD_LOGIC_VECTOR(0 TO 3);
SIGNAL OPCODE_OUT : STD_LOGIC_VECTOR(0 TO 3);
SIGNAL displayA, displayB, displayALU, displayOPCODE : STD_LOGIC_VECTOR(0 TO 6);
BEGIN
	MUXA: mux2 PORT MAP(ALU_OUT, A, SEL, MuxA_OUT); 
	MUXB: mux2 PORT MAP(ALU_OUT, B, SEL, MuxB_OUT); 
	REGA: reg PORT MAP(CLK, WR_A, RESET, MuxA_OUT, regA_OUT);
	REGB: reg PORT MAP(CLK, WR_B, RESET, MuxB_OUT, regB_OUT);
	ALUPART: ALU PORT MAP(regA_OUT, regB_OUT, Cin, OPCODE, ALU_OUT);
	DISA: hex2led PORT MAP(regA_OUT,displayA);
	DISB: hex2led PORT MAP(regB_OUT,displayB);
	DISALU: hex2led PORT MAP(ALU_OUT,displayALU);
	PROCESSOR_OUT <= ALU_OUT;
	REGA_DISPLAY <= displayA;
	REGB_DISPLAY <= displayB;
	ALU_DISPLAY <= displayALU;
END Structure;