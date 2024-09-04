
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
        
        load "data/3rjuA.pdb", protein
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
 
        load "data/3rjuA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [533,2077,2278,2281,2283,2275,1930,1927,1940,510,2403,543,1883,1884,1886,529,509,491,1797,1466,1514,1878,1879,1880,1881,1896,1538,1874,1875,1876,1882,1513,1540,1575,1576,1577,1521,1516,506,2467,2578,2579,2580,2582,2584,2581,2583,2570,490,2569,2567,1819,242,1855,1856,1858,240,2565,2566,1841,1842,1815,224,226,2073,2075,2076,2506,1941,2513,2518,2519,2288,2296,2380,2381,2394,2090,2072,2088,2485,2487,2488,2564,2558,2298] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [968,1281,1283,1284,1286,1287,1300,1301,1302,1277,1278,1054,1055,1056,1060,1062,1065,1335,1781,1760,1089,1072,2426,2428,1053,967,1035,1037,976,977,979,978,1092,1075,1086,1779,501,502,1766,2270,2411,1285,925,2415,2417,2414,2419,2420,2421,2422,2423,2424,2425,2671,2416,1064,2669,2667,2668,2177,2178,2186,2187,2196,2202,2197,2204,2208,2210,1271,2174,2171,2175,2233,2291,2253,2254,2401,2402,2209] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2365,2363,2370,2385,2329,2330,2241,2312,2315,2331,2378,2223,2217,2218,2220,2703,2728,2382,2384,2725,2214,2708,2294,2402,2399,2381] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [546,554,555,911,1350,1351,2263,876,1376,1377,553,581,567,2265,877,879,660,659] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [348,350,351,1679,2612,460,471,2447,1665,1655,422,455,353,208,423,2597,1828,212,2606,2598,2601] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2457,2605,2590,141,2469,2696,2666] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1419,1422,1425,1106,1107,1108,1382,1383,1429,1358,1363,1767,1753,1771,1755,1100,1133,1104] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [143,141,114,330,208,2591,217,149,2605,144,198] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [2111,2113,1243,1248,868,869,668,888,897,898] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1467,1441,1465,1440,1476,1582,1583,1598,1574,1585] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        