
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
        
        load "data/1ogoX.pdb", protein
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
 
        load "data/1ogoX.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3046,3272,3273,3274,3276,3087,3269,3270,3271,3566,3567,2412,2413,2414,3300,2880,2897,2898,2899,2900,3068,2661,2683,2684,2685,2451,2411,3066,3083,3085,2918,2919,3098,3099,2689,2703,2733,2721,2718,2712,3038,3211,3212,3488,3037,2852,2854,2856,2662,2862,2863,2864,2865,2401,3277,3561,3562,3563,3564,3565,3285,3489,3481,3467,3468] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [3717,3724,3938,3939,3940,3725,3728,3937,3733,3734,3412,3410,1407,1408,1413,1414,1415,3718,1410,1416,3731,975,1272,1271,3392,992,3403,991,1228] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [118,117,269,271,313,416,315,318,310,411,328,330,314,410,275,896,898,164,300,430,436] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [1020,1022,1183,1159,3140,3141,1191,1178,1188,1194,1175,1176,2967,2968,2974,2972,1168,3156,1000,3381,3137,3138,3136,3139,1001,1014,3365,2977] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [1523,2046,1555,2045,2060,1516,1520,1519,1512,1556,802,2066,803,1514,2067,1793,2064,84,50,54,1509,1510,2226,2223] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [3201,3441,3203,3204,3444,656,657,3211,2854,2856,3198,3453,3489,3467,3468] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [2965,1529,1530,1548,2590,1546,1503,1168,1163,1166,1172,2769,2964,2970,2973,2777,2589,2774,1508,1528] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [588,589,604,705,706,511,514,519,520,483,485,487,188,471,587,590,593,183,475,498,510,499] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [3201,3203,3204,3444,1341,682,683,655,656,657,673,668,669,1332] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [2505,2506,2339,2342,2428,2487,2507,1945,1962,2129,2130,2488,1963] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [738,739,741,717,723,1439,725,1447,176,187,286,287,1446,285,177,178,457] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [200,206,224,225,199,1915,1916,1917,2282,1901,1911,553,567,2278,509,201,202,585,584] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [372,373,374,375,392,394,358,1070,1059,1063,1112,854,1113,870,1073] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [4346,4341,4342,4343,4344,4345,4348,4349,4199,4364] 
set surface_color,  pcol14, surf_pocket14 
   
        
        deselect
        
        orient
        