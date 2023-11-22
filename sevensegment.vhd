library IEEE;
use IEEE.std_logic_1164.all;

entity sevensegment is 

	port( 
--			BCDin : in std_logic_vector (3 downto 0);
--			display : out std_logic_vector (6 downto 0));
			S0, S1, S2, S3 : in std_logic;
			a, b, c, d, e, f, g : out std_logic);
	end sevensegment;
	
architecture ssd of sevensegment is

begin 
 
 a <= (S0 AND (NOT S1) AND (NOT S2) AND (NOT S3)) OR ((NOT S0) AND (NOT S1) AND S2 AND (NOT S3));
 b <= (S2 AND S3) OR (S1 AND S3) OR (S0 AND (NOT S1) AND S2) OR ((NOT S0) AND S1 AND S2);
 c <= (S2 AND S3) OR (S1 AND S3) OR ((NOT S0) AND S1 AND (NOT S2));
 d <= ((NOT S0) AND (NOT S1) AND S2 AND (NOT S3)) OR (S0 AND (NOT S1) AND (NOT S2) AND (NOT S3)) OR (S0 AND S1 AND S2 AND (NOT S3));
 e <= (S0 AND (NOT S3)) OR ((NOT S1) AND S2 AND (NOT S3)) OR (S0 AND (NOT S1) AND (NOT S2));
 f <= (S0 AND (NOT S2) AND (NOT S3)) OR (S1 AND (NOT S2) AND (NOT S3)) OR (S0 AND S1 AND (NOT S3));
 g <= ((NOT S1) AND (NOT S2) AND (NOT S3)) OR (S0 AND S1 AND S2 AND (NOT S3));
 
 end ssd;
 
 
 
-- architecture ssd of sevensegment is
-- 
--begin
-- 
--process(BCDin)
--begin
-- 
--case BCDin is
--
--		when "0000" =>
--		display <= "0000001"; ---0
--		when "0001" =>
--		display <= "1001111"; ---1
--		when "0010" =>
--		display <= "0010010"; ---2
--		when "0011" =>
--		display <= "0000110"; ---3
--		when "0100" =>
--		display <= "1001100"; ---4
--		when "0101" =>
--		display <= "0100100"; ---5
--		when "0110" =>
--		display <= "0100000"; ---6
--		when "0111" =>
--		display <= "0001111"; ---7
--		when "1000" =>
--		display <= "0000000"; ---8
--		when "1001" =>
--		display <= "0000100"; ---9
--		when "1010" =>
--		display <= "0000010"; ---a
--		when "1011" =>
--		display <= "1100000"; ---b
--		when "1100" =>
--		display <= "0110001"; ---c
--		when "1101" =>
--		display <= "1000010"; ---d
--		when "1110" =>
--		display <= "0110000"; ---e
--		when others =>
--		display <= "0111000"; ---f
--		
--end case;
-- 
--end process;
-- 
--end ssd;
