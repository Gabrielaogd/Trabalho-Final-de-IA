
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
        
        load "data/1onhA.pdb", protein
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
 
        load "data/1onhA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1155,1172,2222,2223,2541,2371,2379,2380,2350,2372,2378,2369,2138,2150,2158,2160,2135,2144,2148,2141,2331,2399,2361,2362,2364,2156,2550,2783,2335,2329,2330,2332,2333,2336,2526,2530,2534,2546,2606,2531,2532,2301,2238,2239,487,1176,488,1190,1175,2545,2559,2553,2556,2560,2561,2756,1153,911,912] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [1768,1774,1772,535,1750,1756,1752,1754,1766,1782,480,2563,466,1655,2566,2568,501,1814,482,1802,1804,1811,1659,511,488,1188,1189,1190,481,483,2559,2560,504,508,499,503,510,928,925,926,927,932,942,1211,1764,1714,1718,1678,1679,1680,1712,956,1187,922,1208,1184,1186] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [632,634,2456,641,642,643,2455,2457,628,583,627,2063,2083] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [2564,1642,1643,2569,2570,1639,2563,1651,1652,1655,1656,2566,2568,1662,1661,2559] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        