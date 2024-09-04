
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
        
        load "data/1wrvB.pdb", protein
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
 
        load "data/1wrvB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3558,3559,2768,3975,3978,4296,4301,3813,4286,4289,4005,2595,2743,4293,4294,3828,3829,3989,3992,4000,4004,3996,2580,2582,3593,4300,2593,3071,3089,3069,3590,3592,3807,3810,3811,3803,3797,3798,3809,3821,3814,3815,3816,3477,3823,3614,3587] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2516,2518,2519,2522,2524,2475,2384,2458,2459,2461,2462,2469,3118,3121,3123,2321,2329,2343,2363,2436,3087,3089,3286,3086,3287,3256,3257,2579,2581,2582,2563,2564,3568,2517,3105,3106,3116,3117,3255,3119,3569] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [4313,3352,4312,4314,4538,4537,4566,2611,2612,2627,2629,2632,2635,4299,4500,3327,3329,3325,3326,3328,3330,3331,3333,3336,2618,3053,3054] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3339,3367,4302,4304,4327,3374,3369,3373,4305,3400,3403,3695,3698,4277,4328,3399,3366,3397,3706,3821,3696,3697,3694] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [3067,3309,3065,3305,3310,3281,3283,3292,3299,3308,3319,3312,3070,3071,3089,3286,3069,3066,3068,4300] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2610,4292,2628,4529,4295,2690,2693,4290,4005] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2563,2564,3568,2516,2519,2524,3569,3570,2549,2521] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        