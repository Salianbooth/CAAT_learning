LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_BIT.ALL;

ENTITY ALU_8b IS
    PORT (
        S : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        F : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
        CO : OUT STD_LOGIC;
		  ZF : OUT STD_LOGIC
    );
END ALU_8b;

ARCHITECTURE behav OF ALU_8b IS
SIGNAL sum_temp : STD_LOGIC_VECTOR(16 DOWNTO 0);
BEGIN
    PROCESS(A, B)
    BEGIN
	 sum_temp <= ('0' & A) + ('0' & B);
        CASE S IS
            WHEN "0000" => F <= (A + B);
            WHEN "0001" => F <= (A - B);
            WHEN "0010" => F <= (A AND B);
            WHEN "0011" => F <= (A OR B);
            WHEN "0110" => F <= TO_STDLOGICVECTOR(TO_BITVECTOR(A) SLL TO_INTEGER(UNSIGNED(TO_BITVECTOR(B)))); --逻辑左移
				WHEN "0111" => F <= TO_STDLOGICVECTOR(TO_BITVECTOR(A) SRL TO_INTEGER(UNSIGNED(TO_BITVECTOR(B)))); --逻辑右移
            WHEN "1000" => F <= TO_STDLOGICVECTOR(TO_BITVECTOR(A) SRA TO_INTEGER(UNSIGNED(TO_BITVECTOR(B)))); --算术右移
				WHEN "1001" => F <= TO_STDLOGICVECTOR(TO_BITVECTOR(B) SLL 8); --立即数左移8位
				WHEN "1010" => F <= B;
				WHEN "1111" => IF A<B THEN F<="0000000000000001"; ELSE F<="0000000000000000"; END IF; --比较操作
				WHEN OTHERS => F<="0000000000000000" ;
			END CASE;
		-- 计算ZF的值
       IF F = "0000000000000000" THEN
            ZF <= '1'; 
        ELSE
            ZF <= '0';
        END IF;
		  -- 计算 CO 的值
        CO <= sum_temp(16);
			END PROCESS;
END behav;
