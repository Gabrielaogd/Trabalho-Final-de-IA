
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
        
        load "data/2rkmA.pdb", protein
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
 
        load "data/2rkmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [235,246,3215,3216,3217,3253,241,2970,3008,1979,1980,1812,1829,1831,2982,3009,1828,2974,3378,3384,3387,3392,2165,3375,3379,3380,255,2166,2167,3925,3926,239,243,1278,3388,3389,247,248,253,254,283,284,285,1971,1959,1960,1962,1963,1954,1957,1965,1949,307,4069,4077,4088,4081,1970,1972,3956,261,142,143,144,149,150,1804,277,276,1276,1285,1267,4089,1270,1262,1263,1269,1277,4067,122,4097,128,3365,2566,3475,3484,3359,3360,3371,2212,3373,3349,2234,3276,3277,3540,3289,3522,3541,3542,3287,3546] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [901,931,930,932,1169,902,968,969,906,3506,908,913,915,3489,3491,3492,3467,3468,3469,3643,905,3504,3505,3640,3648,3671,3663,1178,3681,3436,1209,3732,3611,3612,3614,3610,3645,3646,3649,3639,910] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [78,79,80,82,97,4186,4187,4188,4189,65,77,4001,1936,1937,1912,95,1910] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [853,852,849,854,845,840,3227,3260,3250,175,218,3284,3286,3285,3287] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [1698,1,1688,1689,2,3,6,1718,388,393,377,381,4125,4131,4132,373,431,436,11,12,13,1720,394,384] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [649,647,683,668,677,678,679,1339,1340,700,699,1320,722,723,1326,1330,1335,710,1323] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [398,409,415,424,1240,423,407,1238,1239,4064,4065,405,4057,4072,406,1267,3413,2615,3410,1243,1241,1242] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [2488,2504,3931,1968,1981,1979,3946,2197,2199] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2356,2357,2358,2380,3830,2389,2387,2788,2789,2790,2791,2821,2822,3834,2678,2679,2680,2719,2674,2720,3836,3838] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1232,1233,1229,1231,482,504,561,497,483,485,480,489,477,1196,530] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [2414,2418,2420,2425,2399,2530,2426,2429,2698,2694,2696,2697,2763,2691,2735,2762,2531] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [877,3502,3514,3517,991,992,871,842,845,837,838,805,810,816,819] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        