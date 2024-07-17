LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY offset IS
    PORT (
        in_c  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        out_c : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END offset;

ARCHITECTURE behav OF offset IS
BEGIN
    PROCESS(in_c)
    BEGIN
		  out_c<= (others => '0');  -- 先将输出信号初始化为全0
        out_c(7 downto 0) <= in_c;  
    END PROCESS;
END behav;