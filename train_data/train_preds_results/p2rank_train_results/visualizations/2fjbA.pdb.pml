
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
        
        load "data/2fjbA.pdb", protein
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
 
        load "data/2fjbA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1818,1820,1821,1823,2061,2064,2080,3154,3155,2045,2065,2079,2146,2118,2131,2135,2144,2145,544,3532,3533,3535,3538,3518,3539,3541,540,542,543,1134,1137,3144,3145,3153,3161,528,1100,1101,2149,2476,2459,2497,2498,2499,2472,2477,2511,2066,2537,2500,2173,2174,2176,2177,2178,2068,2070,2237,2302,2304,724,3520,723,725,2453,1121,2454,2185,756,1119,2186,2172,2175,2171,2221,2233,1106,1110,2501,2312,2313,2293,2452,3534,3542,3543,241,245,491,483,478,480,484,1815,1808,1813,1793,1801,1802,3474,3475,3476,1673,1674,1679,1834,1836,1869,1868,1832,1838,1839,1828,1829,3563,3562,3469,3466,252,256,257,1669,1678,1672,1675,496,1859,1861,473,476,1849,431,432,1854,1371,1373,238,474,422,423,1677,477,429,430,416,424,1361,428,1376,1379,1380,1381,1885,1886,237,229,230,410,411,227,2900,2901,502,504,2897,2899,2907,2908,522,514,516,520,524,527,517] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1402,1401,1403,3814,3839,3841,3837,3836,4389,4415,4426,4427,4428,4545,4546,4570,4571,3869,4444,1946,1947,4608,4611,4391,1943,5001,5000] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [4524,4525,4523,1850,4098,13,14,4492,1,3,4,1770,1774,12,1876,4526,4555,4522,4059,4060,4061,4064,4065,4068,4501,4521,4132,4133,1763,1764,1766,1787,1790,1788,1789,1791,1848,1846,1704,4096,4099,4105,4590] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [2385,4854,4866,4852,4855,4825,4770,2396,2520,2521,2553,2383,2354,2356,2358,4807,4808,4805,4830,4247,4248,4810,4811,2577,2581] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [844,3249,3378,3612,3230,3248,3247,3611,869,870,871,879,880,882,883,3376,3227,3233,3354,3372,3658,336,3630,3631,3632,3656,3598,3607,3609,3637,3628,3634,3367,300,301] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [3601,908,300,301,3602,3603,3598,3607,336,3630,3581,3611,878,879,880,882,883,877] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [5127,5185,5187,4931,5110,5168,5186,740] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [1169,1170,1171,2820,2823,2857,1009,1010,1012,1015,2832,2792,2794,2795,2830,1022,1019] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1749,3075,2101,4238,1751,2569,2570,2611,2610,4229] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [3423,1481,3349,1461,3424,3426,3427,3700,3671,3701,1458,3722,3735,1435,1485,1632,3719,3716] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [623,1015,1080,1081,2195,2832,2793,2795,2196,2197,2833,2802,1022,1029,1034,624,2190] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        