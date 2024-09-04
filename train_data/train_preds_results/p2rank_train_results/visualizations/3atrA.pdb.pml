
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
        
        load "data/3atrA.pdb", protein
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
 
        load "data/3atrA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2412,2414,2389,2411,2340,2341,2417,2408,2189,1469,2204,429,2747,2749,3064,455,457,458,2714,376,2413,2430,2342,2415,2416,2418,2419,2420,2427,362,363,2428,372,2429,377,378,346,360,361,1268,2175,1483,1484,2171,2174,2190,367,371,366,368,1502,359,355,430,2422,2431,392,2426,401,2421,111,2445,395,396,399,394,397,735,428,406,427,402,405,419,420,454,2335,103,104,107,118,122,807,343,345,341,1257,1270,1253,1258,1277,1278,278,279,280,1248,1251,93,1254,1256,1294,1295,969,96,271,960,965,264,265,266,270,955,966,2396,2401,2849,1671,2404,2405,2398,2399,1472,1728,1729,1731,1732,1690,1733,2407,2409,2777,3055,3058,3059,3060,3028,3030,3031,3032,3054,3066,3065,3034,1673,2913,2944,2945,2908,2912,2910,614,2937,1672,2914,2989,691,2987,1654,1741,1743,1744,1795,1796,2403,1771,1772,1877,1653,613,611,1738,1878,1634,2406,3067,3069,717,722,393,721,574,575,576,729,732,587,595,596,597,704,706,703,705,3039,709,715,716,718,2815,2811,2813,2856,2847,2850,2841,2875,2846,2806,2808,2809,3097,3279,3252,2936,3280,2981,2988] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1811,1812,551,552,761,1842,768,778,779,765,766,767,387,388,1523,1521,2139,2152,2153,1505,358,350,1810,1522] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1427,1433,2224,3578,2213,3551,3553,1459,2829,3576,1458,3620,3621,1447,1406,1402,2251,3555] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1586,1644,1585,623,625,1663,1665,1642,1643,1587,1588,2049,2077,2078,2085,2084,655,2058,1782] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [1478,1479,1892,1899,1902,1903,1906,1914,1915,1918,1921,1888] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        