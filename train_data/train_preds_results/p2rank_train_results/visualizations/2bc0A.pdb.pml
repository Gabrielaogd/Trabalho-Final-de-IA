
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
        
        load "data/2bc0A.pdb", protein
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
 
        load "data/2bc0A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2089,2091,2093,1230,2375,2377,1227,1238,993,1229,1138,1140,1116,2501,2504,2376,458,478,1218,1442,1443,1444,471,475,1440,1225,2510,1433,1435,1463,479,483,1472,1470,484,1462,1464,2719,990,2374,982,987,2116,2117,2119,981,983,986,2118,1002,1004,397,398,399,1003,2370,2133,2139,2141,209,210,211,216,219,221,455,456,457,208,407,417,405,406,401,404,453,2511,2512,2515,490,467,468,469,452,491,489,204,977,980,226,195,196,389,390,391,395,396,375,384,2534,985,193,2140,743,746] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1643,2836,2795,1645,1649,1651,2476,2477,2680,2687,2495,2689,2700,2703,2422,2496,2498,2508,2509,2510,1654,1652,1653,2481,2491] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3570,3256,3257,3271,3275,3276,3303,3457,3255,3249,2967,2969,3459,3499,3500,3214,3258,3559,3560,3561,3259,2968,3447,3511,3547,3455,3514,3448,3549] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [8,9,10,265,595,241,271,2571,239,261,263,23,26,28,29,34,15,52,294,2540,2541,218,220,598,600,596,597,599,215,242,238] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2548,2549,2550,2675,3293,2677,2686,2674,2690,2695,2693,2694,2669,2520,2521,2528,2685,3323,3350,3320,3321,3322,3326] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [458,478,1218,1442,1443,1444,1225,1433,1435,1463,2089,2091,2093,1230,2377,1227,2501,456,457] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [1653,1425,1418,1419,1421,1422,1416,2073,2070,1591,1590,1605,2077,1654,2075,1635,1638,1639] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2496,2498,1653,1425,1422,1654,1432,1434,1444,2481,2491,2836,1638,2495] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [2401,2404,2667,2668,2666,2669,2663,2655,2269,2548,2675,2544,2545,2546,2553,2559,2403,2578,2291,2665] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1049,2077,1410,1863,1591,1590,1592,1596,1597,1856,1844,1851,1857,1860,2073,2076,1032,2075,1033] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        