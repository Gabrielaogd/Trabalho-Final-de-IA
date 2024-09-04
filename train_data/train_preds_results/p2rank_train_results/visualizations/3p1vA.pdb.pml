
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
        
        load "data/3p1vA.pdb", protein
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
 
        load "data/3p1vA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2401,2403,2553,2404,2449,2450,2469,2470,2507,2506,2958,2959,2504,2505,2541,2379,2186,2399,2189,2366,2368,2369,2370,2378,2402,2264,2345,2185,2467,2492,3084,2493,3102,3103,3104,3091,3097,1952,2190,2192,2193,2199,2204,632,634,1945,1947,2194,2197,2203,2191,631,2240,2242,604,1963,2205,619,620,626,627,2515,2516,2526,591,621,2542,2539,918,921,922,2491,2501,2176,2178,2179,2180,2182,1933,2271,2517,1929,1941,1942,1943,1930,2183,2184,2433,2398,2427,2428,2429,2623,2551,590,2206,2210,431,432,433,2612,2439] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1860,1862,1984,1840,1798,1985,727,684,685,686,726,1861,1888,1889,1895,1897,1962,1890,1877,1909,1982,1975,1976,741,742,740,731] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [315,324,2075,316,781,782,551,567,568,778,783,784,2025,2081,768,773,2087,2101,2102,2085,2088,2089,2091,2225,572,3278,327,334,335,2220,2221,2222,2223,2224,579] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2441,2436,3150,2434,2459,2640,3178,2393,2392,2362,2364,2367,3081,3057] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2153,2168,1741,1725,1728,1719,1722,1767,1768] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        