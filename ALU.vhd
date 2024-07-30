library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

ENTITY ALU IS
    PORT(
        a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;  -- Carry input for operations that might need it
        sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ALU;

ARCHITECTURE Structure OF ALU IS
    SIGNAL full_product : STD_LOGIC_VECTOR(7 DOWNTO 0);  -- Intermediate full product
	 SIGNAL add : STD_LOGIC_VECTOR(3 DOWNTO 0);  
BEGIN
    PROCESS(a, b, sel)
    BEGIN
        CASE sel IS
            WHEN "0000" =>  
                y <= NOT a;
            WHEN "0001" =>  
                y <= NOT b;
            WHEN "0010" =>  
                y <= a AND b;
            WHEN "0011" => 
                y <= a OR b;
            WHEN "0100" =>  
                y <= a NAND b;
            WHEN "0101" =>  
                y <= a NOR b;
            WHEN "0110" =>  
                y <= a XOR b;
            WHEN "0111" =>  
                y <= a XNOR b;
            WHEN "1000" =>
                y <= a;
            WHEN "1001" =>
                y <= a + 1 + Cin;
            WHEN "1010" =>
                y <= a - 1+ Cin;
            WHEN "1011" =>
                y <= b;
            WHEN "1100" =>
                y <= a + b+ Cin ;
            WHEN "1101" =>
                y <= a - b+ Cin;
            WHEN "1110" =>  -- Handling multiplication
                full_product <= STD_LOGIC_VECTOR(a * b);
                y <= full_product(3 DOWNTO 0);  -- Only the lowest 4 bits
            WHEN OTHERS =>
                y <= "0000";  
        END CASE;
    END PROCESS;
END Structure;
