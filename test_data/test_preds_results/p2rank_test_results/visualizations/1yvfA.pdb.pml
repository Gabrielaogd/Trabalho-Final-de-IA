
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
        
        load "data/1yvfA.pdb", protein
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
 
        load "data/1yvfA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1239,1241,1243,1780,2281,1778,1779,1781,2257,1774,2206,371,372,373,400,408,1761,1762,1787,1236,1246,1249,2222,1268,2223,2224,1250,1252,39,3208,3209,3476,3483,3484,3490,3492,3185,3207,3177,3178,1509,4337,2258,2259,2262,2263,1510,3469,3495,4338,4336,4339,4340,1763,2473,2474,2475,1747,1751,1757,1758,1569,1570,2463,2836,2832,2835,2459,2465,2972,2828,2833,2834,2841,2847,2848,2987,3219,3221,2970,3493,1499,1523,1534,1538,1539,1543,1544,3206] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [3118,3121,3451,3079,3115,3117,3161,3164,3393,3363,3411,3336,3338,3364,3099,3100,3108,3109,3086,3088,3372,3410,3437,3438] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [3472,3473,3474,3498,4358,751,753,735,734,4338,4339,4340,4341,4342,4343,4347,4348,4351,4352,4353,1320,1111,1261,1259] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [2439,1483,2318,2320,2347,2348,568,2373,598,599,2425,2423,2372,2363] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1261,1260,1259,1274,1275,1276,1278,1273,764,1277,1279,1105,1108,1109,1111,1112,4340,4342,4351,4352,4353,1320] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [764,1097,1277,1279,768,1082,1081,1095,1096,1260,1278,1098,112,113,2121,2118] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [4276,4277,4309,4311,4310,4279,4382,4383,4384,4331,722,1386,1387,1415,1416] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [3081,3068,3124,3111,1136,3070,3073,138,1116,1122,1130,308,1117,1119,136,133,137,3122,3119,3083] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4257,4269,4288,4291,4387,4388,3525,3536,3565,3566,3540,3543,4252,4253,3517,3533,3534,3522,4378,3529] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [4164,4163,3695,3689,3698,3716,3718,3704,4122,3908,4116,4115,3287] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [797,799,1057,1058,1059,1291,957,987,988,1313,926,958,925] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        