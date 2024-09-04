
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
        
        load "data/2gagB.pdb", protein
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
 
        load "data/2gagB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7703,7704,7705,7706,7732,7735,9161,9779,7739,7744,9177,9167,9008,9009,9010,8998,9001,9002,9003,9004,9005,9017,9047,9048,9049,7699,7707,7695,7696,7722,7723,7731,7471,9019,7658,7468,7470,8796,7693,7672,7694,7667,7649,7650,7651,7655,7656,7657,8781,8789,8793,7670,7661,7664,9522,9780,9783,9018,7659,9021,9022,8792,9159,9160,9521,9501,9996,10024,7708,7711,7713,7493,7482,9999,7738,7753,7490,7491,7479,7486,7474,7478,7476,9977,9798,9797,9163,9789,9979,9982,9983,9965,9985,9986,9987,10344,9351,9353,9355,9961,9800,9806,9832,9803,9805,10357,9804,10329,10331,10332,10354,9992,9993,9994,9991,7492,7494,7495,9966,9968,9846,9950,9947,7756,9995,7803,7877,7878,9988,9989,10013,10014,7760,9295,7757,7759,7776,9835,9839,9830,9831,9833,9809,10359] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [9742,9743,9191,9192,7718,9759,9760,9429,9763,9765,9766,9761,9764,8598,8599,8600,9415,9401,9402,8609,8610,8618,7751,7752,9430] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [9420,9682,9709,9710,9184,9197,9438,9635,9612,9613,9727,9721] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [9309,10320,10321,10322,10323,8220,8222,8195,8161,9307,8116,8160,9306,8189,8156,8158,8185,8187,8188,8183,8184,9308,8106,8109,8111,9291] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [8598,8600,9415,9383,9398,9400,9401,8618,8627,8628,8047,8045,9384,9388,9391,9394,7283,7284,7286,7312,8590,8586] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [9570,9592,9594,9595,9596,9597,9455,9450,9451,9448,9449,9447,9332,9335,10349,9565,9569,9567] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [8649,8650,8652,7359,8768,7678,7681,7346,8653,7676,7674,7668] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [9676,9422,9674,9710,9221,9222,9223,9224,9685,9249,9248] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [7577,10056,7586,7587,10081,7573,7574,10084,10054] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        