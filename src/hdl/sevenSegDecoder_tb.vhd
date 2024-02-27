----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2024 04:12:26 PM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
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

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is
    component sevenSegDecoder is 
        port (
            i_D : in std_logic_vector(3 downto 0);  -- Input: 4-bit data
            o_S : out std_logic_vector(6 downto 0)                  -- Output: 7-segment display control
            );
        end component sevenSegDecoder;

-- Declare signals needed to stimulate the DUT inputs
    signal w_sw : std_logic_vector(3 downto 0) := "0000";
    signal w_seg : std_logic_vector(6 downto 0) := "0000000";
    signal w_7SD_EN_n : std_logic := '0';

begin

-- Instantiate the DUT
    UUT : sevenSegDecoder
    port map (
        i_D => w_sw,
        o_S => w_seg
        
        );
        
-- Test Process
test_process : process 
begin
    w_sw <= "0000"; 
        wait for 10 ns;
        assert w_seg = "1000000" report "Failed for input 0000" severity failure;

    w_sw <= "0001"; 
        wait for 10 ns;
        assert w_seg = "1111001" report "Failed for input 0001" severity failure;

    w_sw <= "0010"; 
        wait for 10 ns;
        assert w_seg = "0100100" report "Failed for input 0010" severity failure;

    w_sw <= "0011"; 
        wait for 10 ns;
        assert w_seg = "0110000" report "Failed for input 0011" severity failure;

    w_sw <= "0100"; 
        wait for 10 ns;
        assert w_seg = "0011001" report "Failed for input 0100" severity failure;

    w_sw <= "0101"; 
        wait for 10 ns;
        assert w_seg = "0010010" report "Failed for input 0101" severity failure;

    w_sw <= "0110"; 
        wait for 10 ns;
        assert w_seg = "0000010" report "Failed for input 0110" severity failure;

    w_sw <= "0111"; 
        wait for 10 ns;
        assert w_seg = "1111000" report "Failed for input 0111" severity failure;

    w_sw <= "1000"; 
        wait for 10 ns;
        assert w_seg = "0000000" report "Failed for input 0100" severity failure;

    w_sw <= "1001"; 
        wait for 10 ns;
        assert w_seg = "0011000" report "Failed for input 0101" severity failure;

    w_sw <= "1010"; 
        wait for 10 ns;
        assert w_seg = "0001000" report "Failed for input 0110" severity failure;

    w_sw <= "1011"; 
        wait for 10 ns;
        assert w_seg = "0000011" report "Failed for input 0111" severity failure;

    w_sw <= "1100"; 
        wait for 10 ns;
        assert w_seg = "0100111" report "Failed for input 0110" severity failure;

    w_sw <= "1101"; 
        wait for 10 ns;
        assert w_seg = "0100001" report "Failed for input 0111" severity failure;

    w_sw <= "1110"; 
        wait for 10 ns;
        assert w_seg = "0000110" report "Failed for input 0110" severity failure;

    w_sw <= "1111"; 
        wait for 10 ns;
        assert w_seg = "0001110" report "Failed for input 0111" severity failure;

    wait;
    end process test_process;

end test_bench;
