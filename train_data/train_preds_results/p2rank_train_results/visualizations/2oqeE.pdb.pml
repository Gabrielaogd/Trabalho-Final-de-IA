
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
        
        load "data/2oqeE.pdb", protein
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
 
        load "data/2oqeE.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [23560,23600,23602,24190,23533,23561,23563,24182,24187,24188,24191,24192,24195,23594,23534,23518,23565,23566,23562,23564,22155,22159,22160,22165,22166,22154,22157,22158,22141,24189,24198,24201,24203,24429,24202,22150,24251,23400,24674,24675,24654,24656,25973,24441,25975,24442,24199,24250,24418,24232,24407,26056,26057,24411,22167,22171,23418,23419,22168,22170,23584,21863,21868,21873,21874,21901,21905,21856,21898,21895,21896] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [21388,21394,21400,21401,21587,21589,21399,21408,25624,21588,21590,21591,23149,23151,21383,21384,21369,25661,21690,25659,25660,25662,25671,25669,21412,21409,21410,25633,25635,25636,23150,23138,23140,23161,25658,21849,21845,21851,25602,25603,25604,21411,25605] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [24517,24623,24513,24510,24531,24545,23473,24464,24466,24638,23444,23445,23430,23446] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [25310,26161,26162,26163,25286,25287,25288,25289,24820,25002,25004,25006,25182,24986,24987,24988,26147,26150,26151,25330,25331,25309,25294,25296] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [22485,23472,23474,24465,23463,23464,22472,22473,22465,23461,24449,22337,22313,22316,22318,22319,24453,24463,22320,22457,23501,23503,22323,22305] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [23337,25625,21407,21411,21416,25599,25605,25595,21159,23328,23330,21454,24735,21425,21426,21429,25578,25580,25596,25597,25600,21408] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [23473,24464,24466,24467,24638,22655,23445,23442,24623,24513,23450,23464,22465,22611,22614] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [25433,25438,25406,25410,25436,23478,23479,23476,24664,25409,25452,23406,23412,25405,23423,23424,23428,23422,25442] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [24134,24119,23899,23900,23916,23917,23918,23665,23666,23677,23681,24273,24275,24277,23669,24379,24299,24274,24272,24395,24396] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [25602,25790,25793,25751,25750,25780,25781,25661,25660,25662,21790,25652,25655,25629,25745,25743] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [24662,25987,23422,24643,24646,25985,23423,23424,24549,25400,25401,25403,24664,25409,23406,23412,25405,25406,25966] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [21142,23085,23087,23088,21490,21144,23209,23213,21491,21496,21500,21501,21499,23023,21133] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [25487,25769,25486,25800,25802,25803,25084,25524,25526,25514,25516,25765,25807,25767,25763] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [23584,21865,21866,21867,21872,21873,21874,23587,23589,23765,23836,23837,23847,23831,23833,23772,21880,21882,23830] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [21155,21156,21392,21412,21173,23106,23108,23122,23189,23190,23125,23205] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        