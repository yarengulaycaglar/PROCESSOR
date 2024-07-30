library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

ENTITY reg IS 
    PORT(   
        CLK, WR, RST : IN STD_LOGIC;
        DATAIN : IN STD_LOGIC_VECTOR (0 TO 3);
        DATAOUT : OUT STD_LOGIC_VECTOR(0 TO 3)
    );
END reg;

ARCHITECTURE Behavioral OF reg IS
BEGIN
    PROCESS(CLK)
    BEGIN
        IF rising_edge(CLK) THEN
            IF RST = '1' THEN  
                DATAOUT <= "0000";
			   END IF;
            IF WR = '1' THEN
                DATAOUT <= DATAIN;
            END IF;
        END IF;
    END PROCESS;
END Behavioral;
