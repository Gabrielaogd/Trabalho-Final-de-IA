
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
        
        load "data/2chzA.pdb", protein
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
 
        load "data/2chzA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4957,4958,4959,4960,4961,5097,5099,5100,1118,4956,4984,4987,4988,1142,1116,1115,1150,1110,1111,1114,4924,5120,5113,5114,5117,4474,4935,4897,4899,4900,4901,3437,4490,4488,5023,5024,548,1140,1141,5063,1101,1102,4989,4983,4993,5051,540,538,519,3372,3408,3409,464,3375,1075,1076,1077,1103,497,496,5025,1105,3407,3395,3396,3758,467,3398,3399,3678,3679,3709,3712,3714,468,1088,1090,4489,3757,3711,3713,4484,5081] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [5196,5203,5210,5214,5216,5764,5765,5208,5213,4895,5846,5847,4893,4894,5850,5851,5852,5853,5107,5109,5191,5845,5106,5111,5842,5844,4808,4600,4667,4809,4586,4826,4866,4828,4829,4825,5192,4645,5122,4612,4598,5274,4621,5741,5749,5251,5737,5739,5740,5250,5237,5246,5272] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [4452,4453,4454,4016,4024,4025,4026,4517,3698,3999,3998,3991,4023,3990,3670,1266,1268,3989,3992,448,966,967,968,969,446,3665,3666,3668,429,430,1239,4494,4495,3700] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [6301,6302,6424,2624,2629,2635,6388,6389,3217,6277,3216,2696,6390,3209,6333,6334,1607,2868,2869,2870,2639,2645,2651,2656,2655,3178,2657,2859,2894,2895,3226,3228,2695,2867,3203,3215,1601,6387] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [3420,3135,3137,3141,3143,3404,3405,3382,3383,3384,3406,3418,497,498,3125,3126,3128,3124,3351,6250,6251,6252,6227,6246,4991,4992,5000,4994,6229,5032] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [204,2301,212,211,201,203,2315,189,195,2039,2129,2047,2302,2303,2041,2045,228,3869,3870,3871,194,235,236,183,3539,3540,3872,3876,2305,2309,2296,3835,3843,3844,2308] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [4919,4917,5857,4883,5872,5875,5877,6326,6351,6352,6374,6414,6415,5676,5684,5691,6294,6296,6412,6353,6318] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [4859,2273,2271,2272,3816,3819,3809,4876,6343,6345,6336,6337,6338,6344,3491,6330,6348,6349,2260,4872,4887,6354,6355] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [466,468,959,1088,1090,4489,4499,3677,3679,1073,1071,1072,1082,4484,4498,446,978,974,975,448,1118,1116,1115,1114,4490,4488,4474] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [946,664,666,668,4735,4736,663,1202,1204,4738,672,683,4745] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [5901,5906,5907,5910,5912,5663,5665,6616,6579,6580,6442,6444,6440,6469] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [5927,5635,5816,5608,5815,5970,5917,5924,5837,5622,5606] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        