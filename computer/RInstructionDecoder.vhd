LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY RInstructionDecoder IS
    PORT (
        OP : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END RInstructionDecoder;

ARCHITECTURE behav OF RInstructionDecoder IS
BEGIN
    PROCESS(OP)
    BEGIN
        CASE OP IS
            WHEN "000" => S <= "0011"; --0  or
            WHEN "001" => S <= "0010"; -- and
            WHEN "010" => S <= "0000"; -- +
            WHEN "011" => S <= "0001"; -- 减法
            WHEN "100" => S <= "0110";-- 4 逻辑左移
            WHEN "101" => S <= "0111";	--逻辑右移
            WHEN "110" => S <= "1000"; --算术右移
				WHEN "111" => S <= "1111";	--比较操作
            WHEN OTHERS => S <= "0000"; -- 处理未定义的操作码情况
        END CASE;
    END PROCESS;
END behav;
