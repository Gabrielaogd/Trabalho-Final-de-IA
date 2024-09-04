
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
        
        load "data/1gpkA.pdb", protein
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
 
        load "data/1gpkA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2594,2598,2600,543,544,545,560,546,643,909,1013,912,911,913,914,915,917,940,941,942,949,635,636,638,641,633,634,948,951,527,529,528,530,651,3433,2573,2574,2561,2563,2565,2567,2571,2593,2595,2603,1550,1557,3437,2158,2160,2239,2214,2255,2152,2153,2155,2156,2157,2159,2154,2127,2225,2218,2604,611,637,639,640,642] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [3343,3344,3345,3572,3573,3575,3576,3594,3595,997,3477,629,630,3453,3480,3353,3347,3354,3360,603,3341,3520,3521,989,991,985,988,627,602] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2522,2524,2532,3412,2525,3392,3385,3042,3049,3050,3021,3019,3020,3022] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1789,3122,1787,2806,2808,3081,3084,3086,4146,4163,4147,4207,4203,4206,4201,4232,4160] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [128,129,1033,1035,468,466,470,471,210,461,451,776,1021,1022,773] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [3936,4181,3174,3937,4088,4091,4093,4125,4126,4131,4071,3172,3173,3146,4123,4164,4122,4161,4121,3136,3139,3175] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1793,1812,1820,1883,2250,2216,2241,2184,2191,2240,1846,1848,2199,2201,2190,1845,1786,2242,2243,2804,2805,2803,2797] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [474,477,480,215,429,432,433,486,714,485,487,375,736,738,739] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        