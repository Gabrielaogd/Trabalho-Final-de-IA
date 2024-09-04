
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
        
        load "data/3g5sA.pdb", protein
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
 
        load "data/3g5sA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [305,314,68,315,248,293,1023,271,287,273,274,910,1039,272,59,241,225,230,231,232,906,914,226,899,2617,78,365,385,2622,2624,76,382,75,79,71,67,58,60,62,216,215,217,224,390,391,396,2626,409,2623,2625,1025,1026,1027,1638,1639,1640,1641,1642,2572,2578,2609,2610,2612,2615,2650,2376,1018,1017,1019,1020,1000,1010,1006,1005,1008,1035,2649,56,2611,2614,2616,483,2608,2613,2362,2357,2355,2358] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [2339,2335,1616,2149,2150,2151,1618,1208,2337,2349,2350,2353,2356,2358,2338,2336,1648,1649,1650,1651,1653,1652,2116,2121,2122,2124,1686,1703,1647,1687,2611,2608,3000,2153,2152,2154,1612,1613,1614,1615,1621,1622,1617,1640,1642,1626,1627,1630,1631,1632,1220,1226,2114,1671,1673] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [1484,1485,1948,1952,1953,1957,1947,1430,1813,2104,2235,2239,2240,2234,2248,1963,1491,1494,1496,1498,1949,1490,1483,1459,1456,1783,1784,1530,1529,1531,1533,1524,1525,1528,1519,1786] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2977,1198,1177,1193,1200,1226,1174,1156,1165,1167,1173,2395,2953,2394,2409,2412,2933,1147,2946,2947,2948,2950] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [1988,1989,2073,2008,1987,2007,2009,2074,2940,2947,2949,2090,2091,2084,2088,1224,1237,1233,1240,2977,2112,2969,2971,1254,1256] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [2892,2894,2891,2893,2895,2014,3036,2038,2039,3034,2015,2016,2017,1255,2055,2994,2997,3017,3044,1256,2306] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [2844,2863,3050,524,525,526,2843,2831,2832,3007,3043,3011,3014,493,495,3029,474,3010,500,503,497,502,473,496] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1566,1534,2205,1694,2101,2120,2173,1247,2214,2131,2241] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [3003,2154,481,2611,482,483,2608,3000,3001,3004,2613,409,414,410,411,420,421,415,424,397] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [582,583,613,540,595,542,543,418,685,571,585,570,2634,507,505,508,509,2655] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [520,521,522,535,561,2634,499,502,2657,2660,2653,2654,2655,2656,2679,2676,571,570,3248,2850] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [1270,1271,1290,1292,3048,3055,3060,3072,3066,3142,1291,3021,2290,2291,3023,3024,3022,3029,3051,3110,3113,3114,3152,3150,3112,3139,3140] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        