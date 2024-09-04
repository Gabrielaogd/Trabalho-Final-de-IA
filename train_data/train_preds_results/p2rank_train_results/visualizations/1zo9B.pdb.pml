
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
        
        load "data/1zo9B.pdb", protein
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
 
        load "data/1zo9B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7380,4386,4387,4388,4481,4483,4414,4415,7378,6488,7376,7377,3975,7375,7388,6491,6492,6493,6495,6498,6505,6681,6682,6508,6518,4357,4356,4332,4339,4485,6481,5986,4335,4476,4480,4479,4475,4482,4484,6477,6478,6480,5985,5987,7008,6470,6475,5984,6500,6501,7014,7023,7024,6705,7027,4333,7030,7051,7052,4470,4471,4564,7055,7068,7069,7018,7081,7064,7065,7078,7079,7020,7115,6429,6009,6012,7062,4599,4601,7070,7071,7074,7075,7076,7015,5282,5951,5976,5953,5954,5956,5958,5949,5957,5977,4450,5920,5924,5952,5922,5925,5959,7106,5961,5989,5933,5935,5047,4656,4658,4380,7381,5344,5345,3966,3967,7365,4376,5341,4152,4154,4358,6665,4366,4368,4372,3996,4175,4176,4143,4144,4118,4135,4136,4137,4138,3905,3928,3929,4100,4102,4132,4133] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [7409,7414,7417,7353,7354,7355,7356,4967,7418,7372,7373,5229,5256,5257,5258,7401,4956,4957,4965,4954,4955,4959,4960,7404,5980,7405,4988,4989,4990,5192,5193,5189,4964,4962,7352] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [6406,7119,7123,7153,6375,6376,6348,6374,7154,7089,7098,7099,7120,7122,6327,6315,6322,6353,6351,6340,6346,6407,6382] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [4526,4528,4529,4507,6527,4342,4508,4510,4511,6524,6525,6528,6529,6523,6526,6666,6646,6647,6649] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [5455,5456,5458,5296,5299,5335,5337,4434,5301,5489,5490,5485,5487,5488] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        