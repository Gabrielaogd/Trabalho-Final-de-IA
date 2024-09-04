
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
        
        load "data/1g38D.pdb", protein
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
 
        load "data/1g38D.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6525,6526,7022,7024,7025,6524,6532,6706,7045,7048,5981,5982,5984,5986,5987,6687,6686,6005,6006,5983,5985,7006,7007,7015,5184,5146,5148,6994,5185,5182,5186,5190,5191,5195,7038,7040,7041,4695,4697,4953,5147,4971,5134,5135,5212,5213,4681,5423,5433,5435,5199,5200,5202,4937,4687,4690,4755,4756,4754,4686,4677,4678,4932,4933,6704,5964,7047] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [4393,4203,4204,4392,4208,4005,4019,4020,4215,4235,4192,4398,4400,4401,4527,4528,4529,4848,4849,4200,4993,4381,4530,4394,4520,4406,4430,4667,4668,4671,4672,4960,4961,4991,4008,4009,4010,4656,4026,4246,4655,4021,4547,4763,4764,4765,4768,4780,4812] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [4679,4010,4011,5417,4657,4658,4659,4655,5418,4677,4678,4663,4674,5415,5433,5434,5423,4681,4683,4684] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [6687,6696,6697,6184,6185,6684,6685,6686,6186,6188,5985,6524,6532,6531,6533,6530,5987] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        