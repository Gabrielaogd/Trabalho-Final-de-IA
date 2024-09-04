
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
        
        load "data/1xtbA.pdb", protein
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
 
        load "data/1xtbA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1652,1645,1660,1646,1650,1655,2813,2842,2843,2134,2137,2138,2133,812,4056,4057,4058,4059,766,783,4035,743,1654,4036,2107,789,2115,796,1661,764,765,1254,1272,1638,1260,1263,4084,1686,4114,1685,1257,1710] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [3980,653,3975,3979,627,649,650,652,2904,2905,2906,4008,4013,616,3972,3974,4030,4031,4040,3951,730,733,735,679,736,4038] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [3765,478,479,3432,3779,3780,3403,3764,436,3412,449,452,313,311] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [3060,3061,3426,3484,3485,3417,3700,3702,3703,3704,3705,3701,3096,3133,3136,3137,3138,3425,3447,3444,3446,3473,3474,3475,3476,3111,3104,3105] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [3274,3275,3278,3256,3260,3344,3262,3295,3369,3331,3332,3334,2703,2701,2718,2720,2695,3346,3371,3372,3037,3044,2707,2708] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [819,2364,2366,2406,853,2405,820,822,852,854,884,885,851,2434,691,695,901,886,2436] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [3438,478,479,3442,249,251,311,309,310,3463,246,452] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [2790,2792,3899,2666,2667,3902,2652,2826] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [2883,2887,2888,2866,2886,2889,2868,4066,757,4048,4049,4050,4074,4064,2878,2880] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [3194,3188,3759,3934,2654,2544,2550,2524,2546,2585] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [542,343,540,344,515,539,2471,2484,2472,575,2473,549,551,327,345,348,463] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [2094,2120,950,2096,949,2104,2109,2110,972,914,913,2098,2099,971] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [3172,3173,173,192,175,177,494,2617,3174,3175,2619,3735,3732,3161,3168,3169,3726,3722] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [1106,1105,2269,2271,2275,2282,2288,2263,2268,2287,1047,1076,1079,1067,1069,1071,1072] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [3912,2161,2144,2783,3915] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        