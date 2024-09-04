
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
        
        load "data/3ayiA.pdb", protein
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
 
        load "data/3ayiA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [720,721,2957,4805,4806,354,355,358,2942,707,2983,2984,559,560,710,711,2949,347,3014,344,543,2682,542,553,730,869,870,873,4463,4465,716,866,4468,713,717,718,712,4491,570,571,572,4498,566,567,573,2681,2672,2673,2678,561,565,2661,703,4490,701,4904,362,363,4799,4863,4864,901,4867,4879,4875,4868,4886,868,874,3456,3457,867,879,899,882,885,887,2393,4877,889,890,4520,4507,2982,2980,2979,4462,4518,3442,3861,4528,4529,4530,4531,4547,4548,4862,4814,3860,3862,2226,3879,3882,4873,4874,2367,4876,2203,2319,2182,2183] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.353,0.702]
select surf_pocket2, protein and id [878,2458,853,854,880,3742,3743,3744,3751,849,832,3473,3837,3840,3823,3824,877,1081,2412,1089,1090,1069,2416,2434,2457,2431,1064,1065,3750,2438,3759,3762,3763,3764,3748,856,2413,2410,2411,1063] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.388,0.361,0.902]
select surf_pocket3, protein and id [5156,1759,1760,5154,4597,4598,4601,4593,4591,1788,1789,1756,1758,4603,1791,153,4626,4624,4625,5147,148,150,1710,1711,1712,1707,5148,5152,5153,4658,4660,1747] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.396,0.278,0.702]
select surf_pocket4, protein and id [1102,1107,2151,2157,2158,1247,2375,2376,2165,2166,2169,2174,2175,2177,1255,1384,1385,1248,1103,1116,1117,1118,1108,1109,1115,2374,1408] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.631,0.361,0.902]
select surf_pocket5, protein and id [2359,2316,2322,2324,2352,2353,2326,2357,1431,1429,1430,1384,2368,2376,2166,2167,2169,2366,2171,1408] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.584,0.278,0.702]
select surf_pocket6, protein and id [3271,3235,3236,3237,3238,3239,3240,3217,3218,3287,3290,4734,3289,4742,4743,4746,2728,2760,2716,2711,2713,2714,2719,2758] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.875,0.361,0.902]
select surf_pocket7, protein and id [1003,407,436,226,438,995,997,998,999,1000,405,2576,202,224,972,974,98,227,969,975,68,69,70] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.627]
select surf_pocket8, protein and id [1701,1703,1584,1602,1648,1667,1664,1531,1532,1736,1738,1739,1546,1547] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.682]
select surf_pocket9, protein and id [4445,703,4017,4020,671,4490,588,573,4038,4040,4011,4012] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.439]
select surf_pocket10, protein and id [4300,4302,4228,4230,4231,4296,4270,4271,4278,3556,1309,1310,1224,3578,4227,4226,4225,4246] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.439]
select surf_pocket11, protein and id [1898,1395,1925,1919,1494,1500,1964,1965,1484,1490,1491,1493,1389,1391,1393,1410,1411,1413,1414,1396] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.310,0.278]
select surf_pocket12, protein and id [127,126,169,1674,1627,180,181,184,185,5084,5111,106,210,212,211] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.522,0.361]
select surf_pocket13, protein and id [301,303,305,2914,5009,284,287,281,289,290,2902,2904,2746,2903,296,2901,4746,2915,4763,5024,5026,4998,2744] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.502,0.278]
select surf_pocket14, protein and id [1989,1993,1995,2002,2083,1994,1196,1345,1346,1344,1984,1189,2084] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.765,0.361]
select surf_pocket15, protein and id [4329,4330,4331,4175,4177,4178,4179,4180] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.690,0.278]
select surf_pocket16, protein and id [134,136,146,154,4842,4843,160,4651,4922,4923] 
set surface_color,  pcol16, surf_pocket16 
   
        
        deselect
        
        orient
        