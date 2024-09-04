
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
        
        load "data/1yqyA.pdb", protein
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
 
        load "data/1yqyA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [576,912,946,947,948,949,950,1103,921,925,1094,1098,1101,3117,999,1000,1001,1002,1035,1037,1038,1011,1095,3024,575,574,3161,3163,534,3160,916,917,550,554,555,3014,3015,3143,3114,3165,2999,3000,3001,977,956,1003,1004,1175,954,959,1009,1173,1134,957,945,1135,964,3156] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [3154,3155,526,527,528,529,530,535,538,889,3139,891,827,853,854,540,3182,3184,3192,3193,3196,3171,3054,3191,3172,3176,3305,3312,3315,3319,3321,3181,3170,3177,3747,3748,3749,3803,3772,3800,3801,3802,3780,3794,3579,3421,3422,3411,3413,3447,3442,3443,3444,3445,3336,3338,3337,3382,3408,3409,3217,3218,3441,3580,3318] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [3165,1446,3283,3293,3294,1444,3284,2982,3001,2636,2640,545,551,554,3163,1002,1030,1447,2624,2621,2625,1458,2629,1438,1449,561,3297,3300,3302,1470,3305,3167,3159] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2695,2696,2684,2691,2692,2685,3363,3364,3365,3358,3362,2665,3286,3287,3288,1632,1674,2666,2720,1483,1484,1485,1631,1475,1476,1477,1465,1637,1633,1635,3371,2718,3354,2643,2645,1454] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [990,993,1739,1740,2633,1402,1754,976,1406,1765,1768,1761,1764,274,282,1001,1029,1447,2621,2625,1418,2629,2630,1446,1448,1449,1450,1416,1415] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [3878,3944,4073,2809,3890,3892,2807,2808,4035,4037,3882,4072] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2889,3506,3507,2887,2915,3505,3484,3486,2853,2881,2877,2912,3516,3541,4152] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        