library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BlocDepunere is
port(
	Depunere : in std_logic;
	UP : in std_logic;
	DISPLAY : out std_logic_vector(15 downto 0);
	SoldOK : out std_logic
	);
end BlocDepunere;

architecture B of BlocDepunere is

	signal a : std_logic;
	signal sel : std_logic_vector(1 downto 0);
	signal choice : std_logic_vector(15 downto 0);
	
	component Modulo4Counter is
	port(
		UP : in std_logic;
		RESET : in std_logic;
		TC : out std_logic; --terminal count
		Q : out std_logic_vector(1 downto 0)
		);
	end component;
	

begin
	DISPLAY <= choice;
	a <= not Depunere;
	
	CP_3 : Modulo4Counter
	port map(
			UP => UP,
			RESET => a,
			Q => sel
			);
			
	with sel select
		 choice <= "0000000000010000" when "00", --10
			 	  "0000000001010000" when "01",	--50
				  "0000000100000000" when "10",	--100
			 	  "0000010100000000" when others; --500
	soldOK<='1';

end B;