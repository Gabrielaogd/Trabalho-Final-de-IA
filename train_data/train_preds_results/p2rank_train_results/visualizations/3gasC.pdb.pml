
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
        
        load "data/3gasC.pdb", protein
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
 
        load "data/3gasC.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5697,5759,5755,5844,5845,5847,5849,5850,5239,5732,5737,5716,5717,5730,5742,5743,5875,5888,5874,5886,5887,5872,5873,5896,5744,5852,5269,5897,5898] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [5725,4540,4566,4567,5753,5734,5751,5752,5754,5212,5213,4411,4412,4413,4536,4537,4538,4533,4535,4134,4545,4543,4401,5738,4406,5721,5731,5735,5728,4389,5726] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [4552,4521,4221,4224,4225,4226,3983,4496,4053,4023,4024,3986,4498,4049,4301,4074,4088,4048,4050,4057,4029,4216,4217,4220,4213,4107,4300,4302,4527] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [5299,5301,5663,4678,4712,4713,4680,4649,4681,4684,4685,4686,4651,5659,5660,5670,5796,5797,5798,5799,4654,4917,4920,4921,4922,4942,4919,5787,5786,4647] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [4879,4884,5465,5466,5467,5469,5470,4948,4949,4960,5625,4950,4970,4973,4966,5441,5443,5445,5433,5464,4898,5434,4953,5436,5432,5435] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [4127,4131,5856,4100,4126,4130,4132,4121,4123,4098,4125,4573,4124,4608,4571,4582,4609,4133,4134,5839,5852,5854] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [4880,4881,5606,5608,4979,4985,5030,4989,5011,4861,5029,4867,4868] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        