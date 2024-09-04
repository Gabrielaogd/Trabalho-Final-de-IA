
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
        
        load "data/1r9oA.pdb", protein
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
 
        load "data/1r9oA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1393,1395,2084,2085,2086,2108,2063,599,600,2054,1394,1384,1419,1566,1387,597,1600,1362,1624,2088,2090,2091,2113,2116,2117,2118,626,628,631,636,3141,3146,3151,3153,3194,3200,3203,3204,3205,3212,3210,2092,2124,2093,3262,1158,2067,2087,2065,2071,3242,3213,3215,3237,791,792,793,1425,3512,3513,3515,1414,1415,1421,1416,1408,1497,535,537,538,1417,1420,1568,645,646,647,553,564,565,566,567,1411,1541,1496,1543,2616,2617,2642,2643,2644,2645,2637,625,513,3186,635,3147,3148,3160,3183,692,2641,532,2662,544,1482,1484,1483,539,545,543,550,541,542,546,3523,3536,2137,2143,2144,2602,2606,2607,2608,2609,2120,2558,3142,2562,3270,2557,2555] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [296,83,277,298,299,300,301,1462,1464,336,2804,337,326,335,2803,295,318,322,320,2630,2819,2820,2651,525,528,529,544,1450,1451,1452,539,545,540,530,531,3516,3518,142,146,147,148,169,168,111,1468,177,82,123] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3126,2446,2448,2536,2537,2447,2508,2561,3128,3129,2526,3071,3219,3228,3244,3154,3221,3222,3224] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [815,816,817,1902,1903,776,775,753,755,1875,1877,747,749,750,784,1841,740,1868,824,825] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [131,132,2849,2577,2877,2879,125,128,3480,155,156,161,183,153,151,152,154,127,2589,3481,2584,2955,2956,162,163] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2110,1080,2131,1077,1082,1109,1084,1087,1089,1369,1333,1368,1370,2111,2102,1335] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2851,363,371,2853,2874,2889,2887,183,184,369,366,368,206,205,212,213,2849,2896] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        