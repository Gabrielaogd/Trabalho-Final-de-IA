
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
        
        load "data/2i56A.pdb", protein
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
 
        load "data/2i56A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [417,780,781,782,777,779,984,980,982,2517,949,420,422,2516,423,425,752,754,956,1662,951,2234,2531,2532,2222,457,459,451,2521,1682,1706,1708,1709,1710,1711,2218,1964,2214,1332,1328,1335,1338,1339,1340,1331,1716,1717,1718] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [2378,2380,2490,2492,2493,2477,368,2698,2460,2377,2408,2409,2458,2410,2478,2454,2475,329,333,334,354,366,2700] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1756,1761,1752,1363,1760,1766,1426,1428,1431,1362,1365,1409,1416,1407,1412,1415,1405,1099,1458,1487,1118,1069,1070,1417,1101] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [925,926,723,930,916,929,373,374,375,382,383,384,389,378,2480,2483,1648,2465,2475,2484,932,2487,931,1295,1292,1296,1305,1625,1627] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2869,2901,2868,2871,2872,2372,2373,2395,2810,2811,2779,2808,2870,2335,2024,2363,2364,2394,2396,2780,2334,2338] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [1197,768,962,1194,1003,1022,1020,1223,1190,1191,1224,767,800,988,1054,1055,1163,1165] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3225,3227,3228,560,592,3215,3218,615,20,618,3217,3219,869,579] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2309,1988,2281,1947,2018,1979,1970,1996,1969,1982,2198,2208,1953,1954,1955,2185,2210,2183,2188,2189,1999] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [417,418,442,446,451,499,500,440,441,543,548,601,602] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        