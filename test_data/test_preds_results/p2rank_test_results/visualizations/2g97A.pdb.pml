
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
        
        load "data/2g97A.pdb", protein
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
 
        load "data/2g97A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2069,2342,2673,2891,2672,2892,2866,2652,1812,2054,2055,1802,1813,2068,1825,1810,2325,2326,2302,2604,2653,2654,2655,2656,2622,2625,1452,1454,1457,2358,2359,1434,1435,1436,1437,1438,1453,1455,1639,1641,1640,1451,2686,2693,1450,1481,1482,1829,1832,1835,1824,1847,1849,2376,1624,1403,1404,1405,1407,1409,1406,1408,1410,1380,1381,1382,1419,1420,2871,1374,2864,2867,2605,2869] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [138,139,152,154,155,163,3140,3047,3051,3054,3055,3056,1064,1066,162,3080,3094,3141,3126,3081,80,110,111,112,113,114,140,143,3034,1096,90,1065,109] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [2918,2919,2922,2923,2926,1479,1480,1485,1486,2958,1451,2914,2915,2702,2686,2693,1449,1450,1481,1482,2695,2696,2956,2957] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1164,1165,1154,1162,1163,1532,1531,1136,1549,1523,1525,2964,1151,1161,1131,1132,1133,1134,1135,1501,2951,2949,2950] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3050,3161,3159,3022,3012,3030,272,3219,3220,3016,3018,2984,3034,1097,3048,2983,3031] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [858,859,878,874,879,877,882,893,3353,3354,3487,3486,3311,3668,3669] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [838,839,840,971,972,3494,3476,3477,3479,955,956,3274,216,218,3266,3267,3268] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1006,1036,1038,688,681,682,687,1010,665,171,182,179,1028,1027,121,123] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [824,970,971,972,198,199,200,823,839,840,987,3539,216,3266,3267] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [262,258,936,938,919,937] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        