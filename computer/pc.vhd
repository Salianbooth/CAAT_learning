LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PC is
port (
		clk : IN STD_LOGIC;
		Reset : IN STD_LOGIC;
		LOAD_PC : IN STD_LOGIC;
		INCR_PC : IN STD_LOGIC;
		Addr_Val_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		PC_out : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
);
end PC;

ARCHITECTURE accu OF PC IS

SIGNAL Data_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN

  PROCESS(clk,Reset,LOAD_PC,INCR_PC)
   BEGIN
	IF Reset = '0' THEN 
		PC_out <= X"0000";
		ELSIF clk'event AND clk = '1' THEN
				PC_out <= Addr_Val_in;
	END IF;
	
  END PROCESS;

END accu;