LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
ENTITY DATAPATH IS
    PORT (
        reset, clk, selA, selB, loadA, loadB, loadGCD : IN STD_LOGIC;
        AeqB, AltB : OUT STD_LOGIC;
        Ain : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Bin : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        GCD : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END DATAPATH;

ARCHITECTURE BEHAV OF DATAPATH IS

    -- -------------- COMPONENT DELCARATIONS -----------------------
    COMPONENT MUX
        PORT (
            sel : IN STD_LOGIC;
            a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            c : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;

    COMPONENT REG
        PORT (
            clk, load, reset : IN STD_LOGIC;
            d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT COMPARATOR
        PORT (
            a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            altb, aeqb : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT SUB
        PORT (
            a, b : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
            y : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0));
    END COMPONENT;

    -- internal signals for each arrow (output of component) from the diagram
    SIGNAL m1, m2, r1, r2, s1, s2 : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    mux1 : MUX PORT MAP(selA, sub1, Ain, m1);
    mux2 : MUX PORT MAP(selB, sub2, Bin, m2);

    reg1 : REG PORT MAP(clk, loadA, reset, m1, r1);
    reg2 : REG PORT MAP(clk, loadB, reset, m2, r2);

    sub1 : SUB PORT MAP(r1, r2, sub1);
    sub2 : SUB PORT MAP(r2, r1, sub2);

    compare : comparator PORT MAP(r2, r1, AltB, AeqB);

    GDC <= r1 when (loadGCD == '1') else (others => 'z')

END BEHAV;
