
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
        
        load "data/3efvA.pdb", protein
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
 
        load "data/3efvA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1653,1657,1658,1659,1661,1666,1049,1689,1711,1544,1545,1525,1524,2835,2837,2838,2840,2054,2821,1656,1660,1805,1662,1665,2443,2470,2471,2439,2055,1814,1820,2820,1667,1685,1686,2833,2816,2834,2830,1086,1077,1062,1065,1074,1076,1308,2411,2440,2442,1087,1088,1089,1138,1066,1294,1279,1290,1291,1301,1300,2839] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [3237,721,1098,1100,3243,1099,2048,719,1096,691,694,663,688,689,2049,667,664,1122,1124,1097,1138,695,2011,2014,2010,3230,3232,3234,1980,2060,2059,1982,3235,3238,2055] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [1329,1361,1331,1341,1342,1356,1327,551,1383,1385,1363,1398,587,545,546,560,585,1332,547,548,549,550,578,1112,1333,579,482,522,705,1115,704,490] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [225,223,1368,1484,1476,1479,227,229,230,1482,1367,1445,1448,1473,1449,1463,252,1467] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1030,1495,238,1262,237,205,1509,1031,1542,1540,1569,1538,1554] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [3239,3272,3193,3194,3274,3233,3023,3231,2060,3174,3177,3180,3013,3172,3291,3294,3278,3284,3286,3288,3244] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [2938,2939,1880,2917,3093,3095,2944,3110,3125,2942,2945,2916,3111,3096,3043,3042,1866] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [1036,1251,1253,1145,1269,1134,1132,1139,1067,1133,1655,3368,1654,1642] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [2438,2444,2445,2448,2663,2659,2042,2040,2390,2377,2440,2401,2676,2680,2029,2851,2833,2476,2479,2439] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [2679,2689,2692,2693,2631,2633,2670,2369,2697,2265,2287,2363,2696,2241,2256,2246] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1980,2067,2070,3216,3227,3232,3034,1960,1856] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        