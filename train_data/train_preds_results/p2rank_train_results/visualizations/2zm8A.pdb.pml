
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
        
        load "data/2zm8A.pdb", protein
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
 
        load "data/2zm8A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [805,2780,2781,1217,1235,1236,1237,1238,1239,1215,1289,2571,2576,2577,2578,2775,2776,2777,2778,2779,2774,1230,1232,1233,2588,1593,1594,2480,2482,1573,2483,1588,1589,1591,1219,2609,2608,2857,2856,2562,2566,2831,2346,2347,2348,2828,2829,2830,2791,2784,2785,2790,2333,2334,2335,2355,2350,2353,2345,2349,2867,2868,799,800,1356,1358,1317,1365,1286,1288,1366,1297,1607,1986,1990,801,1992,1994,1977,1606,1991,1310,1311,1312] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [781,574,773,775,776,777,2733,774,2734,572,573,704,705,784,800,759,2726,2601,2583,2584,2585,2588,2586] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [30,91,94,95,96,97,98,40,45,49,1944,105,99,1945,1947,31,34,1441,12,7,17] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2417,2298,2265,2273,2499,2498,2531,2532,2533,2501,2297,2489,2548] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1780,1782,1759,1897,1899,1900,1898,1904,1757,1784,1787,1822,1896,1894,1895,1892,1910] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [949,2445,2211,2250,2251,2252,951,895,950,2224,2222,903,2194] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1304,1305,1476,1478,1279,1501,1510,1502,1499,1500,1413,1427,1428,1420,1281] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        