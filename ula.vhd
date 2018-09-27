library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ula is
port(   
        A,B : in signed(3 downto 0); 
        func : in std_logic_vector(2 downto 0); 
		  flag : out boolean;
        Q : out signed(3 downto 0) 
        );
end ula;

architecture Behavioral of ula is

signal R1,R2,R3 : signed(3 downto 0) := (others => '0');

begin

R1 <= A;
R2 <= B;
Q <= R3;

process(ALL)
begin
	  case func is
			when "000" => 
				 R3 <= R1 + R2;
			when "010" => 
				 R3 <= R1 - R2;
			when others =>
					R3 <= R1 xnor R2;
			if R3 = 0 then
				flag <= true;
			else 
				flag <= false;
			end if;
	  end case;       
    
end process;    

end Behavioral;