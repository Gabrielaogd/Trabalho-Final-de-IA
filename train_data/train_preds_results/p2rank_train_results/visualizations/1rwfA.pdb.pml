
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
        
        load "data/1rwfA.pdb", protein
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
 
        load "data/1rwfA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1804,1805,1806,1807,1381,1740,1355,1738,1650,1338,1322,1252,1318,1337,2256,2232,2233,1794,1826,918,512,513,514,910,911,912,913,914,915,916,917,903,983,1795,1796,2296,2209,1793,3057,3058,890,891,3059,3060,3061,888,898,900,1262,1263,1295,484,925,487,486,490,3497,3498,1732,1735,1736,1739,3490,3491,3493,3492,3494,3495,1733,1734,1746,2199,2205,3072,3073,3074,2202,4451,4449,4450] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [1875,101,132,134,1874,1876,1011,1403,1404,135,983,960,547,990,979,982,572,574,131,601,600,599] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [131,137,139,2637,2628,278,601,600,599,2622,2623,2619,2624,2616,250,272,273,276,574,578,271,301,581,132] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [4905,4906,4907,4961,5117,5119,5049,5047,5048,5121,5126,5130,5314,5315,5316,5313,4943,4830,4832,5039,5042] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [120,123,124,84,115,1901,2362,2361,2382,2384,2333,2634,2632,2635,171,172,2660,113,114,164,165,122,2666,2667,2668,2659,2661,2692,2658] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [2370,2391,1886,1889,1890,1891,2000,1962,1961,2001,1888,1919,1954,2039,2390,2364] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [2193,2218,3132,3133,3134,2191,1760,3035,3012,3024,1759,1767,3007,2956,3131,3174,2857,2162,2168,2170,2190,3296] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [3190,2136,2765,2914,2925,2929,2899,2907,2909,2911,2912,2913,2764,2910,3200,3201,3206,3207,3210,2908,2762,2533,2135,2891,2892] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [4657,3765,3373,4640,4638,3750] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [3216,3217,3219,3979,3987,4027,4028,3218,3999,3240,3970,3971,4226,4227,4228,4233,3991,4215] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [4150,4151,4154,4055,4056,4063,4067,4163,4162,4148,4058,4062] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2165,3244,3245,2187,3254,3257,3260,3196,2145,3223,2265,2266] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        