
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
        
        load "data/1zu0A.pdb", protein
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
 
        load "data/1zu0A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3277,3278,3279,3280,3462,3463,3483,3335,3374,4118,4133,4132,165,815,816,818,814,817,246,248,1122,256,4131,3371,3369,827,1085,1086,1087,822,1108,1075,1076,1077,352,353,380,381,379,1105,1119,1099,1103,1109,301,813,825,865,867,870,1036,1038,1084,1049,1051,1052,1042,1044,3375,3370,3330,3334,3298,3325,3327,3368,3328,3303,3308,3309,3310,3302,374,3634,3633,3635,3637,3624,3701,3597,3603,3604,3605,3485,3117,3118,3119,3282,3283,3473,3486,3887,4100,4101,4103,4106,4108,4113,4116,4112,212,218,222,219,242,247,4110,4114,4115,235,239,184,190,192,207,208,225,224,2889,2890,2892,2895,2897,2891,2893,2894,2896,3114,4105,4107,1770,1774,4102,4104,65,69,70,3116,71,74,75,89,60,53,2886,1644,1645,1777,76,78,1628,2876,79,80,82,81,83,84,101,3260,3264,1974,3866,3867,3868,1970,3870,1978,1987,3257,3259,2913,2923,1989,3896,3873,3895,2912,3414,3459,3464,3449,3417,856,833,3373,3487,3491,3418,3415,3416,3410,3399,3465,3149,3150,3151,3470,193,3113,3104,3107] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2307,2319,1818,1924,1926,1827,1786,1788,1793,3873,3894,3895,1948,1950,2335,2336,1946,1947,1942,1989,2311,2313,3870,2331,2329,2330,2332,2318] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [3290,3292,2433,2435,3340,2400,2425,1975,1969,1972,1965,1980,3864,3865] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3181,3149,3150,3151,193,200,3123,3153,3156,3157,3449,3442,3446,3447,3448,3453,3459,189,190,172,815,818] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [348,3299,355,359,357,3291,3293,2434,3296,3297,3301,2425,347,1964,1965,3883,361,1958] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3635,3624,3626,3701,3702,3676,3309,2462] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3981,3927,3944,3978,3979,3980,3942,4041,4042,4044,3982,3988,4034,4035,4036] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [3293,2432,2434,3297,3301,2425,2424,1965,1969,3864] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        