library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AC_A is
    port (
        LOAD_A   : in  std_logic;
        clk      : in  std_logic;
        Data_in  : in  std_logic_vector(15 downto 0);
        A        : out std_logic_vector(15 downto 0)
    );
end AC_A;

architecture accu of AC_A is

begin

    process (clk)
    begin
        if rising_edge(clk) then
            if LOAD_A = '1' then
                A <= Data_in;
            end if;
        end if;
    end process;

end accu;
