
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
        
        load "data/2g25A.pdb", protein
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
 
        load "data/2g25A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1404,1415,1416,1417,1418,1419,1662,1665,1672,1678,1413,1655,706,707,2797,2798,692,693,432,1629,1642,1643,433,2695,1663,1676,2795,1420,1423,1129,1130,1131] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.376,0.702]
select surf_pocket2, protein and id [413,414,702,703,704,706,707,2797,2798,1672,1678,2806,2807,2823,1676,1114,1129,1131,984,985,398,901,1116] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.392,0.902]
select surf_pocket3, protein and id [4451,4453,4454,4456,4478,974,1003,4479,1026,1016,1025,1000,1002,4480,982,1001,1115,1100,1117,1101,4448,4452,4747,4755,4460,4471,4473,4474,4477,1017,4753,4754,4762,4463,1118,1122,1113,4429] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.329,0.278,0.702]
select surf_pocket4, protein and id [2484,2491,2492,2479,2483,476,2448,2709,2710,2471,2932,1926,157,192,193,195,196,2943,2941,161,225,226] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.514,0.361,0.902]
select surf_pocket5, protein and id [2725,2753,2754,2894,2896,2930,2931,2932,2164,2167,2423,2425,2169,2417,2429,2430,2431,2179,2420,2422,2448,2708,2710,2446,2447,2686] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.471,0.278,0.702]
select surf_pocket6, protein and id [2457,1906,2456,2128,2130,2157,1940,2260,2261,2259,2166,2168,2436,2169,2409,2167,2154,2219,2258] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.698,0.361,0.902]
select surf_pocket7, protein and id [6296,6298,6261,6263,6513,6524,6518,6107,6293,6319,6321,6323,6324,6327,6559,6262,6526,6539,6471,6473,6527,6446,6247,5954,5955,6258] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.616,0.278,0.702]
select surf_pocket8, protein and id [1213,1214,1536,1532,1545,1547,3875,1534,1514,1515,1531,4098,4099,4105,4106,4097,4103,4090,3849,4030,3854,3864,3867,3868,4031,3872,3879,3885,3888,4092,4087] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.886,0.361,0.902]
select surf_pocket9, protein and id [6132,6137,6139,6140,6141,6127,6129,4579,6130,5945,5946,6120,4398,4399,4685,4686,4682,4684,4635,4364,4683] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.639]
select surf_pocket10, protein and id [6188,6189,6191,6192,6194,6195,5422,5424,5450,6283,5451,6275,6276,6278,6228,6229,5478,6288,6494,6496,6491,6289,6230,6232,6233,5411,5412,5100,5096] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.729]
select surf_pocket11, protein and id [645,1338,1358,646,2583,576,554,551,552,1377,1347,1332,2576,2578,2579,2580,2573,1359,1568,2544,1375,1571,1574,2607,2608] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.494]
select surf_pocket12, protein and id [1238,1239,1280,1281,3873,1542,1571,1240,1241,1242,1551,1572,1552,1554,1556,4047,3876,3877,3880,3881,1269,1270,1271] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.545]
select surf_pocket13, protein and id [954,1023,943,1032,1033,857,1035,1058,808,823,1050,1045,1046,1047,1056,944] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.353]
select surf_pocket14, protein and id [70,43,46,39,42,67,73,79,48,47,50,1974,1975,1972,1898,1949] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.361]
select surf_pocket15, protein and id [4374,4654,4348,4655,4372,4373,4375,4114,4115,4133,3732,4408,4132,3729] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.353,0.278]
select surf_pocket16, protein and id [1450,1452,1451,1119,1123,4430,1124,1127,1468,1466,1467,4427,1143,4428] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.545,0.361]
select surf_pocket17, protein and id [3132,3134,3096,3133,3093,3167,3170,795,802,3168,3166] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.494,0.278]
select surf_pocket18, protein and id [1080,3276,3277,4484,1081,3275,4234,4240,4486,1078,4233,4208] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.729,0.361]
select surf_pocket19, protein and id [5935,5923,5382,4802] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.639,0.278]
select surf_pocket20, protein and id [4152,4537,4154,4436,4468,4177,4179] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.886,0.902,0.361]
select surf_pocket21, protein and id [1108,1427,1387,1426,1107,1110] 
set surface_color,  pcol21, surf_pocket21 
   
        
        deselect
        
        orient
        