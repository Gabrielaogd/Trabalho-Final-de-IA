
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
        
        load "data/3thcA.pdb", protein
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
 
        load "data/3thcA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2362,2364,2365,2343,2367,3141,2350,506,519,624,633,643,645,521,646,601,3123,3136,3137,3139,3119,602,545,3127,3129,542,544,3108,3115,556,559,271,272,277,634,636,255,2334,3947,2352,3951,3941,3948,3915,3922,3958,2332,4407,4419,4404,4408,4550,4390,4578,4568,4569,4570,4577,4396,4400,4402] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1336,1767,1770,1625,1628,1773,1783,1784,1803,1631,1632,1776,850,1335,3689,3691,1358,864,2030,2393,2020,2021,1994,1993,1327,1973,1974,1995,1996,863,2274,2275,2276,2495,851,849,3688,3690,1667,1668,1669] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4095,3401,3417,4088,3418,4085,4087,3615,3173,3599,4094,3195,3586,3602,3584,2922,2923,2924,2925,2926,2912,2913,4092,3618,3174,2919,2920,4093,3409,3410,3583] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [2535,2544,4258,4857,2483,2529,2530,2556,4858,4859,4860,2569,2571,2538,4254,4256,2806,2808,2809,4874,2090,2092,4873,4875,2508,2484,2503,2105] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [3471,3497,3498,3499,3472,3476,3488,3491,2417,2421,2427,2431,3649,3650,3357,2052,2430,4459,4458,3370,4481,4479] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3353,3331,3776,2414,3490,3491,2408,2411,3480,3481,3705,3350,3352,3725,3731,3736,3738,3708,3729,2403,2405,3672,3706,2418,3775,3744] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1335,3687,3689,1331,1332,1355,1359,1360,1019,1366,1323,1327,1356,3693,3694,1371] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [872,875,855,844,257,467,487,234,235] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        