library IEEE;
use IEEE.std_logic_1164.all;

entity and_or_xor is

	port( X : in std_logic;
			Y : in std_logic;
			A : out std_logic;
			B : out std_logic;
			C : out std_logic);

end and_or_xor;


architecture gatelogics of and_or_xor is

begin
	A <= X AND Y;
	B <= X OR Y;
	C <= X XOR Y;
	
end gatelogics;