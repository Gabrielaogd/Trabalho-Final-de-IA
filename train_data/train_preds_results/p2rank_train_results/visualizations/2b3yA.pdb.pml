
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
        
        load "data/2b3yA.pdb", protein
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
 
        load "data/2b3yA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4128,3931,3933,4134,4136,3941,5283,6051,5556,5282,6050,6065,6066,3938,3936,3937,5319,1671,1673,4138,1664,6047,3912,701,996,717,3425,1417,1434,3435,3430,1657,1658,4177,4178] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.369,0.702]
select surf_pocket2, protein and id [6266,6274,6275,6273,6299,6265,6772,6267,6238,2402,6231,6234,6235,6236,2167,6720,1887,1889,6578,6738,6741,6579,2170,2165,2172,1888,594,1760,1879,1882,2403,1876,1883,1886,1867,1872,1869,1873,1862,1857,1794,1757,1758,1795,1796,1797,1798,6797,6841,6842,6300,6795,1787] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.373,0.902]
select surf_pocket3, protein and id [2293,3483,3484,4648,2275,2276,2279,2280,2281,2299,2300,2301,2501,2503,2529,2530,2499,2496,2494,2495,2261,2472,2470,3461,3478,3477,4686,4725,4646,4624,4647,4645,4649,4650,4586,4622,4653,4654,4626,2262,2025,2026,2031,2020,3482,2059,2274,1990,2263,2264,2027,4588,4589,4590,2265] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.349,0.278,0.702]
select surf_pocket4, protein and id [2953,2941,4155,4157,4158,4159,5268,5253,5254,6041,5252,5261,2131,2370,2973,2132,6019,4160,4164,4165,5291,5292,5293,4153,2972,5244,3136,3137,3138,3139,5661,5677,5680,5681,5684,4166,4167,4168,5748,6042,6043,2375,4137,2368,2363] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.553,0.361,0.902]
select surf_pocket5, protein and id [2907,2908,3015,4529,4400,4402,4536,4530,4531,3007,3008,4298,3010,2906,4299,4396,3011,2015,4560,4561,4562,4563,4564,4566,4567,4565,2013,4277,4297] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.510,0.278,0.702]
select surf_pocket6, protein and id [5045,6830,6857,6858,1788,6108,6309,6848,6849,6847,6302,6828,5048,6129,6310,6131] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.757,0.361,0.902]
select surf_pocket7, protein and id [1216,1251,4934,4960,4938,1246,1248,1250,4873,4882,4886,4887,4888,4935,1218,1219,4984,1221,4963,4930,4928,1253,1254,1257,1247] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.671,0.278,0.702]
select surf_pocket8, protein and id [1402,1400,3899,1405,1406,4810,4786,4747,3896,1102,3901,4745,4749,4738,4750,3700,3701,3703] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.839]
select surf_pocket9, protein and id [1019,5324,5325,5328,5330,5513,5502,5503,5504,3954,3960,3959,3962,3963,1017,1018,5321,5322,3943,4176,3945,3952,4175,4181,4172,4206,4207] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.573]
select surf_pocket10, protein and id [6129,6306,6321,6155,6168,6166,6312,6313,6314,6163,6329,6803,6808,6810,5137,5140,5143,6827,6828,6814,6830,6161,6164] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.631]
select surf_pocket11, protein and id [2699,249,220,188,189,190,251,2685,2686,2687,294,2771,257,254,255,317,2773] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.412]
select surf_pocket12, protein and id [5045,6830,6858,5087,6827,6828,6822,6895,6814,6129,6306,6312,6131] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.427]
select surf_pocket13, protein and id [1600,1602,375,376,378,373,387,388,645,646,1550,1573,1574,1601,642,641,931,934,926,942,655,657,1552,1553,649,650,654] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.306,0.278]
select surf_pocket14, protein and id [29,31,455,46,47,204,205,206,203,221,224,512,479,488] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.498,0.361]
select surf_pocket15, protein and id [4792,1367,1370,4841,4843,4855,4846,1279,1313,1310,1303,1351,1304,1302,1280] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.467,0.278]
select surf_pocket16, protein and id [6399,6401,6412,6414,6402,6406,5247,6202,5997,5232,5238,5701] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.702,0.361]
select surf_pocket17, protein and id [326,1728,2424,2449,1614,2691,1608,2662,2692,2694,288,291] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.624,0.278]
select surf_pocket18, protein and id [615,620,624,1858,1859,1860,424,426,1852,430,612,6757,6763,6753,415,446,1851,1853] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.894,0.902,0.361]
select surf_pocket19, protein and id [990,998,1002,1200,5507,1019,5514,3952,3953] 
set surface_color,  pcol19, surf_pocket19 
   
        
        deselect
        
        orient
        