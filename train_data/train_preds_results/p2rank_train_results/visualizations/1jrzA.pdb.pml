
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
        
        load "data/1jrzA.pdb", protein
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
 
        load "data/1jrzA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [538,512,515,326,327,1202,508,507,618,613,447,449,517,546,518,519,547,548,543,544,545,347,348,312,302,303,554,537,542,707,706,713,714,715,28,27,29,306,307,308,296,304,305,50,52,54,2219,279,267,274,278,275,132,246,245,131,124,140,268,220,524,526,553,550,555,559,560,221,567,184,142,569,141,185,578,2216,2218,564,31,59,61,63,64,34,108,110,111,112,71,70,62,96,297,298,97,125,126,101,565,566,568,456,457,459,460,461,626,480,481,478,455,624,612,640,622,623,607,439,693,695,696,701,702,705,430,438,448,374,376,368,671,427,429,673,3267,408,416,419,689,691,393,395,453,373,645,654,656,655,479,1240,474,2522,2525,2536,1249,465,466,467,468,469,470,2780,3211,3232,3233,3234,3235,646,2509,2775,1248,2774,2776,1251,1236,1253,1878,1224,1243,1244,1245,1246,3209,3210,2784,2511,3761,2781,2783,3244,3230,3268,3231,3265,3246,3247] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1224,1222,1223,1245,1246,1220,1228,1229,1232,4105,1251,1254,4081,4083,3756,3769,1227,3975,3979,2545,2336,2337,2332,2335,2341,2342,2564,1217,1030,1031,1170,1034,1038,1018,1021,1158,2067,2338,2340,2566,2565,2590,2511,3759,3761,3762,2717,2783,1255,1260,1261,2784,3971,1042,4104,3771,4044,4075,4071,4076,1267,2994,4060,1760,4059,2553,2557,2591,2529,1179,1171,1172,1177,1178,1169,1164,2058,2509,1248,2563,2806,2799] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [615,617,763,781,1196,780,601,1194,1195,530,527,522,523,589,592,594,597,554,2208,2207,2044,2045,2217,2219,576,577,2218,525,787,793,796,779,768,741,1175,799] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [211,257,500,212,223,227,228,225,2045,254,525,503,508,1193,496,509,510,513,527,522,523,1198,1204,1209,2037,2035,2036,1210,2018,499,1935,501,2016,213,2014,485,2015] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [465,466,3211,3233,3234,3235,1858,1859,1855,1860,3209,3210,1862,1883,1886,1879,1880,1878,3202,3204] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2836,2840,2841,1745,3619,2842,3187,3630,1363,1732,1737,1742,1749,2834,3605,3186,1793,3606,1794] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [3020,3022,3024,3048,2997,2999,3000,3025,3028,2491,2467,2707,2689,2457,2459,2458,2445] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [1765,2983,2952,1766,1768,3597,3598,1772,1482,1484,2972,2977,2965,2971,2975,1480,1487,1457] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1145,1161,2278,2025] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        