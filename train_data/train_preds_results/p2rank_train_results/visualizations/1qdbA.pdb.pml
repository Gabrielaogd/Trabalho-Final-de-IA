
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
        
        load "data/1qdbA.pdb", protein
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
 
        load "data/1qdbA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [466,469,470,2887,2891,2894,475,465,462,472,267,2896,445,447,451,454,455,458,414,522,525,547,548,549,550,545,546,551,552,558,570,269,270,3660,573,3669,3658,404,594,595,596,575,578,579,605,574,3704,3717,3719,400,2211,2210,2217,2224,2226,2245,2246,2231,241,2228,491,492,494,474,484,215,2191,2889,2897,2898,2918,2919,2925,2254,2238,2252,2253,2244,2305,1368,1369,1370,1371,1359,1360,1367,1924,1925,1926,1928,1929,1911,1912,1914,1915,1916,2880,2886,2878,726,735,736,737,699,1361,1362,723,727,728,772,1122,1121,413,415,1902,1903,1906,1892,1896,1899,2881,1395,1397,1398,1399,1790,398,396,1787,1788,1775,1777,697,701,694,1423,1422,675,676,683,665,1418,1420,682,1413,1416,1417,1548,1372,493,495,496,2213,2212,1340,1333,1338,1341,1342,2091,2090,1088,1336,1086,1087,2174,2178,2179,1276,1277,2079,2080,2081,2082,2083,2045,2050,2053,2054,2059,1307,1312,2107,2109,1309,185,994,995,998,1000,999,1016,1018,1023,1024,1014,1353,1355,1356,183,145,146,147,1001,2195,2196,2197,148,149,150,117,151,1032,1033,1034,1070,1071,1081,1005,771,83,120,118,2926,2928,2930,2938,2939,2940,2941,1927,1963,1965,1967,2931,2004,2005,2072,2046,2073,2039,2006] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2953,2952,2008,2924,2929,2452,2453,1992,1998,2006,2009,1997,1995,2028,2335,2326,2336,2337,2027,2931,2007,2041,2042,2064,2067,2073,2297,2301,2320,2065,2321,2327,2930,2935,2066,2254,2304,2305,2393,2394,2395,2425,2417] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2493,2494,2529,2873,2876,2530,320,323,315,2890,2898,2918,2919,2464,2458,2459,2460,2461,2462,2463,2424,2237,2238,2239,2253,2432,2434,2427,2891,2893,463,464,275,276,2895,448,449,2872,293,292,343,342,341,2226,2880,2878,2881] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1981,1971,1978,1980,1209,1970,2013,2033,2035,2017,1329,1936,1938,1281,1288,1290,1291,1293,1292,1283,1210,1213,1260,1294,1321,1319,1327,1328,1178,1206] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2205,2267,2221,2222,2185,2186,2187,2116,2171,2132,2133,2172,175,206,208] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [898,648,649,650,887,886,885,1532] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        