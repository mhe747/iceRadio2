--------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity spi_dev is
generic(
	DATA_WIDTH		: integer	:= 8
);
port (
	clk				: in  STD_LOGIC;
	-- SPI slave interface
	mosi			: in  STD_LOGIC;
	miso			: out STD_LOGIC;
	sck				: in  STD_LOGIC;
	ss				: in  STD_LOGIC;
	-- Registers interface
	reg_wr			: out STD_LOGIC;
	reg_rd			: out STD_LOGIC;
	reg_wr_data		: out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
	reg_rd_data		: in  STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0)
);
end spi_dev;
--------------------------------------------------------------------------------
architecture arch_imp of spi_dev is
--------------------------------------------------------------------------------
type sm_state_type is (ST_IDLE, ST_WORK);
signal sm_state		: sm_state_type		:= ST_IDLE;
signal rx_shift_reg	: STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
signal tx_shift_reg	: STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
signal sck_sr		: STD_LOGIC_VECTOR(1 downto 0);
signal load_reg		: STD_LOGIC;
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
process(clk)
begin
	if(clk = '1' and clk'event)then
		sck_sr		<= sck_sr(0) & sck;
		case sm_state is
			when ST_IDLE	=>
				reg_wr			<= '0';
				load_reg		<= '1';
				if(ss = '0')then	-- SPI dev selected
					reg_rd		<= '1';	-- read strobe
					sm_state	<= ST_WORK;
				else
					reg_rd		<= '0';
				end if;
			when ST_WORK		=>
				reg_rd			<= '0';		-- Clear strobe
				
				if(load_reg = '1')then		-- First cycle
					tx_shift_reg	<= reg_rd_data;
					load_reg		<= '0';
				elsif(sck_sr = "01")then	-- Rising edge
					rx_shift_reg	<= rx_shift_reg(DATA_WIDTH-2 downto 0) & mosi;
					tx_shift_reg	<= tx_shift_reg(DATA_WIDTH-2 downto 0) & '0';
				end if;
				
				if(ss = '1')then			-- End of transaction
					reg_wr_data	<= rx_shift_reg;
					reg_wr		<= '1';
					sm_state	<= ST_IDLE;
				end if;
		end case;
	end if;
end process;

miso	<= tx_shift_reg(DATA_WIDTH-1);
--------------------------------------------------------------------------------
end arch_imp;
