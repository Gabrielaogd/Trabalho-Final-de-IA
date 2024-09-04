
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
        
        load "data/3djeB.pdb", protein
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
 
        load "data/3djeB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5346,5349,6193,6236,6397,6398,6399,5343,5344,6174,6179,5868,6181,5873,5874,5867,5882,3927,3929,4351,4352,3907,4348,4361,4347,4346,5542,5543,5544,5594,3879,4236,5540,5538,5539,5541,4234,4239,4240,5593,5595,5713,5714,4672,4652,4360,4423,4358,4397,4232,6779,6781,6785,6787,4350,4321,4322,5729,5730,5731,5556,5718,5345,5347,5348,5557,5559,4253,4331,3584,3595,6411,3592,3593,6194,6389,6400,5200,5204,5197,5187,5188,5193,5196,5194,5209,5227,5195,5238,5239,3585,3815,3816,3819,3820,3871,6178,3872,3811,3814,3805,3809,4949,4958,5210,3756,3597,6374,3580,3576,3577,3587,3591,3567,3568,3749,3750,3757,4955,4959,3565,3806,3807,3808,3755,4951,4952,6415,3870,3873,6419,3877,3878,6401,6413,3893,6433,6434,3892,6404,3898,3906,3840,5700,4702,4697,3894,3904,3900,4691,4676,4398,4400] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [6143,6995,6141,6993,6990,4753,4757,3828,3831,3834,6157,5668,6976,3835,3839,3841,3846,5384,5383,5641,5682,5658,5366] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [6049,6019,4558,6062,6082,6075,6076,6077,5606,5481,5690,5691,5604,5483,6084,5601,5602,4560] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [4769,5646,5647,4209,4172,4730,4182,4184,3862,4733,4735,4718,4719,5638,5651,5630,5635,5642,5625,5650,5502,4206,4208] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [6487,3644,3646,3667,3669,4133,6486,6458,6463,6466,4057,4053,4091,4092,4081,4089,4130,4131] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [6362,6288,6289,6290,6540,6541,6507,6291,5176,5155,5153,3543,3494,3493,3495,3655,3695,3697,6545] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [6731,6740,6732,6734,6735,6736,6737,6738,6739,5850,5769,5770,5771,5854,5326,5304,6750,6857] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [5284,5285,5304,5863,5325,5326,5853,5290,6740,6739,5850,5218,5217,5264,5268,5220,5219,5246,5221] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [6565,6550,6276,6281,6520,6523,6289,6290,6522,6562,6566,6568,6608,6609,6610,6611] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [6445,4009,6408,4007,4008,4006,4040,6432,3928,3926,3909] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [6574,6575,6601,6484,4057,4058,6494,6518,6488,6489,6492] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        