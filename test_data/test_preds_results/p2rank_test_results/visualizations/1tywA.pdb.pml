
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
        
        load "data/1tywA.pdb", protein
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
 
        load "data/1tywA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1002,2139,2141,995,1000,1001,992,997,2172,1890,2173,1938,1939,1881,1882,1883,1884,2133,2149,2150,1910,1930,966,2465,2467,2817,2818,2452,2803,2804,2805,2806,2808,2809,2458,2502,2183,2194,1937,2320,2322,2200,2205,2635,2636,2637,2639,2656,2640,2484,2485,2487,2182] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1491,1699,1492,1466,1469,1511,1314,1315,1335,1717,1718,1462,509,1148,1149,510,1297,1299,1300,1312,1673,1459,1463,1464,1465,1927,1929,1698] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2242,2253,2254,2237,2238,2239,2244,2235,2345,2017,2346,2015,2344,2362,2027,1745,1762,2250,2252,1552,1556,1558,1553,1555] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3359,3360,3361,3363,3171,3174,3167,3340,3339,3135,3138,3134,3137,3111,3364,3396,3153,3145,3160,3150] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2607,2780,2790,773,776,2789,781,2610,2111,767,2441,2595,2598,2606,2599,787,789] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2669,2670,2671,2673,2674,2332,3034,2653,2317,2871,2872,2873,2874,2875,2876,2318,2309] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1852,1854,1853,719,733,735,738,913,769,770,771] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [2954,2969,2970,2971,2997,3126,3127,3128,2837,2982,2983,2763,2770,2774,2796,2797,2798,2839,2776,2987,2981] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        