----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2026 10:33:53 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
--  Port ( );
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is

    component sevenseg_decoder is
        Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    --i_Hex : in STD_LOGIC_VECTOR (3 downto 0)
    --signal w_sw1 : std_logic := '0';
    signal w_i_Hex : std_logic_vector(3 downto 0);
    signal w_o_seg_n : std_logic_vector(6 downto 0);
    
begin
	sevenseg_decoder_inst : sevenseg_decoder port map (
		i_Hex => w_i_Hex,
		o_seg_n => w_o_seg_n
	);

	test_process : process 
	begin

		w_i_Hex <= x"1"; wait for 10 ns;
            assert (w_o_seg_n = "1111001") report "error on x1" severity failure; 
		w_i_Hex <= x"A"; wait for 10 ns;
            assert (w_o_seg_n = "0001000") report "error on xA" severity failure; 
		w_i_Hex <= x"C"; wait for 10 ns;
            assert (w_o_seg_n = "0100111") report "error on xC" severity failure; 
		w_i_Hex <= x"7"; wait for 10 ns;
            assert (w_o_seg_n = "1111000") report "error on x7" severity failure; 
            
		wait; -- wait forever
	end process;	
	-- ---------------
end test_bench;
