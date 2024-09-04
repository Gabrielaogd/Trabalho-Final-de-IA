
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
        
        load "data/3hiyA.pdb", protein
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
 
        load "data/3hiyA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1090,1427,505,506,507,399,401,402,1051,1428,1429,1430,1432,2729,2726,1091,2671,435,1097,1121,407,403,404,405,406,1017,906,907,908,2743,2581,2582,2714,2715,2716,893,1079,1080,1050,1052,1055,1056,1060,1061,1062,1064,1065,1057,1058,2687,2694,1639,1640,1641,2686,2697,1617,1049,1043,589,1045,2254,2255,2287,588,621,622,2559,2560,2316,2288,590,602,604,603,1626,1628,1082,1646,1652,1655,1657,1417,1362,1363,1413,1414,1415,1416,2754,2728,494,492,1003,938,1280,1421,1422,1423,1424,1453,493,1312,412,487,482,1311] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [54,56,64,74,1879,1881,58,45,49,51,1909,1847,75,92,1264,3004,3006,1263,1937,1226,111,114,1901,1900,124,1848,1849,1850,1851,1877,1878] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [2080,2004,2006,2081,2005,1457,1437,1442,1444,1470,2001,2867,2868,1967,1969,2003,1447,1440,2654,1405,1407,1408] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [478,1281,1282,1284,1285,1313,1310,1308,3037,3036,1317,463,461,462,1276,1279,104,105,106,1253,1255,140] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [2080,2006,2081,1491,2031,2032,2126,1520,1993,1994,2085,2115,2121,1513,2118] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [2350,2386,2394,2356,2348,2354,2357,659,648,661,2388,2396,2470,2466,2442,649,635,2498,639,640,644,609,655,2359] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [2523,2502,2535,2506,2508,2511,2566,2260,2262,2259,2265,2524,2317,2318,2556,2290,2509,2291,2292] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [433,437,439,1150,153,193,194,189,190,456,416,186,215,391,154,155,148] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [2215,2707,2708,2216,1622,1631,1633,2243,2242,2211,2213,2241,2102,1597,1598,2138,2140,2110] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [1793,1794,1892,1895,1781,1782,1541,1542,1543,1921,1923,1924] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [660,661,2385,2387,2446,684,686,687,2418,2419,2420,563,564,567,546,721,612,647] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [965,810,268,946,948,303,809,819,787,786,807,944,301,953] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [3043,1937,1938,2930,2931,1290,2895,2894] 
set surface_color,  pcol13, surf_pocket13 
   
        
        deselect
        
        orient
        