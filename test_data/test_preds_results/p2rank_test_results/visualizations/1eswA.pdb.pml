
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
        
        load "data/1eswA.pdb", protein
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
 
        load "data/1eswA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1184,1182,1502,1503,1178,831,832,867,868,869,1467,411,793,795,797,833,835,404,409,410,484,486,434,1199,1201,1202,1228,1229,1205,1186,1206,1209,1470,836,834,837,866,838,1488,1490,1487,524,401,532,538,539,540,541,542,543,398] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [454,455,456,3222,2407,2411,2787,2788,2789,2415,2417,453,1744,1755,2992,3214,3849,3219,3220,3221,3777,3778,3796,441,2804,3203,2990,2786,2802,2409,3213,2073,2090,2092,2094,3795,2093,2096,2098,2095,2097,1993,3792,452,440,1758,2111,2110] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [2938,2939,2957,2885,3121,3122,3123,2894,2895,3138,2941,2944,2956,2859,2860,2861,2862,2863,3070,3071,2793,2797,2816,3058,3059,3100,2817,2818,2823] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [1096,1098,1101,1104,1089,506,508,1811,1814,2233,2234,2235,2236,2237,2238,2275,2277,1849,1850,1135,1138,1878,1879,1848] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [2991,2992,3016,2800,2801,2806,3760,3307,2987,2988,2990,3069,2989,2802,2980,3230,3231,3271,2976,3273,3345,3235,3266,2035,2037] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [1557,1596,1599,1586,1587,1584,590,592,916,918,1548,982,1588,602,591,623,640,624] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [2346,2358,501,2314,2322,2284,1727,382,2356,1736,1739,390,512,391,490,494,495,496,2286,379] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1047,1049,1482,892,894,1460,1461,926,927,1020,1021,1024,987,988,989,992,922,985,1016,1018,917,919,924] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [1992,1993,2600,2001,2074,1994,2016,2000,2801,2809,2815,2811,2813,2417,2419,2437,2439,2440] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1573,1574,1576,1036,1038,1571,1572,1580,1585,1080,1067,1069,2317,2337,2339,1581,1031,2347] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3956,3703,3710,3957,3955,3545,3542,3719,3540,3973,3975,3948] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [447,406,764,3841,525,95,97,111,378,110] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        