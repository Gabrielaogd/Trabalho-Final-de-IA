
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
        
        load "data/2ivfA.pdb", protein
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
 
        load "data/2ivfA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3025,204,206,1042,6267,192,210,1041,212,1049,3346,4751,4750,4752,1040,4342,4344,4345,4296,4303,4341,4288,4289,4290,4294,4295,4293,200,203,1563,6265,6315,6316,6317,6297,6301,6307,195,189,6306,6308,6313,6314,4334,6312,1054,1055,1057,1059,6329,4668,1053,1061,1064,4681,4712,4665,4307,4310,6322,6323,4547,4548,4531,4532,4533,4545,4540,4937,4520,4539,1255,1257,1226,1096,1100,1095,1097,1099,1235,1268,1270,3290,1269,1234,3305,3307,7147,3345,3319,3322,3303,3312,3343,3352,6266,6268,1561,1564,1566,6255,6256,6259,6263,6264,1524,1565,1518,1514,1515,1516,1517,1520,6272,6820,6823,6936,4329,6947,3052,3053,7216,1254,4364,4365,7207,4340,3018,3020,3022,3029,3054,1511,3033,3034,3015,1510,3002,6252,6254,1748,1749,1756,6248,6249,6250,1733,1739,1742,1776,6795,6812,1757,1773,6814,6938,1878,1880,3060,7212,7214,7206,1513,1508,1509,1861,1896,1897] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [3696,3697,3720,3722,3717,3688,5667,3661,5655,5669,5695,5696,5697,3469,3470,3473,3474,3476,3482,3483,3485,3484,3472,3502,3503,3689,3719,3508,3540,3463,3471,3462,3464,3683,3655,3628,3654,3658,3629,3684,3715,3718,1162,3744,3745,3738,3539,3352,3350,3351,3353,3354,3363,3364,5656,5657,5658,7148,3320,3321,3322,7137,5660,5670,5675,5663,3300,3359,3360,1125,3756,1124,3382,3383,3384] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [6474,6476,6811,6813,6477,6710,6711,6712,6428,1757,1781,1782,1783,6739,6740,6741,6814,1761,6458,6460,6457,6726,6280,6282,6270,6292,1557,1558,6284,6408,6441,6838,6419,6414,6415,6417,6423,6273,6835] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [198,199,164,1590,1591,231,245,166,1563,6307,1585,1573,1568,532,531] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [2158,2156,2157,6000,6002,2667,6067,6071,2162,2193,2194,2177,6087,6088,6089,6104,6109,5998,6111,2694,2669,2655,2656,2695,2696,2723,2173,2176,2731,2733,2729] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [2205,2209,2288,2230,2252,2210,2316,2229,2243,2251,6027,7053,6021,6014,7060,7062,5934,5936,6018,5937,6019,2204,2202,2203,2201,2190,2192,2165,2167,2191,6015,2295,2289] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [3676,3677,3645,3589,3675,3678,3617,3643,3567,3594,3597,3564,7071,5953,7072,7073,7074,2298,2297,2440,7069,3706,7067,3669,7103] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [3151,3153,3173,3174,3203,3212,3218,3257,3261,3255,3256,3253,1384,3270,3272,5806,5814,3254,5804,3251] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [4105,4107,4109,4140,4166,4139,4156,7087,3706,3704,3705,7096,7097,7099,7106,7109,3702,3701,3708,4131,4165,3733,3732] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [3042,1277,3038,3044,3087,1294,1295,7178,7174,7177,6999,7029,7031,7003,3058,3064,3084,7164] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [5834,5836,5837,5838,5833,5835,5877,5893,5895,3632,5734] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        