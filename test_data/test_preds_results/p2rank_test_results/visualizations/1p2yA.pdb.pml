
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
        
        load "data/1p2yA.pdb", protein
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
 
        load "data/1p2yA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2767,2776,2777,2778,2779,1930,2804,2806,2807,2808,2811,2763,2766,2768,2772,2274,2281,2705,2715,2717,2227,2279,742,743,736,1870,2749,2750,740,2280,2493,2292,2293,2294,2748,2751,2492,2495,523,2307,599,887,1878,857,1951,1952,1953,2850,2842,2841,1868,1869,1892,718,1866,1407,700,701,1922,1895,1896,1897,1898,1899,1923,1924,1874,1201,1931,1872,1850,1238,1240,1236,1919,1920,1921,3077,1417,3069,630,631,632,2712,2747,2762,2711,2720,2721,521,2727,518,2710,834,835,2773,2774,797] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [212,213,216,243,211,207,3020,1978,2005,3042,3043,1975,2004,233,2003,2006,2034,2036,2038,2257,2259,2260,2007,2010,2013,2015,242,2246,2247,2596,2617] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1390,1392,1421,1422,1938,1358,1945,1426,1357,1355,1176,1179,1133,1134,1935,1971,1170,1424,3049,3085,3086,3088,3091,3096,3098] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [647,397,646,667,165,1397,1469,1457,1463,1433,1434,1435,1473,664,1406,1475,672] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [364,2445,405,401,59,2438,2440,2447,655,656,42,363,41,21,25] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        