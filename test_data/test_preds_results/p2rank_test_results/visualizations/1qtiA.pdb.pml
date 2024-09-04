
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
        
        load "data/1qtiA.pdb", protein
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
 
        load "data/1qtiA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2592,2593,2594,2595,558,2597,2235,2154,2156,2596,2599,908,910,911,912,913,914,916,940,941,2251,939,518,522,523,524,525,2148,2149,2150,2151,2152,2153,2155,948,947,2572,2573,2555,2564,2570,2566,2221,2220,2602,2603,1548,3444,538,539,540,541,606,646,534,555,950,630,978,629,2558,2560,2561,2562,2600,2557,2559,1541,1005,635,637,638,3440,631,632,633,636,2210] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [993,624,625,3460,3487,3528,3527,3573,3574,3576,3577,3595,598,3364,597,3365,3486,3488,3348,3350,3596,3349,3352,3357,3359,3346,988,622,984] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [1014,1025,1027,124,125,446,463,465,207,206,456,466,775,1013,772] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1757,1772,1774,3083,3086,3088,2809,2810,2807,2808,4156,4182,1769,1771,4105,4157,4151,4119,4153,4122,4106] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3137,3143,3174,3175,3176,3177,4123,4057,4080,4082,4090,4120,4132,3148,3184,3138,3141,3905,4059,3904] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2238,2239,2237,2799,1797,1771,1805,2246,1868,2195,2197,1833,2186,2187,1772,2809,2810,2807,2805,2806] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [2522,2523,2524,2532,3014,3051,3052,2531,3021,3022,3023,3024,3419,3399,3390,3041,3044] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1757,3120,3123,1772,1774,1758,1761,3146,2377,2378,2379,3147,3149,3151,1769,3124,4119,3148,3150,4157,4122] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [481,712,368,428,736,737,738,472,427,469,211,424] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [363,1376,1367,1368,1372,1373,1407,1410,357,230,360,364,1345,1347,1378,58,68,56,57] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        