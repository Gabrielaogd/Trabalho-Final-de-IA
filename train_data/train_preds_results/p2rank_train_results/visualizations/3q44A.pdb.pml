
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
        
        load "data/3q44A.pdb", protein
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
 
        load "data/3q44A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2390,3092,3093,3095,3097,3061,3066,3096,2389,2391,2599,2600,2399,2129,2138,978,979,2510,3050,3051,3052,3054,3053,3055,963,965,975,981,3056,3057,3020,3025,3026,3027,3011,3013,3014,3015,3019,7125,7126,3010,870,869,871,1026,6814,986,991,7124,7110,7112,7120,7116,1027,422,2994,2547,2549,38,50,72,73,76,3016,985,2526,2532,2534,3018,2519,2522,78,80,1078,1087,1088,1089,1090,1091,1107,2995,2996,33,3001,68,26,29,32,34,35,990,992,1014,1016,411,412,15,16,423,621,630,632,2338,3105,3106,2304,2336,2114,2115,2118,2370,2400,2121,6839,6842,2109,2111,2112,2113,2103,962,2106,6813,856,6811,6812,6804,6805,6806,2388,2626,2625,2386,2387,2362,2363,2655,2656,2791,2664,2328,2291,2297,2300,2302,2329,2290,2296,2292,2662,2688,2689,2698,2759,2661,2722,2753,2754,2758,2356,5608,5644,5634,5633,5670,5606,5605,2737,2816,2789,2756,2782,2783,2784,5061,2748,2749,5050,5060,5666,5668,5671,2750,2751,5022,5057,5059,5049] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.373,0.702]
select surf_pocket2, protein and id [6282,6280,6281,6574,6580,5115,6587,6584,6585,5957,5976,5977,5726,5727,5979,5983,6005,5757,5758,5756,6006,6277,6291,6295,6296,6297,6298,5975,5666,5668,5671,5704,5695,5693,5694,5699,5082,5083,5705,5700,5268,5308,5309,5263,5265,5270,5271,5303,5306,5269,5274,6591,6595,6599,6600,6602,5245,5087,5084,5735,2286,5947,5949,5952,5956,6217,6259,2287,6221,6251,2300,2296,5920,5919,2292,2295,5698,5670] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.380,0.902]
select surf_pocket3, protein and id [4647,4618,4651,4652,4655,4401,4394,4398,4399,4619,4464,4408,4402,5137,2834,4594,4616,4620,4621,4648,4595,4377,4369,4374,4385,4388,4389,4683,5167,5169,5166,5135,5171,5173,4379,2832] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.337,0.278,0.702]
select surf_pocket4, protein and id [6834,6835,6837,6839,6842,6830,3050,3060,3065,3022,3025,3026,3027,3066,6857,6858,6861,6887,7160,2886,2920,6888,6889,7162,2848,3067,3070,6862,2918,2921] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.533,0.361,0.902]
select surf_pocket5, protein and id [2338,2305,2336,2337,2114,2115,2214,2215,2216,6507,6509,6510,6544,6511,2203,6485,2109,2110,6252,6253,6209,6212,6482,6506] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.490,0.278,0.702]
select surf_pocket6, protein and id [5122,6862,6897,6569,6578,6864,6867,6637,5121,5124,6860,6567,6574,5115,5110,5111,5112,6593,5202,5154] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.725,0.361,0.902]
select surf_pocket7, protein and id [4382,4383,3668,3671,3690,3691,3887,3885,3886,2896,2899,2900,2898,3882,3883,3899,5158,3665,3673,2890] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.643,0.278,0.702]
select surf_pocket8, protein and id [1264,1734,1249,1252,1299,1297,1298,1732,1243,1247,1248,1569,2046,1268,1282,1416,1295,1291,1294,2159,2160,2026,2027,1713,2028,1571,2024] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.878]
select surf_pocket9, protein and id [6243,6202,6204,6422,6420,6173,6201,6471,6177,6213,6492,6494,6454,2078,6180,918,919,6493,6453,6175,6176] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.608]
select surf_pocket10, protein and id [2968,3034,3035,2932,2971,2985,2980,3914,2917,7188,7185,7186,2925,2910,2944,2987,2988,2998,3004,7151,2983] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.682]
select surf_pocket11, protein and id [3190,3194,3157,3158,4325,4326,4334,3195,4006,4007,4352,3186,3188,2697] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.455]
select surf_pocket12, protein and id [5008,4573,5004,5007,4985,5012,4502,4960] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.490]
select surf_pocket13, protein and id [5054,5057,5059,5082,2808,2809,4584,4586,4609,4613,4638,5081,4579,4607,4608,5093,5087] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.306]
select surf_pocket14, protein and id [2803,2809,4584,4586,5054,5057,5103,5104,2805,4613,4614,5081,5093,5096,5087,5131,5132,5133,5134] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.424,0.361]
select surf_pocket15, protein and id [6535,6734,6536,6500,6431,6756,6758,6452,6435,6764,6733,6789,6501,6502] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.408,0.278]
select surf_pocket16, protein and id [5463,5453,5457,5461,4989,5006,5020,5016,5017,5044,4987,5043,5652,5482,5484,5486,5620,5653] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.620,0.361]
select surf_pocket17, protein and id [5044,4987,4990,5429,5427,4964,5455,5463,5453,5457,5461,4989,4970] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.557,0.278]
select surf_pocket18, protein and id [2764,2765,2742,2740,2743,2744,4547,4540,4334,4542,4546,4531,2778] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.812,0.361]
select surf_pocket19, protein and id [6085,6086,6117,6118,6119,6120,6121,6122,6379,6382,6412,6415,6094,6390,6384,6423,6377,6411,6376,6383] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.690,0.702,0.278]
select surf_pocket20, protein and id [2711,5590,1885,1886,1884,1830,5611] 
set surface_color,  pcol20, surf_pocket20 
   
        
        deselect
        
        orient
        