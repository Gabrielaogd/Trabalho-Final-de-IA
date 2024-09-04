
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
        
        load "data/2vzsA.pdb", protein
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
 
        load "data/2vzsA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5696,5698,3494,3509,5695,5697,1235,1237,4135,4149,1228,2874,2879,2880,2967,2969,2970,3272,1224,1225,1234,3271,3269,3270,3280,3282,3283,3619,3620,3834,3589,4631,3616,1236,4731,4730,5690,5691,5693,5694,5692,5689,3593,3586] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.341,0.702]
select surf_pocket2, protein and id [4341,4342,4374,4377,6094,4344,4345,3901,4311,4313,4314,4812,4819,4847,4849,6077,6078,4375,4347,4348,4351,6487,6477,6478,6075,6471,6472,6470,6515,6071,6475,6476,4805,3909,3888,3891,3893,3894,3898,3899,6106,6107,6456,6455] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.424,0.361,0.902]
select surf_pocket3, protein and id [4952,4964,4968,4992,4951,4953,5590,5592,5595,5573,5585,5591,5618,5608,5615,5619,5626,3667,5143,5604,5391,5421,5423,5599,5600,5601,5368,4993,4994,5364,5359,5142,4420] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.435,0.278,0.702]
select surf_pocket4, protein and id [2547,2504,2526,2529,2501,2505,2506,2447,452,453,2484,2555,2556,2442,2445,2479,2480,4660,2554,4664,4791,4792,4793,4670,4770,4772,4780,4782] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.698,0.361,0.902]
select surf_pocket5, protein and id [2618,2624,2633,2619,2620,2636,2379,2374,2376,1998,1999,2000,2002,2004,2010,2011,5299,5057,2600,2399,2400,5048,5294,5295,2380,4887,4902,4905,5045,5044,5051,5052] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.651,0.278,0.702]
select surf_pocket6, protein and id [2722,2723,2724,3149,3150,2721,744,745,960,961,962,1388,1343,1344,1350,1353,1354,1357,1372,747,1345,741,1371,321,762,958,757,959,3118,3119,3145,3147,2711,2714,2717,57,2731,2732,2733] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.824]
select surf_pocket7, protein and id [2762,3190,3191,2048,2046,2176,2181,2185,3178,3179,2179,2180,2184,3181,2169,2165,2724,3138,1463,3170,1449,1454,1457,3145,3147] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.533]
select surf_pocket8, protein and id [3793,3578,3597,3598,3743,3796,3799,3800,3791,3795,2289,2290,2284,2288,4569,4564,4567,4568,3562,3563,3569,3555,3561,3497,3500,3499,3516,3517,3518] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.545]
select surf_pocket9, protein and id [962,1387,1388,1432,1438,1448,1449,1454,1457,1371,2169,2165,2159,2179,2180] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.318]
select surf_pocket10, protein and id [2878,1223,1224,1225,4129,2975,2976,1222,1212,1259,1266,1162,1153,1161,1271,1272,1302,1205,1208,1214] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.451,0.361]
select surf_pocket11, protein and id [794,795,796,924,925,1170,1180,888,3069,3070,3020,3035,3034,891,893,900,1166,1182,1168,1169,1186,1187,1188,2897,3042] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.459,0.278]
select surf_pocket12, protein and id [3112,3409,3412,3114,3171,1467,1453,1610,1611,1598,3423,1597,1860,1858,1859] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.729,0.361]
select surf_pocket13, protein and id [6222,6311,5513,5514,5515,5516,5518,6218,4897,4898,4899,5522,6227,6228,6230,4907,5521,5527,5532,5536,6248] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.675,0.278]
select surf_pocket14, protein and id [4986,5002,5003,5328,4511,4512,4521,4548,4509,4510,5017,5316,5317,4549] 
set surface_color,  pcol14, surf_pocket14 
   
        
        deselect
        
        orient
        