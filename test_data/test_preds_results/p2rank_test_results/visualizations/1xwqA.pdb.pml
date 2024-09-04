
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
        
        load "data/1xwqA.pdb", protein
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
 
        load "data/1xwqA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [626,627,628,3054,3056,608,624,1008,3065,2288,549,610,548,572,3051,537,1162,1647,1649,1161,2289,3030,561,563,3032,3033,3034,3027,3059,3028,3076,3077,3078,3029,3031,2306,2307,3066,3067,3068,3069,3063,3064,2269,2275,2276,2277,2278,2279,2280,2281,2653,2651,573,2073,2193,2195,2203,2207,1553,2179,2215,571,1551,1552,2728,2177,2191,2192,1546,1558,1559,1586,1004,1005,1007,1122,2185,1018,1121,1133,1120,1574,1142,1576,1003,1006,1139,1144,1147,957,958] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2025,2554,2555,2695,2683,2024,2026,2029,2031,2027,2028,2030,2517,2518,2519,2520,2525,2550,2551,2527,2582,2040] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1194,1195,2340,2341,2368,3155,2342,3123,2349,2315,657,3096] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [108,129,109,111,2384,2386,2381,51,52,63,100,48,45,24,130,2833] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        