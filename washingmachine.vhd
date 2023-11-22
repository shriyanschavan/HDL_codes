library IEEE;
use IEEE.std_logic_1164.all;

entity washingmachine is 
port(
		W : in std_logic;
		X : in std_logic;
		Y : in std_logic;
		Z : in std_logic;
		F : out std_logic;
		L0 : out std_logic;
		L1 : out std_logic;
		L2 : out std_logic;
		L3 : out std_logic;
		stopbutton: in std_logic);
		
end washingmachine;

architecture logics of washingmachine is
signal S : std_logic;
signal status : std_logic :='1';
begin
		L0 <= W;
		L1 <= X;
		L2 <= Y;
		L3 <= Z;
		
		process(stopbutton)
		begin
			if stopbutton = '0' then 
				status <= NOT(status);
			end if;
		end process;
		
		process(status,W,X,Y,Z)
			begin
			if status <= '0' then 
			F <= '0';
			else
			F <= (W AND X AND Y AND (NOT Z));
			end if;
		end process;		
end logics;