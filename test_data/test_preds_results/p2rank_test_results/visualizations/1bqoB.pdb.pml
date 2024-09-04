
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
        
        load "data/1bqoB.pdb", protein
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
 
        load "data/1bqoB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2326,2294,2295,2296,2298,2327,2328,2329,2376,1385,2037,2375,2373,2436,2446,2449,1387,2420,1383,2051,2364,2366,1393,1394,2272,2273,2277,2019,2293,2307,2022,2306,2266,2267,2423,2028,1947,1948,1949,1950,1951,1952,1953,2029,2030,2047,2049,2045,2447,2448,2452,2454,2460,2461,2464,2455,2017,2278,2466,2015,2269,2011,1999,2005,2009,2010] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [2494,2479,2408,2411,2461,2472,2455,2512,2517,2506,2529,2466,2269,2271,2475,2406,2415,2417,2418,2421,2551,2554,2436,2420,2423,2538,2543,2545,2548,2270] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [2118,1865,1866,1913,1917,1921,1525,1526,1849,1850,1822,1852,1914,1870,2119,2120,2082,2083,2085,2105,2079,2076,2078,1922,1923,1928,1848] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        