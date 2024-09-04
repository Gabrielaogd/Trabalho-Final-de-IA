
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
        
        load "data/3u52A.pdb", protein
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
 
        load "data/3u52A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [869,1595,1597,1598,1599,1664,1596,866,864,865,870,871,878,898,1100,1099,1663,821,847,1665,877,876,1608,1641,1637,1607,1863,1864,1865,1592,1126,1630,1631,1636,1671,1674,1676,1710,1661,1667,1668,1662,1806,1807,1833] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.333,0.702]
select surf_pocket2, protein and id [3922,3882,1367,1369,1370,1371,1366,1368,2824,3268,3241,2816,2818,3253,2800,2802,3874,3852,3849,3851,3753,3780,3275] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.443,0.361,0.902]
select surf_pocket3, protein and id [2636,2164,2191,2201,2635,3374,3578,3580,3584,3587,3588,2659,2662,2686,2698,3367,3381,3387,3388,3385,2657,3393,3391,2689,3376,3443,3444] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.463,0.278,0.702]
select surf_pocket4, protein and id [3761,3762,3763,3554,3556,3527,3543,3699,3522,3306,3307,3288,3547,3550,3281,3284,3551,3277,3280] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.741,0.361,0.902]
select surf_pocket5, protein and id [817,818,819,820,822,794,1782,1192,1781,1780,1157,1710,1804] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.694,0.278,0.702]
select surf_pocket6, protein and id [2060,2097,2100,2095,1526,3657,2059,307,1492,1496,309,299,301,296,305,2125,3646,3648,3658,2081,2082,2084,2086,3681,3655,3656,3682,3683,1488] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.757]
select surf_pocket7, protein and id [3328,3329,3713,3714,3717,3718,3721,3722,3685,3678,1423,1400,1399,1428,1429,1465,3680,3690,3692,1455,1457,1460,1461,1462,3682,1421,1422] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.475]
select surf_pocket8, protein and id [369,398,1516,1545,1015,1978,1976,1514,988,989,990,991] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.459]
select surf_pocket9, protein and id [2732,2233,2769,2771] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.318,0.278]
select surf_pocket10, protein and id [2240,2234,846,848,2230,2207,2209,2210,2211,2232,869,840,1666] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.561,0.361]
select surf_pocket11, protein and id [1333,1335,1419,1459,1482,1342,1343,1424,858,889,890,893,1446,1481,883,886,917,1304,859] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.553,0.278]
select surf_pocket12, protein and id [361,995,1007,999,1002,1006,148,359,371,372,121,123,120,360] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.859,0.361]
select surf_pocket13, protein and id [1626,1627,2497,2590,2142,2143,2146,1588,2149] 
set surface_color,  pcol13, surf_pocket13 
   
        
        deselect
        
        orient
        