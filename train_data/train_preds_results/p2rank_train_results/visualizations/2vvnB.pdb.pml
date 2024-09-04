
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
        
        load "data/2vvnB.pdb", protein
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
 
        load "data/2vvnB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7572,7573,7264,7265,7266,7574,7610,7570,7569,7571,7844,8037,8038,8039,8040,8041,8042,8064,7807,8063,7258,7539,7781,7782,7783,7787,7568,8089,6352,8322,8103,8104,6371,6373,7853,8111,8109,8808,8809,8100] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [10216,10228,10213,9843,9742,10115,10116,10117,10118,9898,9695,9696,9699,9701,9663,10122,10138,9750,10205,10209,10199,9832,9842,9384,9739,9740,9381,9694,9845,9848,9894,9895,9897,9689,9690,9691,9693,9840,9863,10211] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [6446,6736,6595,6632,6629,6630,6631,6391,6392,6414,6824,6799,6790,6420,6639,6769,6772,6647,6649,6397] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [8735,8733,8889,8892,8899,8745,8746,9126,9160,8707,9159,9125,8670,9162,9133,9134] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [9972,9974,9975,9976,10001,10003,9568,9570,9529,9530,9491,9039,9499,9513,8988,9515,8986,8983,9010,10005,10006,9998,10009,10011,10051,10052,10039,10040,10041,9999] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [6520,6495,8421,8423,6497,8592,8626,8627,8593,6522,6141,6142,6144,6143,5327,5326,6531,6519] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [6408,6412,6434,6437,6413,8341,9322,9319,8353,9285,9288] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [8368,8369,8370,6460,6462,8391,6522,9274,8634,8624,8629,8631,6495,6497,9273,9272,9261,9271] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [6053,6897,6898,6052,6882,5903,6049,7500,7501,7502,6856] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [6002,5987,5945,5821,5929,5823,5960,6230,5930,6229,5849,5850,5851] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [6523,5615,6521,6524,6873,6874,5580,5581,5582,6075,6872,6861,6862,5556,6111,6112,5590] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        