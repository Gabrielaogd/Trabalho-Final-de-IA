
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
        
        load "data/2q3eL.pdb", protein
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
 
        load "data/2q3eL.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [40618,41977,41978,40624,40627,40628,41979,41456,41458,41376,41377,41378,41379,41103,40607,41431,41968,41970,41966,41963,41975,42754,41455,41457,41135,41137,41421,41405,41416,41418,42526,41374,41375,41370,41394,41391,41392,41398,41404,42522,42523,42524,42752,41446,41447,41053,41054,41079,41080,40636,40621,41441,39484,39466,39470,39472,42031,39478,40598,40599,40600,41436,41433,41440,41442,41448,41453,41454,41475,41476,40057,40370,40045,40048,40052,40039,40040,40044,40360,40365,40353,39482,40034,39463] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [39451,39632,39639,39640,39944,39943,40185,40041,40042,40182,40184,40220,40214,40241,40243,40212,40213,40215,40216,40187,39672,39670,40045,40048,40049,40050,40044,40034,40038,39454,39463,39462,39631,39633,39472,39474,42031] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [41064,41067,41515,41608,41646,41647,41649,41569,41037,41038,41039,41542,41514,41548,41585,41094,41096] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [40603,40604,40358,40587,40601,40602,40591,39506,40681,39504,40730,40875,40877,40878,40919,40677,40910,40703,40717,40704,40731] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        