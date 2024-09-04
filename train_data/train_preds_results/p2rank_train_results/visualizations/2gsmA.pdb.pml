
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
        
        load "data/2gsmA.pdb", protein
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
 
        load "data/2gsmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [705,742,748,750,3195,3218,749,3194,3163,3162,3217,3244,706,200,231,3852,3854,3227,3229,3850,3883,3884,3848,3892,3911,3908,3171,3136,3170,3520,3521,3522,3460,3461,3820,3821,253,230,3822,3823,3795,3819,3510,3511,3793,3796,702,712,713,714,1200,3138,3137,3164,3165,3123,3124,3125,3126,3127,3128,3101,3102,1193,1195,1197,3630,1189,1209,3640,3641,3629,3623,703,704,680,254,281,676,677,678,252,653,655,656,3549,316,3074,3075,287,288,657,3073,3633,3634,3638,624,290,770,153,180,3246,156,3312,3309,3289,3291,3314,181,182,184,161,159,3910,164,166,167,168,3912,3317,3949,830,129,128,41,3308,2112,2082,2083,2085,2094,2096,2118,2119,2120,2084,3122,3115,3117,2897,2898,2899,2900,3116,3154,3155,3156,3157,2938,2922,2920,2921,2923,2902,2907,2025,2061,2439,2441,2448,2450,2435,1225,1227,1228,2024,2443,2445,2453,1985,2962,2960,3003,3094,3004,3057,3046,3048,3049,2477,1986,2483,2440,2437,2438,2940,2958,2959,2964,2588,2591,2363,2640,2610,2611,2613,2638,2639,2929,2609,2615,2616,2618,2619,2946,2948,2669,2641,2642,2680,2678] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [440,1098,1109,1111,1112,1113,437,435,1101,1099,1100,1102,640,217,245,247,271,498,611,612,463,466,462,459,460,461,648,266,267,470,506,467,468,469,471,472,269,234,237,238,243,649,235,401,602,1147,609,1150,1153,414,399,400,408,410,1158,1159,1161,1155,1160,590,380,236,1082] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1704,2375,1669,2350,1687,2351,2318,2326,2328,1577,1637,1688,1692,1662,1663,1689,1691,1566,1636,1685,1686,1697,1698] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [764,1411,1407,1405,1403,757,759,760,765,790,147,148,820,786,1429] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2178,2183,2184,2212,4094,4081,2186,4086,4087,4088,1598,1599,4084,4095,4069,4077,2180,2173,2174,2206,1601,1605,1606,1607,2285,2287,1595,2283,2282,1581,2259,2261,2249,2252,2255] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [758,716,718,721,1411,710,1710,2104,2077,1741] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3554,3531,3533,3555,3086,3087,3589,3590,3591,3557,2955,2911,2913,2928,2914,3558,2935,3559] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [664,665,666,687,688,689,1102,668,1171,1182,1184,1335,1075,1094,1076] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3444,3471,3472,3443,3430,2849,3431,2820,2878,2875,2876,2848,2842,2843,2844,2846] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        