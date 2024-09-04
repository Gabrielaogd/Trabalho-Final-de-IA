
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
        
        load "data/3zu3A.pdb", protein
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
 
        load "data/3zu3A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1101,1097,1100,1091,1092,2301,2302,2305,1529,2290,2291,439,2306,2311,2272,2278,1233,1910,1234,2304,2307,2331,2333,2356,2296,2299,2294,1095,885,887,1107,1106,1118,1114,1105,1527,1221,578,579,580,582,584,585,871,1770,1761,1933,1908,1932,1771,1772,2253,1780,2261,2268,1868,1781,1783,2271,407,405,406,1096,1081,1083,1084,1089,877,1071,422,427,430,1087,437,1762,1765,418,424,594,565,568,575,593,566] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2510,2516,2506,2507,2531,251,2522,2532,426,427,429,2514,2515,3084,218,217,3080,453,249,250,252,240,241,242,243,423,712,2494,2496,3050,3051,3052,3053,3049,2276,2279,2282,3048,3077,2300,3088] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [3033,1342,102,118,120,3061,1352,3028,1343,1344,3024,3032,3062,123,101,103,3058,3059,3030,3060,3070,3071,3072,2362,3025] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [2339,2338,1311,1299,1300,1320,1321,1323,1325,1326,1319,1390,1406,1391,2341,2362,2363,2328,2329,2334,2335,126,128,1331,1332,1335,1336,1339,1344,1337] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2728,2730,2731,2266,2750,2565,2566,2600,2603,2757,2749,2748,2541,2503,2504,2505] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1528,1518,1092,1761,1933,1525,1077,1071,1075,1757,1081,1089] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        