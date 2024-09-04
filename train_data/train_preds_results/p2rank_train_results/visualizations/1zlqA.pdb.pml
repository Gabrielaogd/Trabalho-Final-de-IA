
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
        
        load "data/1zlqA.pdb", protein
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
 
        load "data/1zlqA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3223,3193,3195,3196,3224,3226,3379,3220,3221,3222,3217,3218,3216,3219,3225,3254,807,808,809,810,3364,3365,3366,812,814,811,813,3361,3362,3363,3202,2030,166,171,1120,1119,203,204,1117,158,161,784,159,163,3964,3081,3110,3077,3354,3083,3109,3367,3179] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1806,3204,3205,3188,3189,2043,3187,3190,1815,1812,2879,2304,2848,2849,2851,1817,3083,3109,3072,2802,2812,2817,2857,2837,2838,2819,3084,3179,3178,3180,3183,3181] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [3937,3969,3974,3976,3982,3972,305,3944,3986,3983,4015,4016,1329,4005,4006,4007,4008,1534,1538,1537,208,3977,302,304,278,380,383,384,3971,3973,232,233,234,1149,1330,270,1513,3950,309] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [70,3956,3959,3962,3964,209,3961,3981,3979,1826,71,1796,3826,1805,1817,1818,1819,1820,1821,1688,211,195,69,78,79,2029,1803,2030,2021,3824,1806,3203,3204,1804,3217,3218,3216] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [2016,2017,2023,2015,2011,2010,330,3941,3237,3239,3241,3260,316,341,3264,2036,2397,2421,2401,2412,2414,2428,2427] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [3559,3561,3562,3563,3558,454,468,3560,1027,500,1026,499,469,442,443,444,471,1059] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2426,2427,2436,2438,3271,2439,1031,3276,1029,3609,3580,3239,3241,3242,3260,314,316,341,343,1069,1071,3278,1067,1073,1026] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2477,2478,3717,3718,3719,3726,3713,3723,2495,2214,2480,3721,3774,2200,2201,2202,3752,3775,2366,3716,3738,3741,2179,2175,2182,2213] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [3334,3538,3515,3517,1005,3546,1004,3540,829,830,832,862,1017] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        