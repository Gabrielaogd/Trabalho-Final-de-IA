
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
        
        load "data/2fsgA.pdb", protein
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
 
        load "data/2fsgA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1739,3866,3868,3892,3871,3856,3889,3891,3886,3870,3872,1624,5006,1638,1639,1619,1724,4977,4959,4960,4970,4971,4974,5175,5186,4997,5002,5004,5148,5150,4947,4948,4937,4945,4940,4941,4942,4943,5212,4961,1703,1704,1721,1722,4950,4913,4951,3916,1705,1723,1767,3922,3923,3924,1726,1733] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.365,0.702]
select surf_pocket2, protein and id [3243,3272,3273,2724,3246,3249,2370,3248,2360,2361,2751,2769,2748,2749,2753,2554,2645,2552,2616,2619,3242,3212,2725,2728,2732,2733,2734,2371,2373,2376,2551,3215,3170,2770,2772,2777,3270,2775,2794,2644] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.361,0.902]
select surf_pocket3, protein and id [3978,5269,5270,5308,4110,5279,5277,4848,4872,4876,4111,4089,4814,4823,4835,5307,4015,4080,4081,4821,4012,4059,4014,4058,3976] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.365,0.278,0.702]
select surf_pocket4, protein and id [624,651,46,15,82,41,81,83,43,40,57,374,375,402,642,652,654,401,594,623,433,114,593,602,600,629,595,606,84,90] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.576,0.361,0.902]
select surf_pocket5, protein and id [2154,3653,3553,3645,3654,2152,2153,3646,3681,3683,3462,3675,3380,3651,3503,3505,3501,3383,3384,3526,3419,3433,3459,3461] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.533,0.278,0.702]
select surf_pocket6, protein and id [1866,1872,1873,744,745,1883,1884,1881,707,708,709,1875,2758,2761,710,713,717,718,3262,2765,1887,3228,3229,3234,3238,3241,1545,2757,2764,1563,1870] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.792,0.361,0.902]
select surf_pocket7, protein and id [1341,1343,3996,3997,3998,3957,1442,3932,3965,3970,3995,3966,1482,1473,1474,1478,1460,1371,1368,1339,1441,1456,1464,1465,1443,4031,1805,1806,1809,1486,3926,3925,3930,1487] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.702]
select surf_pocket8, protein and id [5215,5232,5241,5230,4902,4896,4897,4898,4932,4900,5262,5263,4935,4938,4939,4940,5212,4903,4912,3952,5248,5271,4875,4877] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.792]
select surf_pocket9, protein and id [1883,1884,1881,707,708,709,3258,2116,3257,1879,2068,2069,2081,2045,2046,2058,3262,2093,2097,710,3306,2089,3285,1887,3228,3229] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.533]
select surf_pocket10, protein and id [2232,2234,2235,3369,3371,2266,2268,2261,2262,3586,3582,3583,3584,3599,3595,2146,3346,3347,2163,2165,3576,2123,2302,2267,2293,2303,3616] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.576]
select surf_pocket11, protein and id [2784,2786,2783,2796,2800,2801,2790,3316,3317,2802,3044,3045,3046,3007,3008,3017,2832,3289,3300,3301,3304,2063,3290] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.365]
select surf_pocket12, protein and id [3661,3667,3194,3231,3232,3195,3688,2126,3159,3357,3359,3360,2138,2120,3221,3258,3256,2112,2113,2119,2125,3338] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.361]
select surf_pocket13, protein and id [720,721,2761,719,750,751,737,722,723,724,733,734,746,741,743,745] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.365,0.278]
select surf_pocket14, protein and id [738,766,728,608,578,2032,2030,2031,636,740,765,767,742,702,683,684,687,737] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.576,0.361]
select surf_pocket15, protein and id [1600,1910,3185,3186,3744,3745,3746,1936,1935,3807,1592,3806,3805,3206,3776,3741,3772,3773,3766,3767,3770,3768] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.533,0.278]
select surf_pocket16, protein and id [887,888,1538,1537,1539,771,774,799,772,1044,1045,1258,978,751,752,747,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.792,0.361]
select surf_pocket17, protein and id [4743,5358,5375,4742,4744,4707,4682,4675,4717,4713,4714,4681,4708,4804,4805,4807,4816,4817,4819,4748,4718,4719,4779] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.702,0.278]
select surf_pocket18, protein and id [1712,1401,1403,4887,4884,4885,1718,1710,1709,1348,1354,1356,1374,1375,3963,3961,1388,1399] 
set surface_color,  pcol18, surf_pocket18 
   
        
        deselect
        
        orient
        