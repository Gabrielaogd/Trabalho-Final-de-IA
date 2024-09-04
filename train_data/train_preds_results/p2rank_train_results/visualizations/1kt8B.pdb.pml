
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
        
        load "data/1kt8B.pdb", protein
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
 
        load "data/1kt8B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4544,4801,4802,4803,4798,4799,4800,4804,4796,4784,5009,5010,4819,4805,4545,3514,4533,4433,4434,4809,5373,4564,4432,3513,3525,3527,4055,4057,4509,4510,5380,5384,5385,3692,3718,5011,5021,5024,5012,5030,5031,3131,3132,4074,5377,5378,5387,5391,5392] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [5398,5402,5403,5404,3559,5405,5729,4292,4300,4023,4287,4288,4024,4025,5697,5739,4322,4323,4325,4022,4303,4021,5668,5669,4338,5666,5663,5664,5665,5667,5700,5701,5702,5703,5704,5393,3544,5390,5406,4038,4306,4308,4304] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4089,4090,4233,4234,4235,4105,4074,4071,3508,3509,3510,3512,3495,3493,3494] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [4562,4563,4564,4698,4701,4679,4794,4432,4561,4591,4592,4593,4594,4803,4796,4433] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [5721,5780,5114,5115,5116,5089,5092,5093,5687,5686,5763,5802,5801,5084] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [4089,4233,4235,4105,4106,3386,3401,3494,3450] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [4429,4438,4439,4441,4442,4446,4466,4468,4471,4476,4477,4526,4528,4534] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [5406,3540,3642,5386,3536,3638] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        