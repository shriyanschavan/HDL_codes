library IEEE;
use IEEE.std_logic_1164.all;

entity hamming is 
port(
		D1 : in std_logic;
		D2 : in std_logic;
		D3 : in std_logic;
		D4 : in std_logic;
		D5 : in std_logic;
		D6 : in std_logic;
		D7 : in std_logic;
		sen : buffer std_logic_vector(6 downto 0);
		rec : buffer std_logic_vector(6 downto 0);
		par : buffer std_logic_vector(3 downto 0);
		P : out std_logic_vector(3 downto 0);
		chk : buffer std_logic_vector(3 downto 0);
		C: out std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0);
		cor : out std_logic_vector(6 downto 0));
		
end hamming;

architecture arch of hamming is 
signal err : std_logic := '0';
signal dec : std_logic_vector(15 downto 0);
-----------------------------------------------------
--encoder end

begin

sen(0) <= D1;
sen(1) <= D2;
sen(2) <= D3;
sen(3) <= D4;
sen(4) <= D5;
sen(5) <= D6;
sen(6) <= D7;

par(0) <= sen(0) XOR sen(1) XOR sen(3) XOR sen(4) XOR sen(6);
par(1) <= sen(0) XOR sen(2) XOR sen(3) XOR sen(5) XOR sen(6);
par(2) <= sen(1) XOR sen(2) XOR sen(3);
par(3) <= sen(4) XOR sen(5) XOR sen(6);

P(0) <= par(0);
P(1) <= par(1);
P(2) <= par(2);
P(3) <= par(3);

--------------------------------------------------------------------------------------------------------------
-- decoder end

rec(0) <= sen(0);
rec(1) <= sen(1);
rec(2) <= sen(2);
rec(3) <= err;
rec(4) <= sen(4);
rec(5) <= sen(5);
rec(6) <= sen(6);


chk(0) <= par(0) XOR rec(0) XOR rec(1) XOR rec(3) XOR rec(4) XOR rec(6);
chk(1) <= par(1) XOR rec(0) XOR rec(2) XOR rec(3) XOR rec(5) XOR rec(6);
chk(2) <= par(2) XOR rec(1) XOR rec(2) XOR rec(3);
chk(3) <= par(3) XOR rec(4) XOR rec(5) XOR rec(6);

C(0) <= chk(0);
C(1) <= chk(1);
C(2) <= chk(2);
C(3) <= chk(3);

process(chk)
begin

case chk is
when "0000" =>
	dec <= "0000000000000001";
	display <= "0000001"; ---no error line 0 active 
when "0001" =>
   dec <= "0000000000000010";
	display <= "1001111"; ---1 parity 1 error
when "0010" =>
	dec <= "0000000000000100";
	display <= "0010010"; ---2 parity 2 error
when "0011" =>
	dec <= "0000000000001000";
	display <= "0000110"; ---3 data 1 error 
when "0100" =>
	dec <= "0000000000010000";
	display <= "1001100"; ---4 parity 3 error 
when "0101" =>
	dec <= "0000000000100000";
	display <= "0100100"; ---5 data 2 error
when "0110" =>
	dec <= "0000000001000000";
	display <= "0100000"; ---6 data 3 error 
when "0111" =>
	dec <= "0000000010000000";
   display <= "0001111"; ---7 data 4 error
when "1000" =>
	dec <= "0000000100000000";
	display <= "0000000"; ---8 parity 4 error 
when "1001" =>
	dec <= "0000001000000000";
	display <= "0000100"; ---9 data 5 error
when "1010" =>
	dec <= "0000010000000000";
	display <= "0000010"; ---a data 6 error 
when "1011" =>
	dec <= "0000100000000000";
	display <= "1100000"; ---b data 7 error
when "1100" =>
	dec <= "0001000000000000";
	display <= "0110001"; ---c redundant
when "1101" =>
	dec <= "0010000000000000";
	display <= "1000010"; ---d redundant
when "1110" =>
	dec <= "0100000000000000";
	display <= "0110000"; ---e redundant
when "1111" =>
	dec <= "1000000000000000";
	display <= "0111000"; ---f redundant
when others =>
	dec <= "0000000000000000";
	display <= "1111111"; ---  default case no display
end case;
end process;

cor(0) <= dec(3) XOR rec(0);
cor(1) <= dec(5) XOR rec(1);
cor(2) <= dec(6) XOR rec(2);
cor(3) <= dec(7) XOR rec(3);
cor(4) <= dec(9) XOR rec(4);
cor(5) <= dec(10) XOR rec(5);
cor(6) <= dec(11) XOR rec(6);

end arch; 
