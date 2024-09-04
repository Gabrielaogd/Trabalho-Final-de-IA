
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
        
        load "data/2cwhB.pdb", protein
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
 
        load "data/2cwhB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2836,2843,2845,3838,3859,3860,3849,3831,3846,3848,4090,2878,3372,3374,3875,4409,4411,4412,4413,4407,3383,3386,2846,3368,3380,3367,2820,3794,3401,3403,4766,4767,4768,4739,4758,4719,4720,4732,4738,2814,2816,2819,2831,2821,4754,4757,4761,3834,3839,3663,3823,3824,3827,3818,3843,3845,3847,3564,3567,4081,4078,4086,4106,4108,3790,3792,3793,3796,3799,3791,3803,3806,3807,3777,4735,3664,3546,4427,4428,3555,4362,3559,3552,3553,3554,3387,3393,3678,3679,3680,3532,3359,3772] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2760,3407,3410,3412,3413,3439,3445,3470,3471,4809,2800,2547,2548,2754,2777,3156,3155,2729,3203,2757,2749,2750,2751,2752,2753,3422,3154,3179] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [4282,4284,4285,4286,4287,4292,4293,4294,3336,3330,3110,3331,3332,3337,4437,4438,4440,4441,3123] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3128,3130,2954,4389,2967,4346,4388,2958,3129,4439,4440,4441] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2791,4869,4872,4873,4799,4867,4833,4875,2786,2812,2829,2830] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [4524,4561,4562,4560,3482,3483,3484,4581] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        