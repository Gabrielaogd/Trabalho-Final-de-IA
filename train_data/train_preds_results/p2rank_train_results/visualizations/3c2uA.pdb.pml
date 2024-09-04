
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
        
        load "data/3c2uA.pdb", protein
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
 
        load "data/3c2uA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4168,4169,4175,4176,4177,4178,4179,4180,4154,1290,1292,1526,608,792,796,829,830,799,1280,4152,1701,1705,1707,1714,1546,1698,1544,1545,1713,1528,1529,603,607,606,1053,1054,117,118,119,2051,2049,2378,250,251] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [3368,3369,3513,3601,3614,3616,3336,3337,3338,3615,3679,3680,3718,3535,3700,3585,3517,3087,3467,3070,3071,3072,3080,4247,4263,4261,3078,4246,3660,3661,3663] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [2830,2828,3211,2833,2704,2705,2688,2693,2682,404,389,392,407,2666,2679,393,375,380,383,386,2662,2665,420,328,330,413,311,66,73,77,78,61,79,81,3185,3210,3212,4408,4407] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [142,151,1088,660,1092,1089,647,633,639,642,644,147,1583,1585,1586,136,2066,1577,1588,1591,1605,1592,2078,2082,2085,2136,1065,1562,1563,1564,132,628,1069,2061,1080,1082,1571] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [3817,4375,4350,4351,4352,3810,3812,3992,3993,2724,4373,4377,2731,2733,3829,3830,3831,3253,3256,3832,3991,3958,3964,3965,3966,3989,3252] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [336,337,339,340,181,182,183,206,411,412,353,2672,2642,2674,941,933,943,205,427,425,426] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [4092,4082,4084,4086,3621,3633,3636,3627,3630,4054,4056,4057,3458,3459,3898,4094,3474,3622,3623,3671,3672,4049,4050,4033,3686] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [4139,4148,4151,4155,779,4158,3431,3443,3444,3445,3446,3447,569,570,573,3437,3111] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [2031,4165,1712,1714,4167,4110,4116,4104,4112,4164,4166,4168,4169,4132,1721,1723,2302,2305,2306,2304] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [439,441,2824,2822,2820,278,291,292,433,437,436,462,2826,2860,2896,461,2838,2809,2861,2900,2801,2803] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [2701,2816,2817,2699,2815,2845,2740,2843,3175,4361,2844,2743] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [779,3445,3446,3447,3111,570,573,560] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [1731,1730,1949,1511,1512,1513,1936,2538,1914,1952,1954,1962,1963] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [2114,2132,2135,2130,2450,2451,2452,2454,1606,1614,1615,2455,2449] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [1025,1033,1028,1026,825,832,838,1197,1199,814,816,1196] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        