LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY address IS
    PORT (
        in_c  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
        out_c : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END address;

ARCHITECTURE behav OF address IS
BEGIN
    PROCESS(in_c)
    BEGIN
		out_c <= in_c;
		out_c(15 DOWNTO 12) <= "0000"; -- 将高4位置零
    END PROCESS;
END behav;
