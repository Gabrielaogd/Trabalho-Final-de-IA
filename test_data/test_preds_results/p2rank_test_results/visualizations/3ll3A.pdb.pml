
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
        
        load "data/3ll3A.pdb", protein
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
 
        load "data/3ll3A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1866,1854,1857,1858,1861,1863,1864,1865,1867,1868,606,737,739,741,736,738,734,735,740,80,83,584,586,579,580,581,585,1228,1346,88,2002,1862,1895,1896,3315,70,71,117,2001,3295,3308,3316,3317,2026,599,600,604,614,1382,612,1204,1203,1209,1210,1381,1383,1238,1356,1369,1236,1237,1337,1389,1357,733,621,1202,1189,1401,1190,1597,1604,1213,1219,1221,1225,100,2169,2171,2277,2278,608,2693,2186,2188,2189,2172,2659,2657,2694,1999,2000,2035,2024,2030,2052,1894,3086,607,1379,1380,2187,1390,1391,1005,980,981,982,979,988,1001,961,966,967,903,964,947,951,900] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [722,1079,769,1069,1070,1111,1114,292,293,294,755,756,311,328,698,700,695,701,326,327,312,314] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3094,3095,3119,2452,2451,3122,2012,3093,2341,2344,2308,2309,2310,3102,3104,3155,2332,2334,2335,2336,2488,2013,3099,3115,3124,3129,3096,3097] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [976,2685,804,834,814,2715,2716,977,983,984,985,991,992,2708,777,780,781,2704,2705,2645,2692,2684,779,836,835,761] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [2294,2637,2704,2705,2292,2293,2656,2645,2708,983,984,985,991,742,745,747,761,764,752] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [1880,3371,1642,1640,1641,3395,1634,1649,3396,3394,3453,1631,1632,1881,2232,2201,2210,2233,2234,2235,2236,2207,3454,3451,3447] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [3073,1919,1927,3074,3516,3520,3257,3075,1974,1975,3059,3258,3544,1930,3505] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [963,964,906,976,2685,804,834,977,983,2692,2686,2687,875,874,873,876,1031,836,2142,2143,2136,833,835,884,881] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [3382,141,142,144,174,152,176,42,143,145,146,3323,3330,3342,3353,3383,3496,3497,3498] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [2752,2753,2750,2751,2851,2396,2398,2819,2821,2824,2397,2749,2771,2579,2772,2836,2812,2748] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [568,433,50,440,442,108,64,566,54,55,553] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [3006,3037,3643,3645,3038,3670,3672,3642,2951,2952,2953,2974,2977,2978,3214,3002] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        