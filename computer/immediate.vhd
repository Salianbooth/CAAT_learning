LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY immediate IS
    PORT (
        in_c  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        out_c : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        went  : IN  STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
END immediate;

ARCHITECTURE behav OF immediate IS
BEGIN
    PROCESS(in_c, went)
    BEGIN
        CASE went IS
            WHEN "0" =>
               out_c<= (others => '0');  -- 先将输出信号初始化为全0
					out_c(7 downto 0) <= in_c;  
            WHEN "1" =>
                out_c <= (others => in_c(7));
					 out_c(7 downto 0) <= in_c; 
        END CASE;
    END PROCESS;
END behav;
