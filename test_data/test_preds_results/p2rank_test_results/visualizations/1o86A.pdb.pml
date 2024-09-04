
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
        
        load "data/1o86A.pdb", protein
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
 
        load "data/1o86A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2795,2797,2805,2553,2556,2557,2559,2806,2771,2691,2709,2687,2694,994,2708,2748,2750,2825,2827,2828,3013,3014,3026,3015,3016,3017,2826,2970,3027,3867,3894,3826,3844,3845,3859,3860,3843,3846,2562,3896,2987,2991,2965,2988,2992,2993,1492,2547,2549,2550,2551,2552,3810,3815,3816,986,874,875,980,987,988,989,985,2867,2868,2583,2587,2564,2567,2576,2590,2933,2953,2586,2579,259,2580,2563,2578,190,192,193,196,217,342,2581,199,216,343,258,2535,849,847,247,249,2610,2611,2612,2968,2967,2969,164,155,156,401,402,159,160,162,153,2966,646,2941,163,687,641,643,648,653,95,93,422,424,817,788,814,846,812,813,818,819,822,694,695,696,816,686,666,683,693,376,377,373,431,432,674,824,351,3906,3943,3945,2793,2794,2796,3908,1985,1986,3309,3310,2772,2006,3051,3052,3072,3319,3320,3290,2792,2737,2763,2764,2765,3311,2762,2767,3289,1019,1026,2734,2735,2738,2739,2725,2710,2749,2740,2742,1935,2013,2014,2741,2003,2005,2008,1016,1047,2141,2730,3876,3878,3907,3909,3340,3342,3344,1964,1979,3805,3825,1937,1943,1944,1948,1039,1018,3277,3279,3280,2004,2027,2028,2030,3070,3071,3098,3099,2733,2134,2732,3281,3282,2129,2133,2116,3073,2112] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [783,692,695,696,782,816,686,688,1368,684,685,680,683,681,1400,1366,1367,1369,687,1436,1461,1463,1433,1453,1454,1370,1373,1344,1346,3853,3866,1491,1492,1493,1452,3851,3867] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [2541,868,872,874,875,980,878,882,989,2547,2549,3810,981,968,970,972,973,977,2542,2475,893,880,2526,2529,2537,881,2523] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [3243,3217,3220,3246,2112,2104,2099,3111,3112,3248,3251,3216,3247,3187,3281,3282,3185,3188,3109,3110,3192,3191,3280,2033] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [192,193,217,342,216,343,401,695,696,816,686,788,376,377] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2981,2987,2965,2988,2992,2993,4273,4274,4275,4276,4277,4278,1514,1491,1492,1482,1483,1485,1486,1487,2970,2973,2966,644,645,646,687,639,641,642,643,2968,2967,2969,670] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2293,4148,4149,4150,2272,3164,3129,3156,3154,3155,4147,3093,2301,3092,3131,3132,2787,2268,2269] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [3597,3636,1953,1193,1194,1958,3776,3594,3777] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4418,4019,4419,4429,4431,3986,3987,3990,4375,4377,4387,4388] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        