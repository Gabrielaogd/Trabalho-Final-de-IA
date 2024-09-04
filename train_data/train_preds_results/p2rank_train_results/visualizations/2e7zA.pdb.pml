
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
        
        load "data/2e7zA.pdb", protein
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
 
        load "data/2e7zA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [6470,6471,6472,1568,1572,6460,6462,6464,6473,1536,1544,1546,1548,1564,1570,1550,6426,6449,346,1520,6469,4563,4567,4568,4572,4571,6474,6479,6485,6481,6477,6478,6484,6516,7250,4806,6461,6463,75,61,52,63,6496,4918,4920,76,69,1562,1566,868,869,885,891,892,894,890,6492,6494,4775,4909,4911,4774,4560,4561,4558,4559,4562,4750,4760,4766,900,4761,4765,4780,4783,4785,4772,4773,4897,4891,1117,1119,3377,77,5010,1452,1078,1079,1081,1082,1085,1087,1080,6412,6416,6417,6418,6419,6420,6401,6404,6405,6394,6409,1462,1961,6411,4591,4592,7218,7219,7220,7221,7222,7223,3399,3403,3401,3459,3461,7560,7558,6398,3413,3415,1446,1418,1428,1430,1432,1436,1438,1454,1900,1896,1898,1108,4597,4598,4600,7551,3391,7556,6393,2193,1928,2189,2179,1912,1914,2201,3479,2235] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [3373,3363,3353,3359,3361,85,1574,1618,1286,1674,1278,1282,1254,1260,1128,5009,5011,4345,5032,5033,4983,4991,278,5050,5051,5047,5049,277,279,5062,275,280,5610,4981,4982,4985,5044,81,89,90,1600,1602,286,276,73,83,92,1572,1245,1241,1243,3837,5039,1234,1238,1248,1228,1229] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [5005,5007,870,874,875,4994,928,929,1060,861,927,940,1087,4328,3955,4326,3916] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [7251,7263,4790,4791,4792,4834,7262,6516,4794,568,589,565,587,7291,458,492,4787,4798,585,4782,436,434,437,438,439,440,4780,7344,7294,7278,7285,7293,7290] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [6619,7258,7379,6552,6583,6603,7273,7283,6617,7242,7378,6873,6874,6969,7368] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [5384,5388,5392,5395,5374,5376,5164,5116,5124,5123,4901,5157,5385,5146,4959,4960,5093,4937,5094,5149,5373,5154,5192,5156,5389,5370,5363] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [46,48,86,99,69,84,329,351,352,67] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [1172,1234,1227,1147,1173,3355,3361,3365,3623] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [6428,6431,7178,6574,6575,6411,6410,6657,6659,1932,7054,6629,6631,7014] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [4013,3987,4186,4208,4209,4296,4187,4050,4153,4163,4164,4168,4040,4042,4044,4154] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [5542,5543,5595,5597,5054,3894,4978,5055,3895,3873] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [7535,1093,1095,7520,4391,4392,4393,4613,4605,4608] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [4540,4542,988,990,5244,958,5214,5207] 
set surface_color,  pcol13, surf_pocket13 
   
        
        deselect
        
        orient
        