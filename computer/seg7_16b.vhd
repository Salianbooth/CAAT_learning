LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seg7_16b is
port (
		Blank : STD_LOGIC;
		Test : STD_LOGIC;
		Data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		RQ1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		RQ2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
end seg7_16b;

ARCHITECTURE behav OF seg7_16b IS

SIGNAL DH : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DL : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

	DH <= Data(7)&Data(6)&Data(5)&Data(4);  
	DL <= Data(3)&Data(2)&Data(1)&Data(0);
  PROCESS(DH,DL)
   BEGIN
	IF Blank = '1' THEN RQ1 <="1111111"; RQ2 <="1111111"; 
	ELSIF Blank = '0' AND Test = '0' THEN RQ1 <="1111110"; RQ2 <="1111110"; 
	ELSIF Blank = '0' AND Test = '1' THEN 
			CASE DL IS
					WHEN "0000" => RQ1 <= "0000001";
					WHEN "0001" => RQ1 <= "1001111";
					WHEN "0010" => RQ1 <= "0010010";
					WHEN "0011" => RQ1 <= "0000110";
					WHEN "0100" => RQ1 <= "1001100";
					WHEN "0101" => RQ1 <= "0100100";
					WHEN "0110" => RQ1 <= "0100000";
					WHEN "0111" => RQ1 <= "0001111";
					WHEN "1000" => RQ1 <= "0000000";
					WHEN "1001" => RQ1 <= "0000100";
					WHEN "1010" => RQ1 <= "0001000";
					WHEN "1011" => RQ1 <= "1100000";
					WHEN "1100" => RQ1 <= "0110001";
					WHEN "1101" => RQ1 <= "1000010";
					WHEN "1110" => RQ1 <= "0110000";
					WHEN "1111" => RQ1 <= "0111000";
			END CASE ;
			CASE DH IS
					WHEN "0000" => RQ2 <= "0000001";
					WHEN "0001" => RQ2 <= "1001111";
					WHEN "0010" => RQ2 <= "0010010";
					WHEN "0011" => RQ2 <= "0000110";
					WHEN "0100" => RQ2 <= "1001100";
					WHEN "0101" => RQ2 <= "0100100";
					WHEN "0110" => RQ2 <= "0100000";
					WHEN "0111" => RQ2 <= "0001111";
					WHEN "1000" => RQ2 <= "0000000";
					WHEN "1001" => RQ2 <= "0000100";
					WHEN "1010" => RQ2 <= "0001000";
					WHEN "1011" => RQ2 <= "1100000";
					WHEN "1100" => RQ2 <= "0110001";
					WHEN "1101" => RQ2 <= "1000010";
					WHEN "1110" => RQ2 <= "0110000";
					WHEN "1111" => RQ2 <= "0111000";
			END CASE ;
	ELSE RQ1 <="0000000";RQ2 <="0000000";
	END IF;
  END PROCESS;

END behav;
