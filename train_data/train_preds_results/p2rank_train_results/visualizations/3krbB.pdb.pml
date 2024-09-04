
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
        
        load "data/3krbB.pdb", protein
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
 
        load "data/3krbB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2555,2557,2558,2559,2560,2561,2562,2563,2572,2573,2541,4505,4489,4504,4584,2554,4506,4507,4508,4509,4511,4515,2569,2789,4152,4153,4154,4156,4187,4167,4147,4149,4148,4198,4200,4140,4333,4335,4337,4336,4548,4549,4550,4551,4552,4334,4576,4583,4199,4214,4222,4223,4116,4112,4113,4114,4120,4121,4125,4115,4117,4118,4805,4840,4842,4843,4844,4163,4132,4133,4161,4792,4145,4146,4137,2777,2779,3326,3327,2767,2768,3052,3336,2738,3914,4493,2765,4838,4839,4841,3463,3464,4853,3446,4856,3442,3443,3444,3448,3445,3447] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [3923,3927,4786,3980,3994,4014,3995,4015,4785,4900,4896,4898,3765,4893,3745,3989,3750,3766,3772,3763] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        