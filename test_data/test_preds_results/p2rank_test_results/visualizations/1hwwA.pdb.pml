
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
        
        load "data/1hwwA.pdb", protein
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
 
        load "data/1hwwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [7204,7206,7701,1215,7682,7684,6356,6357,8107,8108,6377,7702,6379,7166,7171,7161,7707,1206,7256,7265,6553,1205,1227,6352,6353,7226,7172,7227,7228,7232,7235,7507,7510,7523] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.365,0.702]
select surf_pocket2, protein and id [4683,4669,4870,4871,4872,4685,4496,4516,4518,4247,4517,4495,4889,5923,5924,6046,4483,4484,4489,4493,4171,4157,4162,4163,4164,4172,4156,4159,4146,4152,7296,7297,7289,6029,6092,6094,6968,5927,6027,5918,5926,5935,5919,4688,4689,4691,5949,4713,5871,4201,4202,4204,4205,4206,6013,6014,4705,4711,6112,5884,5936,5885,7239,4173,4471,4472,7270,7271,7276,7282,4473,4477] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.361,0.902]
select surf_pocket3, protein and id [2573,1992,2020,1649,5733,3214,6873,6868,6871,6870,6869,3157,1993,2011,2571,2572,2578,2579,2580,2581,3707,3708,515,1455,1456,534,536,537,538,539,1472,3215,5732,2010,1999,2000,2017,2009] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.365,0.278,0.702]
select surf_pocket4, protein and id [3636,3595,3599,3623,3637,574,892,895,897,898,889,890,860,1133,1136,3625,891,934,3627,3592,932,571,573,575,861,3659,570,572,3660,3837,583,3638] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.576,0.361,0.902]
select surf_pocket5, protein and id [7966,7545,7567,7568,1314,7958,1313,1315,7980,1316,1317,1351,1355,7544,3589,3615,3616,3581,1295,3593,3627,1322,1293,1294,1282,1283,1286,1287,1288,1290,7553,7562,7564,7565,3551,3549,3552,3553,3583] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.533,0.278,0.702]
select surf_pocket6, protein and id [7005,7006,7007,7220,6057,6060,6061,7241,7249,7237,7239,7240,7217,4173,6051,6053,6054,6042,6041,7209,7210,7211,7213,7231,7190,7216,4470,4474,4479,4466,4469,4471,4472,7270,4473,4459,4451,6076,6044,6046] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.792,0.361,0.902]
select surf_pocket7, protein and id [8092,8093,8115,8116,8117,1907,29,1856,1858,1870,10,1897,7,11,13,15,12,1900,1569,8104,8110,8113,8097,1559,1896] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.702]
select surf_pocket8, protein and id [275,263,264,1987,2042,251,1976,1977,2044,241,2083,2084,2066,267,2045,1992,2243,2240,1993,2241,2230,2229] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.792]
select surf_pocket9, protein and id [7148,7101,7102,7104,7108,6397,6398,7112,7115,7116,7093,7094,7095,7091,6588,6590,6591,6592,6595,6596,6597,6602,6315,6317,7151,6292,6293,6294,7119] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.533]
select surf_pocket10, protein and id [4225,4239,4240,4195,4196,4158,4179,4182,3393,3394,4155,4151,3875,3877,3855,3856,3905,3907,4137,4138,4139,4141,3873,3879,3884,3903,3906] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.576]
select surf_pocket11, protein and id [6389,6393,6410,122,116,117,120,6438,6413,6523,6524,3096,3099,3118,3102,150,148,112,3093] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.365]
select surf_pocket12, protein and id [6126,4736,4733,4791,4792,5976,5977,5982,5983,5984,5989,6108,5964,6124,4210,6951,6952,6110,6112,5995,4707,4708,4719,4721,4729] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.361]
select surf_pocket13, protein and id [7187,7752,7178,7181,7180,7045,7740,7741,7742,7723,7769,7185,7041,7191,7038] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.365,0.278]
select surf_pocket14, protein and id [2588,2590,602,2577,2586,2578,2581,515,537,539,642,643,548,557,644] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.576,0.361]
select surf_pocket15, protein and id [2730,2731,2057,2389,2545,2423] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.533,0.278]
select surf_pocket16, protein and id [1516,1421,1245,1271,1279,1540,1542,1551,1276,1278,1116] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.792,0.361]
select surf_pocket17, protein and id [190,6464,189,6451,193,1668,3201,210,1667,6471,3179,3172] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.702,0.278]
select surf_pocket18, protein and id [5986,5972,5973,5988,6193,5981,6153,5633,5634,5812,6192,5611,5612] 
set surface_color,  pcol18, surf_pocket18 
   
        
        deselect
        
        orient
        