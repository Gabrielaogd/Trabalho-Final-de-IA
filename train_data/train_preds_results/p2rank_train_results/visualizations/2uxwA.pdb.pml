
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
        
        load "data/2uxwA.pdb", protein
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
 
        load "data/2uxwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3017,3007,3014,3015,3016,3019,3021,3023,905,2021,2024,1126,1129,1131,2023,896,2044,865,866,867,725,897,608,872,1395,1396,864,868,1122,1125,609,2029,2031,2032,1994,2025,2611,2615,3065,2056,1997,1998,1995,3089,3092,3091,3093,3094,3095,1191,3024,3027,3033,3004,2998,3056,1190,1184,1185,1186,1187,1189,1970,1971,1972,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1805,1153,1146,1152,1183,1390,2087,3008,3012,842,3009,3011,3013,2981,2081,2077,2078,2074,2075,2076,2103,782,783,757,752,754,756,779,833,834,832,860,862,780,781,586,323,577,324,573,1768,3001,2970,2972,2969,1804,1724,1746,1744,1732] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2472,2502,2473,2475,2503,2504,2506,2508,3794,705,2505,2507,166,198,3817,3865,173,268,738,702,765,2476,2477,2478,3795,3913,3914,3915,3861,704,178,185,191,197] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4020,4021,4022,3972,3974,2707,2711,2737,2739,2708,2433,2434,2397,2398,2399,2401,3994,3996,3997,2426,2396,3700,3703,3682,3711,3702,3709,3710,2680,2702,2705,2683,2685,3684,3685,3683,3686] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [2580,2606,2040,2555,2607,2583,2585,696,698,2551,2557,2562,2032,2007,2004,2005,2037,927,948,946,956,957,953,968,616,618,697,928,2039,686,687,689,691,613,614,680] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1781,482,484,471,476,478,481,527,523,524,501,850,1791,474,477,1795,1419,1420,525,526] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3552,3553,3608,3634,3637,4164,4088,4191,4162,4163] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [792,793,803,329,330,378,740,768,772,773] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [672,578,579,581,661,663,664,665,1077,555,564,1080] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        