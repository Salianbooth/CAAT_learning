LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_BIT.ALL;

ENTITY Adder_16bit IS
    PORT (
        A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        Sum : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        CarryOut : OUT STD_LOGIC
    );
END Adder_16bit;

ARCHITECTURE Behavioral OF Adder_16bit IS
BEGIN
    PROCESS(A, B)
        VARIABLE temp : STD_LOGIC_VECTOR(16 DOWNTO 0);
    BEGIN
        temp := ('0' & A) + ('0' & B);
        Sum <= temp(15 DOWNTO 0);
        CarryOut <= temp(16);
    END PROCESS;
END Behavioral;
