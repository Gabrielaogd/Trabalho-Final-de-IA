
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
        
        load "data/2e1tA.pdb", protein
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
 
        load "data/2e1tA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2360,2361,2938,2940,2954,2958,2959,2960,2962,2957,3198,2949,3228,251,1318,1341,1342,1344,2519,2521,234,236,238,250,252,233,207,1715,1716,1339,1345,1336,1338,1369,1370,1371,313,314,315,316,3141,3142,1282,299,320,298,300,1316,1317,3152,3153,289,3154,3155,3187,3188,3189,3193,237,239,235,277,282,284,285,2359,2358,2941,2943,2937,2939,2942,2944,2936,2541,2524,2525,2526,2527,2528,2371,2837,2833,2816,2830,2831,1349,2969,2992,2968,2963,3227,3012,3014,3125,3015,335,1408,3009,3010,3011,3013,3123,1355,2378,2372,2375] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1904,3329,3336,3338,3340,3345,3185,3190,3191,3197,3324,2916,2920,2930,2246,2248,2247,3400,2268,2274,2275,3366,3363,3205] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2375,2981,2983,2985,2414,2984,2975,2976,2158,2159,2160,2133,2756,2147,2146,2757,2969,2977,2349,2351,2353,2359,2358,2161,2162,2163,2164,2723,2368,2369,2371,2722,2962] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3423,3455,3456,2203,2205,2638,2233,2234,2240,2609,2611,2613,2617,2610,2612,2262,2260,2261] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [802,1047,1146,635,636,1147,69,70,71,788,790,798,1053,1054,1056,1059] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [486,455,456,1465,3055,3064,3066,3073,1462,1463,3056,3078,464,3075,494,483] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [743,730,744,763,1133,748,155,650,1116,667,669,705,1110,1131] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [2974,2975,2976,2158,2160,3296,3297,3268,3280,2985,2984,2154,2152,2153] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        