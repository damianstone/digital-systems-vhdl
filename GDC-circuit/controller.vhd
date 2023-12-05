library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROLLER is 
  port (
    start, reset, clk : in STD_LOGIC;
    AeqB, AltB : in STD_LOGIC;
    selA, selB, loadA, loadB, loadGCB, done : out STD_LOGIC;
  )
end CONTROLLER;

architecture BEHAV of CONTROLLER is
  component DATAPATH 
    port (
      reset, clk, selA, selB, loadA, loadB, loadGCD : in STD_LOGIC;
      AeqB, AltB : out STD_LOGIC;
      Ain : in STD_LOGIC_VECTOR(7 DOWNTO 0);
      Bin : in STD_LOGIC_VECTOR(7 DOWNTO 0);
      GCD : out STD_LOGIC_VECTOR(7 DOWNTO 0));
  end component;

  type state_type is (init, loadData, compare, updateA, updateB, done);

  
  
end BEHAV;