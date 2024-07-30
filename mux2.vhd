library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

ENTITY mux2 IS
	PORT(	x0 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			x1 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			sel1	:IN STD_LOGIC;
			y 	:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mux2;

ARCHITECTURE Behavioral OF mux2 IS
BEGIN
	y<= x0 WHEN sel1 = '0' ELSE x1;
END Behavioral;
