
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
        
        load "data/3rqtA.pdb", protein
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
 
        load "data/3rqtA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [63,70,71,73,59,66,176,177,178,185,99,58,206,207,208,168,169,4002,1736,4014,3859,1735,1737,4027,3963,3970,3875,4029,3074,81,94,3059,3073,158,162,56,65,2821,2820,1743,1744,1745,1738,3861,3864,2799,2797,3067,3207,3209,3211,3212,3215,1982,3213,3281,3282,3236,1095,1097,1098,1099,775,1079,1080,1081,1087,3246,3235,4008,4010,3993,4000,3075,3076,3077,3373,3374,3387,769,773,146,760,3202,3198,1978,1980,3834,3855,3857,3193] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [3965,4015,4043,4034,4040,3967,4046,3968,1471,1470,4056,196,198,229,232,235,236,239,1250,279,273,277,367,281,291,304,4019,240,4017] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [3728,3730,3690,3692,3700,3722,2512,2515,2509,2510,3695,3726,3724,3732,3734,3738,3719,2156,2159,3742,3790,2390,3797,3799,2180,3785,2179,3779,3775,3763,3768,2534,2197,2199,2529,2406,3338] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [3171,3403,3153,3174,3408,2025,2008,3190,2007,3381,3404,3399,3389,3292,3327,3783,3326,3397,3782,2028] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [3348,3513,3536,3539,996,994,3309,3345,3344,805,803,806,808,832,833,3310,3312] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [3228,3230,1964,1965,3250,3252,309,317,318,325,326,2457,2458,316,1962,3990,3234,2476] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [2051,2148,2046,2048,2065,2146,2105,2106,2112,3426,3432,2049,3415,2116,3428,3435] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [3809,2004,2015,3170,2898,2772,2847,3183,2777,2786,2787,2844,2843,2871,2875] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [2861,2862,1612,1599,2807,2808,1758,1605,1610,1611,1600,2804,2827] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1129,722,1188,1189,1184,1142,1144,1159,1173,754,1182,1136,1177,721] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [3269,3270,3272,3273,3313,1053,998,1011,3257,3260,3538,996,1012] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2845,2840,2838,2817,2847,3200,1999,3832,3833,3834,2325,2323] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        