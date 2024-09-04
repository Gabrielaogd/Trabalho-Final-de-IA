
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
        
        load "data/1nhuA.pdb", protein
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
 
        load "data/1nhuA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3448,4287,4288,1108,1102,1112,1115,3103,3132,3138,3139,3129,3130,3422,3419,3423,3101,3104,3088,3089,3090,3037,2942,2940,2974,2975,2979,2980,1116,1122,3001,3002,2973,2999,3000,3446,1463,1465,3436,3437,3438,3442,3444,2788,2789,2787,1519,2412,3173,3174,3160,3161,3163,2926,1493,1494,2801] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [2209,2428,1727,1731,1732,1733,1734,2171,2175,2176,1199,1202,1203,1206,2158,1221,31,1196,4287,4288,1194,1098,1193,1695,362,1716,1710,1711,1714,1715,1740,360,397,2412,2427,1720,2426,2421,2211,2233,2418,1463,1465] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [1095,1096,1097,1098,3426,3449,4288,4289,4290,3427,3451,733,737,723,724,4303,4302,735,736,744,750,4297,4298,4305,4301,1226,1273,1274,1275,1227,1228,1229,1230,1231,1232,1084,104,105,753,2178,2180,4292,1212,1214,1213,1081,1082,3082,3091,3081,3412,3461,3462] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [3290,3288,3317,3032,3068,3041,3070,3098,3053,3062,3114,3325,3360,3361,3364,3403,3404,3316,3344] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [3230,4070,4076,3642,3648,3651,3201,3657,3239,3240,3819,4069,4115,4116,3859,3860] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1244,787,786,788,945,1045,1266,1044,975,977,2000,936,937,974,913,915,939,940,941,946,1051,1047] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [3037,3024,3026,3021,3023,130,133,3056,3075,3084,3064,3077,299,1116,1122,2999,1103,1104,1105,125,1108,1102] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [2271,2391,2301,1438,2297,556,2300,2326,2325,2317,2376,2378,2299,2323,2270,588,1411,1418,2272,563,553,558] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4218,4238,4204,4207,4241,4203,4200,3552,3478,3486,3520,4338] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [1339,711,4227,4330,4331,4333,4223,4332,4329,4334,1340,4259,4260,1369] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1232,1084,1068,105,2070,2072,753,757,759,1231,776,777,1067,2064,1241,1246,774] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        