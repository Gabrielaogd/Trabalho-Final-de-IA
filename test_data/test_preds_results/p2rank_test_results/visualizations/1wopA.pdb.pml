
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
        
        load "data/1wopA.pdb", protein
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
 
        load "data/1wopA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1472,1474,1476,1840,1841,1848,1837,1832,1470,1471,1473,1475,660,770,788,863,787,860,861,862,877,750,751,753,754,756,757,764,876,878,1862,1863,755,1852,875,896,1867,1123,1124,1529,415,416,1542,1545,1769,1770,1771,1750,1754,888,163,164,165,166,170,408,879,1776,1781,1779,1780,1464,1528,1457,1462,1463,1465,1443,1330,1331,1319,1326,1327,1328,1329,1485,1842,1844,1845,1846,1827,2798,2799,1318,1492,1506,1426,1430,661,662,2005,2006,2008,2003,2780,656,657,658,659,2009,652,2819,1990,1853,1975,2746,2747,2779] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1543,1544,1540,1083,1110,1111,1546,1547,1548,1549,1559,1080,1082,1103,847,835,848,447,1427,1366,1541,1429,1369] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [711,1941,1944,2137,2138,2141,1969,1970,1971,2163,2168,1925] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [372,1769,1772,1529,1470,1137,373,1466] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2438,2446,1781,1779,1780,1782,163,2430,2433,2434,2435,1887,2425,2291,1863,1884,1885,1886] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1892,1897,2428,1912,2410,2413,1936,2193,2538,1925,1926,1883,2312] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        