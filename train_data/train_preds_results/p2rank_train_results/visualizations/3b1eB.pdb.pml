
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
        
        load "data/3b1eB.pdb", protein
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
 
        load "data/3b1eB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4645,4911,3495,4184,4185,4186,6230,3490,3498,3499,4901,4900,4884,5230,3986,3993,3996,3492,3501,5205,5225,5226,6120,4183,4194,4192,4193,4201,4003,4007,4008,4009,4016,6149,3506,5157,5166,5167,5158,5206,5204] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [4940,5609,4924,5634,5635,5636,5578,5613,5614,3865,3866,3867,5577,3862,4922,4942,3876,4984,4985,4970] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3513,5192,5202,5206,5189,5191,5207,5208,5195,5209,5210,5217,3511,3512,3514,3518,3308,3306,3307,3328,3346,3349,3351,3329,3551,3557,3534,5193,3352,3356,3359] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [6216,5925,5926,6175,6215,4368,5945,5943,6173,6176,6177,4414,4357,4362,4343,4370,5816] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [4312,4324,4325,6163,6164,6166,6170,6171,4160,6153,4217,6145,6152,4189,4172] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [5493,5482,5480,5517,5490,5491,5495,5496,5497,3726,3749,3731,3725,3727,3677,3750,3616,3615,3639,3642,3637,3638,3643,5524,5516,5518] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [6296,6295,3297,3298,3299,3284,3283,3288,3300,3293,3317,3383,3385,3316,3305,3384,3467,3382] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [6103,3404,6114,6121,3487,6108,6023,3491,3492,3490,6149,6025] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [4276,4034,4035,5409,5406,5407,4065,4275,4015,4011,4013,5426,5424] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        