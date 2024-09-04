
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
        
        load "data/3c67B.pdb", protein
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
 
        load "data/3c67B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8992,9173,9174,10004,10005,10006,10007,9128,9129,9130,10010,10012,10008,10009,10011,9146,10032,10051,11447,11450,10050,11436,11434,11431,11432,11433,11435,11437,11497,8499,8606,8558,8539,8540,8536,8542,8541,8544,8545,8547,8637,8600,8601,8602,8603,9108,9100,8546,8548,7525,7526,7527,7522,7524,8999,9104,9127,11953,11955,11498,8560,11842,11843,11925,11922,11923,6265,6264,6244,6245,6246,6243,8622,8635,8636,11974] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.353,0.702]
select surf_pocket2, protein and id [8691,8692,9248,8719,8720,9249,12023,12027,12054,12056,12065,12064,12053,9214,11125,11126,11127,11120,11579,11580,11576,11575,11600,9212,10510,9276,9273,11609,11610,11606,10546,10547,10534,10545,10569,10536,8718,11129,11131,11134,10502,11137,11139] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.388,0.361,0.902]
select surf_pocket3, protein and id [7227,11832,11834,11808,11816,11817,6224,6225,6276,6277,6279,6278,6227,11935,6269,11934,6303,6228,6232,6247,6235,11833,11924] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.396,0.278,0.702]
select surf_pocket4, protein and id [9934,9975,9971,9973,9974,9976,9955,10080,10091,10102,10098,10100,10266,10269,9983] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.631,0.361,0.902]
select surf_pocket5, protein and id [7896,7898,6510,6526,7881,7559,7583,7584,7468,7466,7895,6534,6532] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.584,0.278,0.702]
select surf_pocket6, protein and id [8430,9017,6535,9022,9034,9091,6534,9090,7483,7500,9092,8432,8431,8433,7564,7578,7561,8429,7905] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.875,0.361,0.902]
select surf_pocket7, protein and id [9146,9131,9135,9145,9621,9061,9062,9063,9064,9065,9129,9622,9627,9636,8912,8921,8922,9138,9048,9049,9056,9112] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.627]
select surf_pocket8, protein and id [9479,9480,9552,10709,10731,10738,10739,10705,10728,9550] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.682]
select surf_pocket9, protein and id [7928,7925,6987,8416,8417,8421,8422,8424,6976,6977,7950,7948] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.439]
select surf_pocket10, protein and id [10248,10260,10265,10266,10269,9913,9938,9935,9915,10264,9934,9975,9976,9955] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.439]
select surf_pocket11, protein and id [7534,7535,7536,7279,6253,8533,8532,7255,7204,6254,6217,6198,6199,6215,7196,7312] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.310,0.278]
select surf_pocket12, protein and id [6066,6067,8111,8112,6827,6781,6945,6946,6928,6929,8113,6796,6779] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.522,0.361]
select surf_pocket13, protein and id [8129,8130,6347,6348,8175,8738,8751,8754,8398,8471,8762,8752] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.502,0.278]
select surf_pocket14, protein and id [8355,8376,8346,8353,8512,6308,6136,8385,11942,11943,11944] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.765,0.361]
select surf_pocket15, protein and id [8627,10040,10452,11523,10038,11450,10039,11451,8624,11973,11514] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.690,0.278]
select surf_pocket16, protein and id [11049,11057,11367,11368,11369,11045,11046,11385,11028,11021,10842] 
set surface_color,  pcol16, surf_pocket16 
   
        
        deselect
        
        orient
        