
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
        
        load "data/1wvmB.pdb", protein
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
 
        load "data/1wvmB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5430,4817,4821,4822,4823,4827,4901,4913,4914,4915,4656,5766,5411,5412,4820,5739,4802,5732,5734,4804,4670,4672,5749,5736,5760,5764,5757,5758,5763,5753,5755] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [3613,3615,3606,3610,3611,3594,3601,3588,5784,3612,3614,3853,3852,3348,3349,3355,3851,3855,4060,4067,3857,3854,3856,3881,3599,3869] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [4683,4762,4764,4766,5720,5722,5724,5705,3719,3131,3134,3714,4761,4763,4765,3150,3725,3716,3717,3718,3712,3135,4760,4697,4743] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [5777,4270,4261,4264,4266,4272,4503,4276,4253,4254,4066,4074,4076,4077,4318,4079,4060,4064,4065,5784] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [5172,5428,4477,5167,5168,4461,4426,5376,4592,5403,4469,4473,5375,4484,4486,4478,4472,5764,4590,4591,4593,5766] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [5395,3172,3166,3160,4770,4782,4614,3151,4759,3163,3170,3155,3167,4611,5745,5746,4776,4781,5542] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3613,3615,3610,3611,5756,5752,5763,5783,5784,5791,5753,5754,5755,4060,3612,3614,5760,4270] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [4321,4322,3939,4088,4122,4123,4124,4071,4073,4074,4075,4076,4064,4067,4069,3896,3857,3888,3891,3894,3932,3936,3927,3930,3892,3893,3895] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3613,3606,3610,5756,5757,5758,4657,4661,3601,3605,3588,3586,3587,5753,5754,5755,4656,5734,5735] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        