
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
        
        load "data/2z6iB.pdb", protein
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
 
        load "data/2z6iB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3386,2498,3354,3384,3385,2497,2507,2844,2652,2511,2537,2492,3708,3709,3710,3712,3734,2490,2494,2565,3389,3392,3393,3395,3397,3046,2655,2659,2660,2661,2662,3204,3700,3697,2845,3695,3039,3042,3202,3203,2848,2849,3038,3043,3353,3380,3381,3382,3383,3377,3570,3571,3574,4435,3581,3370,3832,4310,4412,4398,4411,3831,3717,2510,2530,2531,2532,3713,3747,3716,4013,4395,4014,2518,4311,2520,4308,4417] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [4012,4013,4394,4395,4014,4106,4287,4303,4288,4289,4308,4109,4108,4252,4079,3952,3953,4011,3958,4072,4070,3397,3398,3997] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3642,3644,4560,4566,4568,4597,4598,4599,4602,4628,3643,3691,3641,3645,2352,2367,4572,4574,4575,2461] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3196,3063,3064,3181,3299,3301,3308,3309,3109,3138,3140,3083,3101,3065,3303,3062,3069,3180,3182] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2512,2513,2519,2522,2524,2698,2515,2542,2520,2521,2523,2646,2728,2650,2667,2652,2655,2663,2664] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2498,2507,2844,2651,2652,2511,3395,3397,3046,2654,2661,3039,3042,2848,2849,3038,2862,4311] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [3595,3610,3611,4611,3598,4555,4556,3599,4609,4590] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        