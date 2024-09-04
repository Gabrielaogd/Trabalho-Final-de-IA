
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
        
        load "data/3hvoA.pdb", protein
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
 
        load "data/3hvoA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1209,1210,1211,1212,3477,1108,1109,3500,4322,4328,4330,4332,2192,1732,2441,2443,2256,1748,1750,1749,1711,2448,2442,2429,2433,1189,2230,4325,2232,2235,2236,1727,1730,371,372,373,397,398,404,1731,1726,1208,1219,1187,1198,405,1728,1756,2176,1743,1747,30,31,2193,1218,2194,1237,2818,2820,3209,2821,2822,2430,1482,1484,1486,3493,3480,3487,3488,3489,3499,3208,1543,3495] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [3183,3184,3209,3146,3148,3149,2820,2827,2982,2984,3470,3472,3473,3474,3475,3479,3480,3487,3208,3220,3176,3175,3477,3046,3044,2828,3015] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [3144,3159,3112,3113,3143,3337,3076,3114,3115,3116,3450,3162,3372,3393,3408,3407,3363,3111] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [983,1051,1055,1046,981,980,786,787,1056,1058,951,952,947,919,920,1283,1261] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [380,46,61,62,356,68,77,64,83,85,44,45,47,50,52] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4109,4116,3691,3697,3718,3720,3700,3276,3278,4110,4111,3706,3246,3248,3286,3287,3288] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [3067,130,3070,3102,134,1119,1122,1123,1133,1113,1114,3081,3046,3045,3065,3078,3121,3099,3100,3101,3110,3122,3133,126,129,3149] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [216,217,3900,3325,3320,3327,194,218,3921,3922,3923,3355,3356] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [964,1934,961,962,959,933,934,648,654,660,1332,664,930,665] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [4306,4315,1353,1355,1387,2214,2216,4318] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        