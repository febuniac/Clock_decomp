-- Quartus Prime VHDL Template
-- Single-Port ROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_port_rom is

	generic 
	(
		DATA_WIDTH : natural := 12;
		ADDR_WIDTH : natural := 9
	);

	port 
	(
		clk		: in std_logic;
		addr	: in natural range 0 to 2**ADDR_WIDTH - 1;
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end entity;

architecture rtl of single_port_rom is

	-- Build a 2-D array type for the ROM
	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t;

	function init_rom
		return memory_t is 
		variable tmp : memory_t := (others => (others => '0'));
	begin 
			tmp(0) := std_logic_vector(to_unsigned(0, DATA_WIDTH));
			tmp(1) := std_logic_vector(to_unsigned(2088, DATA_WIDTH));
			tmp(2) := std_logic_vector(to_unsigned(0, DATA_WIDTH));
			tmp(3) := std_logic_vector(to_unsigned(2088, DATA_WIDTH));
			tmp(4) := std_logic_vector(to_unsigned(0, DATA_WIDTH));
		return tmp;
	end init_rom;	 

	-- Declare the ROM signal and specify a default value.	Quartus Prime
	-- will create a memory initialization file (.mif) based on the 
	-- default value.
	signal rom : memory_t := init_rom;

begin

	process(clk)
	begin
	if(rising_edge(clk)) then
		q <= rom(addr);
	end if;
	end process;

end rtl;
