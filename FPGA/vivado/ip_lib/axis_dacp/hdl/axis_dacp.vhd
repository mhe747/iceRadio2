--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity axis_dacp is
generic (
	C_DAC_WIDTH				: integer := 14;
	C_AXIS_WIDTH			: integer := 16
);
port (
	axis_aclk				: in  STD_LOGIC;
	-- Ports of Axi Slave Bus Interface S_AXIS
	s_axis_tready			: out STD_LOGIC;
	s_axis_tdata			: in  STD_LOGIC_VECTOR(C_AXIS_WIDTH-1 downto 0);
	s_axis_tvalid			: in  STD_LOGIC;
	-- Ports of Axi Master Bus Interface M_AXIS
	dac_data				: out STD_LOGIC_VECTOR(C_DAC_WIDTH-1 downto 0);
	dac_clk					: out STD_LOGIC;
	dac_sleep				: out STD_LOGIC
);
end axis_dacp;
--------------------------------------------------------------------------------
architecture arch_imp of axis_dacp is
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
s_axis_tready		<= '1';
dac_sleep			<= '0';
dac_clk				<= axis_aclk;

process(axis_aclk)
begin
	if(axis_aclk = '1' and axis_aclk'event)then
		if(s_axis_tvalid = '1')then
			dac_data	<= s_axis_tdata(C_DAC_WIDTH-1 downto 0);
		end if;
	end if;
end process;
--------------------------------------------------------------------------------
end arch_imp;
