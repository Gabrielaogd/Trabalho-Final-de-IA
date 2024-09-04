
        from pymol import cmd,stored
        
        set depth_cue, 1
        set fog_start, 0.4
        
        set_color b_col, [36,36,85]
        set_color t_col, [10,10,10]
        set bg_rgb_bottom, b_col
        set bg_rgb_top, t_col      
        set bg_gradient
        
        set  spec_power  =  200
        set  spec_refl   =  0
        
        load "data/1p4nA.pdb", protein
        create ligands, protein and organic
        select xlig, protein and organic
        delete xlig
        
        hide everything, all
        
        color white, elem c
        color bluewhite, protein
        #show_as cartoon, protein
        show surface, protein
        #set transparency, 0.15
        
        show sticks, ligands
        set stick_color, magenta
        
        
        
        
        # SAS points
 
        load "data/1p4nA.pdb_points.pdb.gz", points
        hide nonbonded, points
        show nb_spheres, points
        set sphere_scale, 0.2, points
        cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
        
        
        stored.list=[]
        cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
        lastSTP=stored.list[-1] # get the index of the last residue
        hide lines, resn STP
        
        cmd.select("rest", "resn STP and resi 0")
        
        for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
        
        
        
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [1128,1129,588,573,575,1119,1120,323,559,2025,222,260,263,292,293,294,481,587,319,321,2057,1677,1678,2056,295,320,2044,2055,2045,2046,2040,2042,2024,2021,2022] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1604,1605,1640,2440,2401,2391,2059,2062,2063,2035,2036,2037,2067,1926,2143,2144,2072,2073,2107,2177,2139,2142,2426,2427,2428,2429,2430,2431,2154,2425,2166,2167,1931] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2314,2320,2323,2324,2440,2325,2326,2400,2401,1163,1134,1135,1136,2030,2034,2036,2040,2041,2042,2024,2021,2022,596,597,1128] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [833,1024,2668,2669,1086,2661,2658,2659,1104,1118,1093,1094,1092,1120,556,558,560,323,555,557,559,807,808,507,509,554,498,516] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1405,1407,2192,1401,1402,1404,1406,1263,1265,2215,2216,1264,1266,1270,2214,2183,1368,1403,1273,1278,1279,1280] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2443,2444,2448,2450,2484,2451,2452,2481,2457,2417,2419,1326,1328,1329,1330,1361,1314] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1636,1638,1603,1604,1605,1639,1640,1652,1656,1580,1582,2054,1578,2059,2062,2063,1575,2048,1675,1677,2056,1661] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2309,869,2535,1177,1178,2002,2289,2513,200,181,1993,865,866,207,187,188,192,2534] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [279,1773,237,238,248,249,239,122,1812,1793,158,160,1776,1782,1786] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2222,2223,1469,1828,1830,1850,2219,2224,2252,2191] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        