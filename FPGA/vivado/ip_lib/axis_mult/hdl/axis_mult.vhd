--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;
--------------------------------------------------------------------------------
entity axis_mult is
port (
	axis_aclk				: in  STD_LOGIC;
	-- 
	adc_axis_tvalid			: in  STD_LOGIC;
	adc_axis_tready			: out STD_LOGIC;
	adc_axis_tdata			: in  STD_LOGIC_VECTOR(15 downto 0);

	dds_axis_tvalid			: in  STD_LOGIC;
	dds_axis_tready			: out STD_LOGIC;
	dds_axis_tdata			: in  STD_LOGIC_VECTOR(31 downto 0);

	m_axis_tvalid			: out STD_LOGIC;
	m_axis_tready			: in  STD_LOGIC;
	m_axis_tdata			: out STD_LOGIC_VECTOR(31 downto 0);
	m_axis_tuser			: out STD_LOGIC
);
end axis_mult;
--------------------------------------------------------------------------------
architecture arch_imp of axis_mult is
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
-- TODO: Implement complex multiplier
-- Stub
adc_axis_tready		<= m_axis_tready;
dds_axis_tready		<= m_axis_tready;
m_axis_tdata		<= dds_axis_tdata;
m_axis_tvalid		<= dds_axis_tvalid;
--------------------------------------------------------------------------------
end arch_imp;
