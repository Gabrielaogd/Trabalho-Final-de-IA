
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
        
        load "data/1tq4A.pdb", protein
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
 
        load "data/1tq4A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2509,2510,2508,2445,2447,2462,2483,2484,3150,2520,3217,581,582,590,591,592,593,601,597,602,603,2422,2425,2427,756,757,762,765,769,565,567,1974,1975,1991,1731,1979,1980,3184,3125,1738,3183,3214,1726,1719,1712,1952,1959,1971,1977,1981,1984,2429,2436,570] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [737,840,841,842,525,658,530,671,672,673,674,675,714,852,496,502,501,678,500,688,838,693,516,512,513,1327,503,505,1328,1329,523,524,858,878,879,529,535,536,1716,1717,613,668,654,651,652,655,1701,1705,1708,1709,1321,1322,1326,1714,1325,1343] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2161,2162,2367,3029,3031,2335,2395,2393,2391,2394,2389,2390,2392,779,780,768,774,787,417,418,420,416,2094,2405,2120,2115,2118,2119,2121,2124,2125,2129,2406,1920,1927,1928,1929,419,414] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [21,30,31,272,270,266,269,268,2174,2202,22,24,2946,2192,2194,306,307,308,330,332,339,302,2170,2196,2201,2199,2200] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2908,2881,2883,106,117,74,76,2102,2103,69,102,104,72,3081,3039,3037,3082,2855,2857] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1738,3183,3186,3188,3189,3190,3212,3213,3214,1723,1725,1737,1746,1747,1748] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2373,2347,2381,2382,2686,2684,2682,2683,2416,2658,2664,2414,2415,2468] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        