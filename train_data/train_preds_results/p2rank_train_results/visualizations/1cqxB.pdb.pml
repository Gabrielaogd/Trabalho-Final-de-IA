
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
        
        load "data/1cqxB.pdb", protein
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
 
        load "data/1cqxB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3838,3869,3870,3903,3840,3511,3622,3619,3839,3912,3914,3915,4192,3911,3910,3641,3642,3643,3645,3650,3618,3351,3376,3968,3969,3995,3349,3342,3937,3938,4142,4144,4140,3898,3905,3906,3900,3343,3313,3287,3315,3673,3674,3677,4164,4133,3669,3672,3675,4111,4113,4162,4166,4167,4135,4137,3668,3497,3858,3502,3499,3509,3510,3475,3507,3476,3806,3807,3808,3783,3773,3775,3665,3667,3754] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [6232,6233,6234,6235,6236,6084,6085,3632,3635,3636,3797,3798,3799,3800,6229,6239,6245,6217,6226,3770,3772,3773,3774,3667,3631,6121,3693,3767,3766,6190,6211,6191,6111,6113,6114,6050,6049,3611,3613,3614,3640,3630] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [5990,6016,6220,6222,6224,6225,5991,5992,5993,5177,5180,5182,5199,5192,5196,6195,6203,6204,3767,3765,3766,3768,6193,6196,6211,3791,3792,3797,3799,6229,6217,6226,5161,5162,5160] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [4245,4273,5137,5148,5150,4283,4279,4282,3820,3821,5161,4637,5156,5158,3788,3790,3791,3792,5140,4588,4636,5183,4614,4616,5182,4593,4274,4275,4589] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [4325,4340,5149,5151,3844,3860,4253,4254,4255,4256,4345,4346,4347,4348,4355,3849,4358,4360,4356,3861,3855,4357,3863,3876,3878] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4762,4999,5003,5004,4930,4929,4786,4785,4770,3519,3532,4763,4764,4977,4980,4986,4992] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [6253,4769,4770,4771,4776,6250,4793,6251,6252,6267,6268,4642,4777,4788,4895,6269,6270,6273,4905,4909,4783,4785,6272,4908,4762,5003,4930,4933,4786] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [5281,5283,5479,5480,6317,5478,5861,5869,5484,5730,5491,6066,6062,6063,6064,5868,6041,6042,6095] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3382,3383,3384,3386,3515,3590,3353,3527,3424,3426,3591,3356,3357,3380,3390,3522,3523,3531,3534,3540,3542,3521,3526,3543] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3861,3879,3855,3500,4738,4357,3863,3878,3904,4355] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        