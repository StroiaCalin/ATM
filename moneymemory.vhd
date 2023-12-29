library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity MoneyMemory is
port(
	CLK : in std_logic;
	SEL : in std_logic_vector(1 downto 0);
	DIN : in std_logic_vector(15 downto 0);
	OUTPUT : out std_logic_vector(15 downto 0)
	);
end MoneyMemory;

architecture A1 of MoneyMemory is

	type T is array(3 downto 0) of std_logic_vector(15 downto 0);
	signal content : T := ("0010001000100010", "0101000000110100", "0011001001000001", "0010001101000101");  
																																														
begin
	process(CLK)
		begin
			if(CLK' event and CLK = '1') then
					content(conv_integer(SEL)) <= DIN;
				end if;
		end process;
	OUTPUT <= content(conv_integer(SEL));
end A1;