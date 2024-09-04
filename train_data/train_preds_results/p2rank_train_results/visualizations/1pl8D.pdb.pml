
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
        
        load "data/1pl8D.pdb", protein
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
 
        load "data/1pl8D.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [10112,10113,10117,10120,10122,9601,10119,10131,9777,9611,9613,9618,9619,9609,9610,9770,9805,9769,9803,9462,9463,9626,9620,9624,9625,9627,10281,10276,10280,10268,10270,10442,10444,10447,10283,10267,10272,10273,8531,8532,8534,8535,8537,8539,8545,8547,8528,8533,10787,10785,8741,8742,8743,9434,9435,8752,10838,9134,10457,10458,10462,10463,10465,8643,8640,8642,9152,9153,8584,10452,10454,8662,8664,8665,8666,9599,10151,10144,10146,10147,10150,10145,9764,9775,9776,9915,9916,9917,9771,9761,9778,9980,9949,9950,9979,9937] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [9180,9247,8449,9249,9252,9121,9122,9123,9124,9176,9179,9119,9120,9254,9259,8447,8446,9263,9267,9270,9183,9118,8953,8939,8944,9240,9187,9209,9238,9233,9224,8400,8403,8404,8251,8265,8378,8390,8380] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [9501,9503,9515,9516,9482,10483,9055,9484,9485,9053,10485,9054,9056,9077,9078] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [9055,9484,9485,10485,9056,9085,10450,10446,10438,9514,9515,9516,9086,9078,9084,9077] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [10527,10556,10558,10560,9448,9449,9679,9684,9450,9473,9474,9475,9683,9703,9710,9502,9504,9709,9711,9701,9702] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [10263,10159,10315,10316,10424,10346,10425,10330,10331,10158,10317] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [10062,10060,10061,10226,10389,10363,10189] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        