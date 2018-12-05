--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;
--------------------------------------------------------------------------------
entity axis_fir is
port (
	axis_aclk				: in  STD_LOGIC;
	-- 
	s_axis_tvalid			: in  STD_LOGIC;
	s_axis_tready			: out STD_LOGIC;
	s_axis_tdata			: in  STD_LOGIC_VECTOR(31 downto 0);

	m_axis_tvalid			: out STD_LOGIC;
	m_axis_tready			: in  STD_LOGIC;
	m_axis_tdata			: out STD_LOGIC_VECTOR(15 downto 0);
	m_axis_tuser			: out STD_LOGIC
);
end axis_fir;
--------------------------------------------------------------------------------
architecture arch_imp of axis_fir is
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
-- TODO: Implement CIC
-- Stub
s_axis_tready		<= m_axis_tready;
m_axis_tdata		<= s_axis_tdata(15 downto 0);
m_axis_tvalid		<= s_axis_tvalid;
--------------------------------------------------------------------------------
end arch_imp;
