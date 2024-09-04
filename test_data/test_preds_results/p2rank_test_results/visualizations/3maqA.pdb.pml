
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
        
        load "data/3maqA.pdb", protein
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
 
        load "data/3maqA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4345,4347,4353,4354,4355,4338,4336,4337,4360,4361,4340,3318,3334,3335,4745,4746,4744,4752,4346,3194,3197,3198,4925,4774,4923,5024,5045,4378,4379,4924,3932,3353,3357,3358,3806,3838,3839,4724,3359,3363,3367,3371,3339,3349,3964,3961,3962,3960,3376,3377,3963,3378,3380,3381,3988,3929,3931,3909,3901,3902,3990,3991] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [2322,2941,2942,2336,2320,2338,3915,3939,3969,2950,2953,2954,2952,2971,3944,3978,2944,2885,2854,2855,2856,3946,3947,3948,2882] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [876,879,882,886,887,3026,3027,4059,4061,4048,4049,3025,2994,2966,2963,2965,2983,2984,2985,2987,2988,2991,960,959,2889,2904,2996,918,919,920,2897,917,3128,90,921,2958,2962,2928,2960,3130,4033] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [1289,2504,1860,1861,1862,1863,1864,1865,2408,2685,2686,2687,2688,1814,1816,1828,1831,2405,1308,1313,1294,1306,1307,2654,2684,2502,1813,1859] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [5116,5118,6110,6095,6096,5485,5487,5489,6063,6064,5641,5642,5904,5905,5906,5509,5510,5102,5106,5115] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [966,968,3060,3059,3058,3057,3062,3061,564,360,362,562,563,550,671,551,927,928,345,669] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [4097,3138,3150,601,602,600,585,3112,3142,3139,3468,589,591,3488,3490,586,3497,3492,3496,4044,3113,4106,4055,4066,4081,4054] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [2915,2916,2917,2918,2919,2194,2196,2253,2202,2198,2931,2273,2291,2938,2940,2292,2293,2270,1843,1844,1851,1845,2175,1854,2935] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [2903,83,89,2902,86,921,82,2205,2208,2213,2215,2216,2218,2234,80,102,2219,2212,2210,2211,2918,2919,2202,2924] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [3003,3759,3761,3043,987,1006,2874,3004,2867,982,983,984,985,2998,2990,2993,2995,956] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [1234,1248,1252,1253,1254,1255,1256,1257,1259,1251,1240,1412,1415,1416,2763,1258,2762,2725,1408,1410] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [5065,5184,6137,6139,5066,6132,6158,5222,4823,6160,4810,4846,4847,4829,5057,4911,4912] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [5379,6262,6053,6265,6306,6291,6289,6295,5411,6294,5413,6084] 
set surface_color,  pcol13, surf_pocket13 
   
        
        deselect
        
        orient
        