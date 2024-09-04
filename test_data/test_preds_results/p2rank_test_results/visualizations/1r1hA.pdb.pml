
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
        
        load "data/1r1hA.pdb", protein
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
 
        load "data/1r1hA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5287,5324,5326,5328,4785,5291,5297,5298,5133,5135,5344,5346,5322,5323,5331,4622,5503,5504,5505,5278,5279,5280,5281,5282,5283,373,5137,5139,5138,410,3939,3940,408,409,4102,4222,4227,4104,5125,4218,4200,5126,4220,5102,5104,4196,5098,5105,4062,4226,5130,5307,5148,5149,5150,5151,5152,220,222,5305,5306,5308,286,202,229,371,5144,284,230,4245,4247,4249,4244,4246,4248,4744,4745,4748,4756,4282,3944,3957,4257,4258,4281,4283,4279,4280,3952,3954,4306,4319,4320,4321,4322,3964,4277,4278,4305,4312,4313,3980,3960,3975,3973,3974,3961,3990,3897,3992,4356,1216,3981,3982,1197,1194,1198,1199,1200,3841,5265,5266,5273,4620,5271,5272,4724,4314,4716,1898,1899,1900,1914,1917,1215,1901,1916,1178,1180,2333,1289,4609,4727,1889,1942,1181,1182,1305,1940,2331,2330,2332,5168,5165,5167,4639,5318,5319,4628,4645,4659,4660,5155,5156,4651,4652] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [2804,2886,2888,2853,3641,3643,3677,2623,3678,698,696,2823,720,2675,2676,719,723,716,742,2854,2855,2856,2857,2592,2617,2615,2851,2852,2865,2880,2883,2879] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [453,479,2810,2844,2845,2846,2878,2876,415,416,417,368,358,452,334,335,441,349,351,2809,357,354,359,364] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1370,1371,1372,1846,1851,1339,1845,1847,1867,1868,1318,1323,1333,1338,1366,1361,1364,1383,1356,1892,1314,1866,1893,5246,5253] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [3974,3990,3897,3992,3993,3771,3772,3798,3876,1197,1194,1198,1199,1264,3841,1191] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [4091,4092,4093,395,396,397,399,91,121,129,92,93,94,130,4084,4083,425,462,273,426,313,314,271] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [4413,4414,4415,4416,4480,1927,4344,4345,4334,4335,1924,1925,1911,1912,4513,4514,1910] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [1900,4510,4511,4547,4512,4513,4314,4568,4743,1903,1904,4719,4718,4720,4311,4503,4538,4308,4334,4310] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [3075,3108,4125,4180,4139,4177,4157,4892,4894,3100,3130] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [3713,3711,3712,3676,2570,2593,2604,2888,2889,3677,2623,3678,2592] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        