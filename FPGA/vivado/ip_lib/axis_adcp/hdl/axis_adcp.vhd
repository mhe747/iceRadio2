--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;
--------------------------------------------------------------------------------
entity axis_adcp is
generic (
	C_ADC_WIDTH				: integer := 14;
	C_AXIS_WIDTH			: integer := 16
);
port (
	axis_aclk				: out STD_LOGIC;
	-- Ports of Axi Master Bus Interface M_AXIS
	m_axis_tvalid			: out STD_LOGIC;
	m_axis_tdata			: out STD_LOGIC_VECTOR(C_AXIS_WIDTH-1 downto 0);
	m_axis_tuser			: out STD_LOGIC;
	-- ADC Interface
	ref_clk_in				: in  STD_LOGIC;
	adc_clk_in				: in  STD_LOGIC;
	adc_clk_p				: out STD_LOGIC;
	adc_clk_n				: out STD_LOGIC;
	adc_data				: in  STD_LOGIC_VECTOR(C_ADC_WIDTH-1 downto 0);
	adc_ovr					: in  STD_LOGIC
);
end axis_adcp;
--------------------------------------------------------------------------------
architecture arch_imp of axis_adcp is
--------------------------------------------------------------------------------
signal clk_g		: STD_LOGIC;
signal adc_raw		: STD_LOGIC_VECTOR(C_ADC_WIDTH-1 downto 0);
signal ovr_raw		: STD_LOGIC;
signal adc_clk_ddr	: STD_LOGIC;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
CLK_ODDR: ODDR
generic map(
	DDR_CLK_EDGE	=> "SAME_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
	INIT			=> '0',   -- Initial value for Q port ('1' or '0')
	SRTYPE			=> "SYNC" -- Reset Type ("ASYNC" or "SYNC")
)
port map (
	Q 				=> adc_clk_ddr,   -- 1-bit DDR output
	C 				=> ref_clk_in,    -- 1-bit clock input
	CE 				=> '1',  -- 1-bit clock enable input
	D1 				=> '1',  -- 1-bit data input (positive edge)
	D2 				=> '0',  -- 1-bit data input (negative edge)
	R 				=> '0',    -- 1-bit reset input
	S 				=> '0'     -- 1-bit set input
);

CLK_OBUF: OBUFDS 
port map (
	I				=> adc_clk_ddr, 
	O				=> adc_clk_p, 
	OB				=> adc_clk_n
);

CLK_BUFG: BUFG
port map (
	I 				=> adc_clk_in,
	O				=> clk_g
);

process(clk_g)
begin
	if(clk_g = '1' and clk_g'event)then
		adc_raw			<= adc_data;
		ovr_raw			<= adc_ovr;
		
		m_axis_tdata	<= STD_LOGIC_VECTOR(resize(SIGNED(adc_raw),C_AXIS_WIDTH));
		m_axis_tuser	<= ovr_raw;
	end if;
end process;

axis_aclk		<= clk_g;
m_axis_tvalid	<= '1';
--------------------------------------------------------------------------------
end arch_imp;
