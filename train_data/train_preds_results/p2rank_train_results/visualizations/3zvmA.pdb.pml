
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
        
        load "data/3zvmA.pdb", protein
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
 
        load "data/3zvmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1789,1790,2604,1786,1792,1793,1794,1813,2172,1965,1966,2556,2557,1960,2159,1819,2171,2166,1953,1955,1956,2164,2493,2525,2488,2490,2457,2496,2500,1795,2531,2497,2534,2498,2499,2555,1825,1818,2900,2571,2576,2605,1799,1801,1805,1814,1812,2156,1802,1804,1834,1820,1824,1831,2837,2838,2841,2842,2871,2872,1826,2844,2845,1862,1628,1836,1873,2817,2937,2939,2459,2460,2461,2458,2935,2803,2821,2813,2818,2815,2832,2835,2822,2823,2824] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [590,1264,586,228,231,1260,1262,1132,1259,233,587,898,583,908,909,214,581,1290,213,215,1131,226,227,904,1282,1270,1271,1288,1134,1137,1266,1255,897,1289,2979,2983,2991,2987,2988,2989] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1132,233,264,1232,1190,1215,1217,1406,235,401,1129,232,1248,1253,1255,1241,1155] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1955,2164,1996,1997,1998,1999,2163,2002,2165,2240,2671,2186,2187,2193,2194,2195,2670,2171,2215,2211,2214,2213,2238,2173,2179,2252] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2368,2377,2379,2363,2393,2677,2679,2680,2681,2682,2364,2381,1781,1783,2385,1784,2639,2648,2644,2676,2388,2641,1774] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [230,325,326,716,324,327,341,342,337,338,228,229,231,652,654,655,682,598,692,714,599,690] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [881,2891,2925,2927,2960,929,963,2918,930,931] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2,5,1033,1036,151,157,138,1016,1017,119,820,1018,1019,1,45,1009,140] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1100,1101,1085,1093,529,531,1102,497,515,1422,1424,463,1419] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        