library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
ENTITY mux IS
	PORT(	x1 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			x2 :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			sel	:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			y 	:OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mux;

ARCHITECTURE Behavioral OF mux IS
BEGIN
	y<= x1 WHEN sel(3) = '0' ELSE x2 ;
END Behavioral;