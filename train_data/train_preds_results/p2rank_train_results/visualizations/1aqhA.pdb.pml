
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
        
        load "data/1aqhA.pdb", protein
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
 
        load "data/1aqhA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1347,1216,1355,1920,1695,1696,1918,1919,1921,1210,1211,1212,1213,1214,1215,1181,1962,1346,1348,1708,1710,1678,1675,2484,2536,2537,2547,2548,2538,2539,2540,2541,2542,2543,1902,1904,1903,498,499,2485,2486,2487,500,502,1671,513,1369,1370,1356,516,448,455,456,457,459,462,464,458,460,461,2943,2944,2945,463,879,1672,880,1185] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2637,2638,2641,2642,2645,2648,2649,2688,3226,2608,3142,3198,3201,3202,3203,3210,3214,3224,3205,3087,3084,3085,3204,3206,2687] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3270,3272,3855,3858,3861,3864,3867,3871,4188,273,3245,3825,3863,3865,3870,3269,4155,4156,3243,3244,3247,3248,272,261,266,268,271,3271,3321,4176,4177,3874,3320] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1319,1410,1418,1122,1123,1124,1402,1722,1726,1749,1304,1305,1308,1320] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2966,3129,2972,2981,2983,2984,94,95,98,2958,2959,2960,2961,602,121,124,599,117,601] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2801,2804,2384,2390,3371,3372,3370,3366,3367,3368,3369,23,22,2386,2797,2798,2393] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2810,2807,2059,2801,2804,2805,2806,2808,2392,2809,1862,2058,22,15,20,2798] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1989,1994,1990,1993,2027,1987,2366,2369,2380,1926,2108,2351,2356,2365,1930] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        