
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
        
        load "data/1nhvA.pdb", protein
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
 
        load "data/1nhvA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2209,1727,1731,1732,1733,1734,2175,2176,1192,1199,1202,1203,1221,4286,2174,2158,31,1196,1098,1195,1194,4287,4288,362,1716,1710,1711,1714,1715,360,389,397,387,2412,2427,2425,2426,2428,2789,2215,2211,2233,2418,1463,1465,3437,3438,3439] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1112,1102,1108,3448,4287,4288,2788,2789,2785,2436,2412,2427,2433,3436,1463,1465,2416,3437,3438,3439,1454,2942,2973,2974,1122,3000,3002,2926,3172,3173,3174,2787,2801,1519,1520,3161,3422,3101,3104,3089,3090,3088,3163,3442,3444,3446,1498,1478,3103,3132,3138,3139,3095,3129,3130,3131,3105,3160,2979] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3098,3403,3404,3323,3325,3362,3364,3065,3068,3069,3070,3316,191,3040,3041,3032,3114,3115,3117,3288,3317,3343,3344] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [3426,4289,4274,3425,3427,3451,4297,1098,1097,1095,748,749,724,4298,4305,4308,723,4303,4290,4291,4292,4293,2178,2180,1226,1230,1232,4301,1229,753,1273,1274,1275,1212,1213,1214] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3226,3230,3625,4070,4073,4069,3642,3671,3201,3669,3708,3648,3651,3657,3859,3239,3240,3819,4076,3238,3860,3861,4115,4116,3202] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [3077,3075,3084,3023,3064,132,3056,3037,3026,3021,1122,3000,299,1104,1103,125,1102,1108,1101,3035] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [985,1046,1266,787,788,1044,1045,1050,786,976,913,915,941,945,946,974,975,977,1244] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [2271,2297,2301,2393,531,556,2272,2300,2326,2325,1438,2386,2392,2376,2377,2299,2323] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3427,3451,4297,724,4298,4305,4308,723,4303,737,735,736,744,3082,3461,3462] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [4197,4204,4203,3552,4241,4218,3517,3518,3520,3478,4238,4207,4340] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        