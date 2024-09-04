
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
        
        load "data/3b0gA.pdb", protein
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
 
        load "data/3b0gA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3445,1285,254,615,657,659,613,3726,3722,3723,576,587,577,1649,1658,1660,1656,1978,1981,1982,1279,1280,1282,1318,2297,2296,3738,3739,779,781,1084,1085,764,780,3735,3736,3737,3730,1025,1026,1031,1033,1062,1027,3753,1040,1041,1043,1681,1316,1314,1315,1682,1761,1771,1773,1809,1797,1801,1984,1272,3381,3386,3384,3390,3391,3429,3385,762,1102,761,3430,3433,3434,3435,3440,3711,3426,3432,679,693,697,3431,664,682,686,578,3095,3492] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1788,1782,1785,3995,1848,1950,1951,2038,2041,2046,1932,1935,2576,2580,1939,2060,2061,2062,3991,4011,2040,2042,3997,1850,2605,2638,2639,2586,1744] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1228,1229,1230,832,812,807,815,831,814,1488,1491,1492,1493,1494,833,1525,795,796,1516,1245,1239,1569,1515,1517,1518,1522,1550] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3724,3726,3443,1995,3722,3723,3725,1999,3445,1649,1658,1660,2330,1981,1993,2329,2297,2293,2292,2296,2304,2305,2302,2303,2301] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [3522,3554,3344,3345,3346,3552,3553,3555,3580,3322,3321,2861,2862,3273,3313,3292,3310,3521] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3657,3658,3359,2679,2680,3083,3350,3641,2678,2677,3639,2686,2695,2699,2701,2675,2694,3642,3643,2708,2710,2719,3357,2720,3351] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2816,2818,1394,2746,2749,2737,2739,1368,2691,2687,2689,2697] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        