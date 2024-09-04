
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
        
        load "data/3du4A.pdb", protein
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
 
        load "data/3du4A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [865,866,867,2474,861,864,2518,658,661,2517,2519,687,657,2279,857,858,868,874,876,2454,2456,2452,2453,975,976,977,2362,2449,2448,2361,844,2339,850,852,853,841,843,714,2364,2332,2337,2360,2298,2482] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [900,901,2002,2001,2003,2198,2194,2193,2259,2196,2244,902,1983,2200,2201,2004,2008,2009,1737,895,898,899,904,889,2250,908,1177,1186,1178,1195,432,454,1170,1172,1173] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3232,412,414,422,425,426,398,311,492,494,255,256,257,3234,195,197,238,154,156,3231,3144,3219,3222,3212,3215,3217,3218,312,3243,242,3177,239,3179,3143,3152,3118,3120,3122,3145,223,192,186,187,462,2228,2235] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [432,445,3232,433,1172,1173,1284,1776,3250,1286,143,144,145,146,148,3233,147,149,3230,3240,446,2201,442,443] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1914,823,1911,1936,1937,1941,1942,1944,1945,1956,2161,2162,1026,2319,2328,1012,1013,1027,2320,2321,1882,1913,1905,1909,1935,1939,1940,2305,2303,2304] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1357,1358,1359,1360,1362,967,956,957,1095,1118,988,989,991,990,992,993,962,987,966] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2708,2730,2732,2709,2915,2917,2918,2113,2056,2049,2731] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        