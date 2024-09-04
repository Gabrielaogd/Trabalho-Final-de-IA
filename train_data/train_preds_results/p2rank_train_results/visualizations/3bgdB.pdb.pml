
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
        
        load "data/3bgdB.pdb", protein
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
 
        load "data/3bgdB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2005,2006,2007,2008,2010,2012,3037,3038,3342,3340,3345,3346,2858,3046,3047,2866,2868,3100,3349,2004,2522,2524,2847,2852,1980,1981,1982,2851,1963,3052,3054,3073,1969,1970,1975,3341,3350,3351,3629,3630,2040,2103,2351,2358,3002,3013,2362,2363,2516,2517,2366,2049,2352,2353,2354,2355,2504,2505,3006,3010,3011,3033,3253,2518,2843,3007,2107,2104,2105,2108,2109,3268,3269,2112,2114,2116,2110,2111,3590,3591,3571,3572,3602,3603,3556,3555,3671,2101,2395,2396,2983,2985,3004,3005,3689,3691,2359,2376,2379,2375,2130,2129,2132,2133,3690,2121,2125,2128] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2640,2641,2776,2777,2788,2441,2450,2442,2799,2443,2807,2411,2412,2413,2798,2805] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        