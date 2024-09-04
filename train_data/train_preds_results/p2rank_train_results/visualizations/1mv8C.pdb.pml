
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
        
        load "data/1mv8C.pdb", protein
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
 
        load "data/1mv8C.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7162,7170,7156,7166,7167,7261,7155,6609,7160,7163,7258,7260,7164,7253,7255,6604,7292,7294,7285,7287,6768,7319,7320,7057,6630,6632,7738,7178,7177,7183,6762,6756,6761,6763,6769,7038,6796,6797,7181,7182,7472,7467,7471,7175,7462,7466,7172,7173,6620,6621,6608,6751,6753,6624,6628,6636,6642,6640,6641,6622,7699] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [8183,8184,8185,8182,7724,7725,8166,8167,8168,8170,7708,8146,7820,7829,7830,7706,7714,8121,8153,7701,7704,7705,7707,7821,7702,7703,8204] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [8501,8480,8481,8498,8478,8479,8484,8472,8474,8476,8520,8523,8534,8536,8537,8540,8543,8794,8573,8486,9003,9004,9005,9006,8524,8509,8510,8516,8517,8500,8502,8504,8519,9719] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [7836,7965,7995,7788,7692,7687,7683,7458,7700,7704,7707,7718,7773,7813,7779,7781,7785,7784,7786,7787,7709,7826,7832,7837] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [8565,8589,8595,8598,8566,8590,8574,8997,8560,9055] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [8770,9065,8614,8796,8800,8797,8795,8539,9061,9062,8825,9101,9102,9103,9073,9074] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [8154,7472,7473,7467,7471,7699,7714,8120,8121,8153,6642] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [8520,8523,8534,8537,8540,8547,8524,8990,9079,9085,9563,8527,9565,9572,9003,8999,9568,9004,8994,9730] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [9760,9753,9790,9791,9810,9759,9636,9750,9751,9761,9765,9634,9655,9656,9699,9657,9800,9801] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [7967,7965,7788,7143,7144,7787,6686,6687] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        