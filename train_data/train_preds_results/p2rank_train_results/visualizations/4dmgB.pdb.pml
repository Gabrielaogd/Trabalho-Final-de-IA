
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
        
        load "data/4dmgB.pdb", protein
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
 
        load "data/4dmgB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6102,6103,6105,5708,5709,5710,5395,5399,5401,6107,4699,6108,4678,4680,4682,4652,4660,4663,4657,5385,5383,5387,6085,6087,6089,6104,6106,3909,3910,3911,3912,4085,6078,4087,6080,4070,4071,4302,4086,4318,6012,6014,3885,3981,3997,4300,3914,3982,3926,3928,3930,3964,3965,3966,3968,3582,3609,3922,3932,3936,6066,3906,3300,6083,3319,4081,4082,4083,3572,3573] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [4705,5384,5385,4936,4938,5383,5387,4887,4906,4909,4899,4925,4926,4704,4677,4676,4680,4681,4682,4672,4679,4745,4668,4888,5368] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [4887,5046,5047,4906,4908,5385,5383,5387,4680,4681,4682,4655,4679,4654,5395,5399,5400,5401,5710,4888,5045,4890,5053] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [3615,3646,3648,3946,3751,3945,3266,3267,3268,3269,3271,3643,3921,3933,3935,6041,6057] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4892,4894,5253,5257,5526,5524,5525,5252,5248,5243,5244,5556,5392,5398,5400,5495] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [4664,4657,4658,4659,4630,4506] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        