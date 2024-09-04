
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
        
        load "data/1eveA.pdb", protein
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
 
        load "data/1eveA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [950,2231,2261,2580,2582,2583,2574,2577,951,2166,2569,2571,2564,2565,2566,2567,2568,2570,2572,551,2189,2224,2245,641,640,2604,2605,2607,2609,566,567,2220,2603,2576,919,920,921,922,923,1551,1557,3456,3450,3454,1558,924,926,643,645,646,647,648,949,2165,957,958,656,639,534,548,569,533,535,2158,2159,2160,2161,2162,2163,2164,2157,960] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [3096,3098,2820,4156,4203,4204,4207,4157,4209,3093,3135,4173,3130,3133,2818,2819,4202,4233,4200,1767,1779,1782,1784] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3375,3367,607,608,3356,3358,3369,3374,3359,3355,3362,3360,632,634,3537,3538,3498,3583,3586,3587,3605,3606,994,998,635,1003,3497,3494] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [3956,3185,3186,3955,4083,4110,4141,4183,4131,4089,3148,3151,3153,4133,3187,3158,4174,3184,3194,4132] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [2809,2817,2815,2205,2207,1843,1878,2196,2197,2256,2246,2247,2190,2222,2248,2249,1781,1807,1815] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [1768,1771,3156,3157,3159,4173,3160,4170,3161,2387,2388,2389,3130,3133,4156,4207,4157,3093,3135,1767,1779,1782,1784] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [482,437,219,462,221,443,485,490,491,492,469,479,464,438,434,435,723,746,747,748,745,267,378] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [1024,134,782,1023,1037,135,216,456,985,978,475,476,471,473,466,1022] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2534,2542,2540,2541,3054,3409,3032,3033,3031,3061,3030,3400,3429,3034,3062,2533] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1382,1355,1383,1386,1388,1428,240,78,373,393,1378,367,1357,1420,66,67,68,1417] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3298,3300,4092,3976,3991,4062,4063,4064,4065,4078,4087,4094,4102,4099,3974,4060,4061,4069,3992,3320,3301,4100] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [494,501,915,916,964,969,1147,488,500,483,974] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        