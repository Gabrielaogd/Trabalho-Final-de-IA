
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
        
        load "data/3zx1A.pdb", protein
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
 
        load "data/3zx1A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [569,1414,1416,1432,1433,1662,1681,1412,1673,1680,1214,1238,1437,1446,1449,1448,424,561,562,563,566,1683,423,440,505,506,441,504,1844,1845,1847,1434,1216,1853,1252,1253,1240] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [3483,3487,3486,3480,3482,3454,3455,3456,1982,3423,3424,3457,3417,3422,2085,2086,3412,2122,2117,2118,2120,2007,2130,2113,2116,1998,2000,2159,2172,2111,2137,2132,2154,2155,3316,3335,3336,3387,3405,3532,3505,3506,3549] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3572,3278,3280,3283,3581,3284,3447,3448,3304,2622,2624,2626,2630,2632,3285,828,1055,1058,2605,1048,1049,1050,2606,3274,3595,2634,2633,3613,3272,827,1034,1035,826,3622,2648,3307,3574,3575,2629,2643] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1623,1624,2369,2370,2409,2411,1628,1619,1877,2309,2323,2326,2450,2447,1871,2449,1632,2317,2319,2408,2415,2303,2431,2308,2311,2312,1620,1874] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1328,2182,2017,2022,2023,2604,1791,1063,635,636,1064,1302,2605,1047,1052,2606,1290,1298,1325] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [623,625,627,608,604,331,329,261,264,317,318,308,646,647,648,314,307,315] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1559,1600,1562,2393,1546,104,2368,2370,2411,1619,1637,1604,1597,1620,1457,1458,1569,1616,1558,1545] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2773,2775,2375,2377,3191,3192,3193,3195,3196,2772,2771,2799,2797,2809,2811,2379,2384,2385] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1197,1199,1176,1166,1181,17,1529,1531,33,36,1582,1192,1227] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        