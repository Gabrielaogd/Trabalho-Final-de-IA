
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
        
        load "data/1x55A.pdb", protein
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
 
        load "data/1x55A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2726,2920,1676,1325,1326,1327,1328,2901,1815,1816,1504,1832,1501,1502,2836,2900,2902,2469,2500,2502,2459,2463,2643,2645,2690,2688,2677,2460,1323,1324,2458,3271,2919,2921,2922,2924,2925,3283,2927,3272,2715,2691,2950,1786,1787,1792,1673,1674,1749,1761,1789,1791,1740,1755,1756,1757,3319,3320,1745,1348,1691,1672,2906,1788,3293,3317,1790,3292,3414,3310] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [3382,3388,3389,3431,3396,3432,3393,3394,3395,3434,3435,3437,1054,1031,1032,1035,3429,3430,3433,3436,3438,958,894,853,861,862,865,868,987,988,858,859,860,920,1013,1022,1026,1027,1028,1029,1030,2150,2152] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1085,1086,1087,1799,1800,1801,3311,1802,1804,1805,1084,1089,1116,1117,1118,1636,1781,1776,3454,3457,3446,3449,3450,3458,3461] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1294,1295,1297,1302,1307,1305,1296,1304,1319,1510,1511,1512,1523,1524,1489,1476,3149,3152,3115] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1911,2766,2627,2629,2630,1910,2300,2633,2299,2802,2320,2806,2817,2751,2752] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1316,1329,1330,1333,1334,1312,1308,2700,2703,3070,3078,3079,3086,3085,3087,3128,3130,3081,3084,3088,2696] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [3493,3491,3492,3421,3405,3406,3511,1714,904,928,929,3513,905,3423,3473,1709,1710,1711,1712,1713,1722] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [625,626,709,707,399,693,278,710,297,638] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        