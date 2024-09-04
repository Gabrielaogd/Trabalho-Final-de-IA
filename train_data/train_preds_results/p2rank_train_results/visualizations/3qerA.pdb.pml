
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
        
        load "data/3qerA.pdb", protein
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
 
        load "data/3qerA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4625,4626,4627,4654,4656,4658,3985,4583,3462,3464,3466,3467,3461,3427,5131,3426,3431,3437,3443,5676,5903,5904,4023,4024,3444,3441,3440,3442,5124,5130,5132,3449,3453,3463,3465,4597,5834,5836,5807,5984,5985,5999,6001,5998,5102,5138,5155,5157,5137,5677,5114,5115,5117,5113,5122,5123] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [1794,1796,2422,1793,1808,1840,978,2731,1026,2575,1842,1843,1844,976,977,1831,1028,1811,1838,1839,2429,2694,2526,2529,2695,2697,2577,979,982,2600,1034,1035,2415,2419,2420,1790,2729,2730,958,961,965,2428,2430,2548,2549,2574,2576,1024] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [325,327,3142,3147,491,399,400,410,411,3152,3159,3119,3120,3121,3122,3115,3117,3091,3088,3090,753,306,307,308,303,290,493,697,701,752,785,786,787] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [2862,2892,4616,4012,4014,4015,2869,4574,2835,4549,4551,4526,4550,4529,4036,4038,4281,4282,4284] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [2802,2855,2856,2859,2851,2852,2853,2772,2798,2799,2801,2803,2806,939,941,1158,1160,2773,2775,2776,1159,2747,923,924,876,922,1173,1174,1175,1531,1197,1198,1199,877,878,879,881,2883,2275] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [6442,6450,6451,6598,6602,6825,6826,6057,6437,6438,6823,6604,6059,6058,6061,6065,6073,7164,7165,7170,7172,7160,7161,7167,6591,6592,6594,6596,6841] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [2462,2432,2461,2431,2438,2440,6968,2435,6969,6970,2519,6080,6816,6818,6392,6412,6413,6986,6079,6414] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [3191,3196,4716,3190,3192,711,3020,3023,3028,3029,3030,3059,712,717,4738,4739,3193,3057,4746,3189] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [3959,3442,5638,5640,3958,3996,3481,3506,5618,5619,5622] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [2346,4545,4560,4562,4542,4544,2824,2814,2335,4594,4568,2823,2815,2822] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [2246,2232,2247,2249,2205,2976,2973,2194,2200,2959,2204,2224,79,80,2958,739,2223] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [2359,4632,4606,4630,4631,4660,4661,2900,3012,4603,4633,4634,4639,3008,2330,2331,2339,2341,2986,3007,2326] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [5471,5472,5473,5637,5441,5444,5635,5636,5656,5657] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [5021,5020,5029,5232,5389,5391,5200,5197,5354,5356,5423,5425,5222,5223] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [2898,2888,2894,2896,2897,2921,2922,2924,3975,2887,4640] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        