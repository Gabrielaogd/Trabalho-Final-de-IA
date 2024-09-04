
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
        
        load "data/1lxmA.pdb", protein
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
 
        load "data/1lxmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2429,2446,2445,2364,2368,2042,2048,2060,2061,2062,2367,2363,2369,2370,2550,2051,2052,2053,2515,2540,2541,2084,2041,2296,2302,2308,2043,2047,2045,1601,2454,2447,2448,2516,2518,2520,2791,2792,2380,2335,2323,2334,2304,2325,2338,2382] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.361,0.702]
select surf_pocket2, protein and id [1669,1666,1173,1203,1212,1233,1234,1691,1663,1204,1664,1696,1723,1724,671,701,702,703,2593,2594,2106,2103,700,711,2101,666,668,680] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.373,0.361,0.902]
select surf_pocket3, protein and id [688,678,681,648,649,650,720,1258,1721,1759,1760,1742,1748,155,1746,1313,1322,1324,1715,1738,1255,1256,1257,1247,1253,1725] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.380,0.278,0.702]
select surf_pocket4, protein and id [2838,2839,2862,3280,2868,2874,3278,3300,3301,3270,3272,2883,3279,2842,2840,3248,3245,3570,3560,3567,3571,3563,3555,3566,3247,3549,3551,3548,3692,3693,3695,3696,3697,3698,2875,2879,2882] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.600,0.361,0.902]
select surf_pocket5, protein and id [1825,1836,1797,1801,1397,171,1398,187,192,193,164,166,1392,1393,1400,1404,1426,39,52,54,189,1793,1778,1779] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.557,0.278,0.702]
select surf_pocket6, protein and id [3338,3336,3375,2994,3011,3014,3015,4100,4112,4104,4105,4102,3322,3327,3329,4089,4099,4118,4120,4121,2996,2999,5383] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.831,0.361,0.902]
select surf_pocket7, protein and id [3061,2506,2508,2509,2510,2511,2942,2965,2987,3041,3009,3003,3006,3382,2988,3062,2542] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.667]
select surf_pocket8, protein and id [3086,3397,3396,3392,3405,3406,3085,3432,3062,2566,3120,2593,2594,700] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.741]
select surf_pocket9, protein and id [2616,3115,3149,2615,3140,3139,3113,3116,3452,3141,3142,3453,659,684,685,690,691,3420,3423,734,742,741,3117,696,3422,3445,654,686] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.486]
select surf_pocket10, protein and id [4910,4075,4109,4110,4060,4915,4925,4926,4927,4921,4928,5188,4932,4933] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.514]
select surf_pocket11, protein and id [3126,3148,3156,3157,3201,3202,3147,2768,2734,2735,3129,3150,3151,2638,2639,2641] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.310]
select surf_pocket12, protein and id [1234,866,867,3395,3402,3405,833,3417,700,711,705,707,710,3416] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.435,0.361]
select surf_pocket13, protein and id [5296,5298,5560,4260,5563,4836,5295,5311,5314,5528,4202,4203,4852,4254,4257,4835,4253,4200,4201,5531,5544,5545,4851] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.427,0.278]
select surf_pocket14, protein and id [5920,6169,6045,6061,6062,5880,5937,5940,5879,6206,6207] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.667,0.361]
select surf_pocket15, protein and id [1587,1588,1590,2024,2023,2022,2021,1965,2019,2020,2061,2062] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.608,0.278]
select surf_pocket16, protein and id [2307,2577,2281,2632,2694,2319,2318] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.894,0.361]
select surf_pocket17, protein and id [4220,4657,4859,5596,5598,5612,5614,4670,4673] 
set surface_color,  pcol17, surf_pocket17 
   
        
        deselect
        
        orient
        