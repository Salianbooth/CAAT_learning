LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ControlUnit IS
    PORT (
        OP : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        WE : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        Smux : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        Exop : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        Imux1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        str : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        ld : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        Lmux : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        PC_1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        wpc : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        beq : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        bne : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        bgt : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        jump : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        R_tybe : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
END ControlUnit;

ARCHITECTURE Behavioral OF ControlUnit IS
BEGIN
    PROCESS(OP)
    BEGIN
        CASE OP(15 DOWNTO 12) IS
             WHEN "0000" =>  -- 操作码为 "0000" 时
                S <= "0000";  -- 设置输出信号 S
                WE <= "1";  -- 写使能
                Smux <= "0";  -- 选择信号
                Exop <= "0";  -- 扩展操作信号
                str <= "0";  -- 存储信号
                ld <= "0";  -- 加载信号
                Lmux <= "0";  -- 选择信号
                PC_1 <= "1";  -- 程序计数器信号
                wpc <= "0";  -- 写程序计数器信号
                beq <= "0";  -- 分支等于信号
                bne <= "0";  -- 分支不等信号
                bgt <= "0";  -- 分支大于信号
                jump <= "0";  -- 跳转信号
                R_tybe <= "0";  -- R 型信号
            WHEN "0001" =>
                S <= "1001"; --立即数左移8
                WE <= "1";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0010" =>
                S <= "0011"; --or
                WE <= "1";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0011" =>
                S <= "0010"; -- and
                WE <= "1";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0100" => -- 4
                S <= "0000"; -- +
                WE <= "1";
                Smux <= "0";
                Exop <= "1";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0101" => -- 5
                S <= "0000";-- +
                WE <= "1";
                Smux <= "0";
                Exop <= "1";
                str <= "0";
                ld <= "1";
                Lmux <= "1";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0110" => -- 6
                S <= "0000"; -- +
                WE <= "0";
                Smux <= "0";
                Exop <= "1";
                str <= "1";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "0111" => -- 7
                S <= "0001"; -- 减法
                WE <= "0";
                Smux <= "0";
                Exop <= "1";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "1";
                beq <= "1";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "1000" => -- 8
                S <= "0100";
                WE <= "0";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "1";
                beq <= "0";
                bne <= "1"; -- bne
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
            WHEN "1001" =>
                S <= "0100";
                WE <= "0";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "1";
                beq <= "0";
                bne <= "0";
                bgt <= "1";
                jump <= "0";
                R_tybe <= "1";
            WHEN "1010" =>
                S <= "1111";
                WE <= "0";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "1";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "1"; -- jump
                R_tybe <= "1";
            WHEN "1011" =>
                S <= "1111";
                WE <= "0";
                Smux <= "1";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "1";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "1";
                R_tybe <= "1";
					WHEN "1110" =>
                S <= "1010"; --打入数据低8位
                WE <= "1";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "1";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "1";
				WHEN OTHERS => 
					S <= "1111";
                WE <= "0";
                Smux <= "0";
                Exop <= "0";
                str <= "0";
                ld <= "0";
                Lmux <= "0";
                PC_1 <= "0";
                wpc <= "0";
                beq <= "0";
                bne <= "0";
                bgt <= "0";
                jump <= "0";
                R_tybe <= "0";
   
        END CASE;
    END PROCESS;
END Behavioral;
