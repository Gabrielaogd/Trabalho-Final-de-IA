
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
        
        load "data/1q1rA.pdb", protein
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
 
        load "data/1q1rA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2105,816,1844,1846,1847,822,1870,839,2103,2104,2245,2252,2098,2246,2247,806,811,815,65,809,810,814,255,1836,1837,1838,1839,1840,835,838,1172,1165,1827,1830,1831,1824,1825,1826,1829,1834,1182,1374,2250,1173,1168,1170,1329,1330,1331,1332,1319,1164,1162,1367,1368,1375,1389,1390,1388,1337,1343,1338,1384,979,989,985,976,980,1195,1174,1193,1194,1188,1190,1192,1196,1197,1822,1817,2253,2256,2466,2483,2485,2468,2470,2476,1176,1180,1216,314,320,324,325,2482,2484,346,355,316,318,987,990,991,992,315,1001,996,999,86,89,2254,2255,2258,2264,2284,82,90,94,73,74,78,79,68,71,76,246,249,254,256,258,261,311,291,294,297,299,317,1002,274,275,285] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [1182,1184,1399,1400,1401,2472,2448,2443,2586,2469,2471,2578,2839,1398,2236,2243,2246,2247,2241,2445,2580,2583,2587,2592,2593,2227,2468,2470,1180,2564,2256,2450,2451] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [2142,2154,2428,2429,2430,2134,2136,2138,2163,2335,2132,2445,2299,2300,2301,2434,2309,2242,2423,2426,2427,2298,2303,2307,2308,2019,2333,2422] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1465,1467,2853,2836,1186,2567,1433,2838] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        