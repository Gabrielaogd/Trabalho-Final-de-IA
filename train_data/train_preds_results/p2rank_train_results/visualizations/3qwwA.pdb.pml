
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
        
        load "data/3qwwA.pdb", protein
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
 
        load "data/3qwwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1891,1875,1876,1879,1880,1893,1871,1911,1708,1685,1688,1689,1691,1709,1870,1912,3018,3019,1658,1660,1661,1782,1910,1682,1684,3050,3051,1683,3017,3030,3040,1442,1444,1445,1450,1452,1453,1588,1881,2046,1884,1886,1887,1888,2044,1425,1437,1608,1595,1457,1477,1474,1475,1476,1509,1892,1898,1899,1906,1454,1459,3059,3060,1510,1511,3049,3045,3007,3044] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1608,1619,115,101,102,100,103,1600,1595,1598,98,104,106,1045,1046,1048,112,1047,997,119,120,1887,1888,1621,2042,2065,2067,2069,2064,2066,2068,1065,1425,1437,1064,2039,2051,2063] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [388,260,602,601,290,267,266,638,874,597,1729,386,609,288,393] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [415,3379,3381,3407,418,3383,1493,365,367,398,1534,411,407,410,1702,3365,3370,3371,1720,1721,1723,1713,1703] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [1905,1931,1932,2968,1921,3059,2729,2766,2754,2756,2727,2751,2752,2757] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [1948,2171,2168,1938,1963,1939,2199,2201,2200,1952,1954,1955,1956,2167,2340,2341,2309,2313,2306] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [1999,2000,1959,1960,1998,1927,1928,1929,1930,1931,1932,1961,1964,2403,2402,2441,2729,2409] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [1861,1862,1863,1636,1649,1864,2085,2086,2093,2096,106,107,2083] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [1417,794,795,784,1460,1545,1544,786,788,1407,1409,821] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [2980,3066,3269,3295,2978,2976,3023] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [1481,3078,1472,3051,1693,3333,3334,1706,1699] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        