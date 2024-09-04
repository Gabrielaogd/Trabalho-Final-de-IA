
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
        
        load "data/2wycB.pdb", protein
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
 
        load "data/2wycB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1747,1748,1750,2615,1483,1485,1480,1481,1484,1564,1720,1735,1721,2592,1701,2622,2623,2811,2812,2621,2584,1858,2822,2823,2824,2825,2821,2832,1315,1462,1758,1838,1839,2583] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [4893,4327,4326,4892,4287,4291,4324,4288,3893,4319,4321,4373,3911,3914,4370,4371,4907,4480,4481,4405,4315,3624,3630,3668,3636,4896,3644,3645,3639,3640,3643] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3653,3654,4885,4886,4887,4884,4889,4897,4896,4898,5057,5059,4958,4943,4945,4946,4948,4954,4944,5060,1310,1315,1471,1467,1468,1475,1469,3444,3442,3443,3445,5056,4961,1483,1476,1477,1481,1486,1492,1858,1856,4882,4883,4894,4895] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1512,1513,1514,5044,4789,5040,4793,1496,1540,5319,5321,4805,5257,5259,5001,5037,5038] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [4986,4987,4988,5029,5030,5031,4229,5016,5015,5009,4767,4270,4269,4655,4685,4686,4228,4989,4990,4696,4698] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [4966,4963,4881,4883,4260,4270,4299,4908,5030,5031,4967,4775,4745,4959,4877,4949] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        