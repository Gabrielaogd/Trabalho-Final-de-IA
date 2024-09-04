
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
        
        load "data/1hpuD.pdb", protein
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
 
        load "data/1hpuD.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [13014,13016,15302,15323,14076,15685,13006,13015,13518,15474,13514,13520,13523,15997,15999,16001,13515,16036,13527,13493,15057,15058,15059,15061,15321,15096,15472,15473,15319,15462,15471,15318,15333,15435,15439,15467,15468,15469,15470,15486,13043,12792,13028,13029,13038,13040,12796,14380,14383,15440,12789,12794,13923,14077,15679,15684,13918,13489,13505,13517,13507,13508,13916,12457,12458,12460,12461,12769,13002,14091,14092,14370,12456,12474,14088,14079,14081,14082,14071,14074,14075,13864,13866,15301,15304,15306,15300,15998,16000,16008,15485,15981,15683,16037,15692] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [12475,14383,14384,12802,12810,15440,12817,12819,15408,14924,14925,12818,15436,15405,15407,15333,15439,15437,15438,12473,12564,12465,12467,12490,12491,14894,14895,12493,12504,12520,12525,12528,12524,12552,12516,12519,12513,12514,12515,15416] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [14223,14398,14409,14614,14222,14615,12552,12553,12519,12536,12538,14201,14205,14106,14619,14359,14361,14396,14397,14384] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [15476,15431,15475,15451,15460,12829,12834,12835,12841,12830,12833,16179,16171,16172,16194,16185] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [12676,14430,14445,12700,12701,12702,14548,14540,12392,14442,14443,14444,12374,12376,12683] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [14451,14453,13789,14450,14515,13790,12385,13806,12386] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [12423,12424,12446,12448,12596,12777,12920,12921] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        