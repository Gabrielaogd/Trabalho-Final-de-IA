
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
        
        load "data/3gidA.pdb", protein
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
 
        load "data/3gidA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [877,879,886,3208,3210,3211,3173,3207,3172,3182,3183,3185,3209,3177,3184,675,897,669,672,668,660,2495,2496,2497,3222,3224,2993,2034,898,215,216,484,706,708,3017,507,483,506,508,698,500,496,497,227,207,874,212,218,221,229,233,3018] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2521,2522,3132,3134,3137,3139,2550,3131,253,3135,3136,3138,2551,2553,2520,2544,2541,226,228,252,882,247,273,285,244,275,277,3236,2494,2497,3235,3115,3249,3253,3127,3113,3114] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [322,324,354,355,351,361,2639,363,2721,2723,2819,2818,2725,2640,12,2731,2585,2586,2733,2589,2732,2614,2713,2717,2726,2730,2573] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [2151,2189,1960,2086,2087,2188,2934,1962,1963,1944,2149,2128,2928,2918,2923,2930,2127,2158,2159,2161,2912,2913,2092,2095,2100,2112,1942,1938,2921,2893,2892,2863,2779] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [2428,2430,2415,1132,1133,1134,1130,1775,1782,1781,2345,1240,1768,1762,1558,1475,1476,1494,1493,1537,1492] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1900,1901,1902,1052,1053,1056,1073,1025,1026,1044,1022,955,954,983,987,988,1013,137,2652,1021,1018,1012] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [3060,3165,3167,3400,3003,3161,3162,3163,3196,3198,3199,3415,3396,3445,3007,3013,3014] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2464,2467,866,2474,2623,870,862,867,1031,1032,2459,1042,1036] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [1828,1830,1848,2325,2324,2439,2015,2040,2042,2043,2487,2489,2453,2454,2455,2471,918] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [1831,1775,1782,1785,1781,2344,2345,1240,1768,1830,2429,2428,2430,1134] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        