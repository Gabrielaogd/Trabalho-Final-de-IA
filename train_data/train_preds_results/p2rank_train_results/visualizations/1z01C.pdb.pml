
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
        
        load "data/1z01C.pdb", protein
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
 
        load "data/1z01C.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8565,8567,8704,8705,8706,8726,8561,8566,9116,9118,9119,9120,8915,8917,8918,8966,8967,8515,9193,8517,9139,8558,8559,9207,9234,9235,9238,9719,9720,9721,8699,9071,9086,9070,9079,9089,9092,9297,9317,9318,9729,9208,9750,8698,8590,8592,8543,8946,8968,8683,8681] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [8505,9987,10026,9807,9808,9847,9848,9922,9940,9834,9836,8533,8534,8535,9966,9967,8536,8549,9947,8501,9986,9924,9919,8554,8513,9775,9806,9809,9774,8499,8506,8507,8582,9776] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [10184,10224,10225,10226,7514,10161,10164,10162,10165,10166,10168,10182,9372,9395,9373,9388,9389,10189,10185,10186,9396,10304,10305,9365,7299,10310,10311,10307,10309,10255,10301,10314,10326,10338,10325,10333,7516,10254,10253] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [8122,8124,8824,8856,8822,8077,8120,8093,10071,10095,10096,8853,10078,10080,8119,8133,10097,10098] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [7190,7192,8372,8382,7208,7950,7198,7201,7948,8389,7209,7210,8386,9618] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [8021,8006,8015,8018,8023,8028,8029,8030,10126,10130,10122,10135,10138,10121,10118,7118,8019,7460,7316,7317,7331,10158,7459,7461,10141,7324,7323,7442,7443,7444] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [9851,9857,9841,9853,9870,9871,9891,9893,8475,7058,7081,9859] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [10035,6990,9995,9996,9975,10037,6989,6952,10003,10002] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        