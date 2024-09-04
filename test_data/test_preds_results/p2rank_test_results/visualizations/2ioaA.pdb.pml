
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
        
        load "data/2ioaA.pdb", protein
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
 
        load "data/2ioaA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2392,2557,4134,4135,4139,2568,4662,4598,4698,4700,4599,4664,4673,4682,2998,2988,2990,2991,4667,4668,4669,2562,2561,3028,2592,2593,2594,2992,3019,3020,2989,1756,2410,4649,4650,2499,4488,4632,4644,4648,2497,2501,2498,2500,2502,4388,4391,4403,4408,4686,4691,1781,1757,4693,1727,1774,2508,2509,2510,2511,2512,2530,2531,2532,3807,3808,2496,4098,4127,2549,4129,4130,3367,3368,2550,2551,2548,2553,3030,4370,4141,4638,4647,4642,4643,4180,4181,4105,4165,4140,4104,4096,4164,4082] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [2360,4535,4537,2821,2823,2824,2372,2361,2341,2343,2329,2338,2339,2340,2357,2862,2350,2859,2354,2797,4530,2820,2004,577,2012,2039,2334,4548,4539,449,2011,1973,2010,575,238,241,4549,235,236,239,217,177,196,2852,195,2851,341,445,451,342,436,446,230,234,431,432,2801] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [292,293,296,307,476,477,865,309,471,863,252,308,295,302,864,246,255,259,1016,1017,1018,1015,457,458,462,469,343,240,241,877,478,869,838,832,825] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [1443,556,1984,1986,3918,542,543,3916,555,554,633,3887,3889,1983,2018,557,3910,3876] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [3401,3703,3707,3709,3691,3664,3675,2275,2276,2279,2280,3741,2271,2273,2240,3731,3737,3744,3648,2245,2243,2323,2321,2308,2310,2320,2311,2312,3696,3701] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [2549,4129,4130,3001,3367,2551,2975,3389,3372,2548,2998,2990,4667,4668,4669,2562,2992,4139,4131,4289,4290,2973,2958,4149,3418,4138,2974,4665] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [765,567,1357,1358,424,1360,407,408,409,425,411,752,753,413,1340,1346,755,1353] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [286,285,115,117,98,272,185,189,203,273,317,352,353] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2782,2783,2784,3082,3054,2610,2603,2632,2633] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [2472,1500,1463,1474,1466,1452,1455,1460,1929,1930,1932,3936,3938,3923,3925,2468,2456,2465,3922] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3859,3861,3964,3965,3969,3833,3871,3868,4011,4012,4013,3980,3979,3978,4026] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2522,3786,2364,3757,2003,2040,2363] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        