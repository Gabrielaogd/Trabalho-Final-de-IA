
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
        
        load "data/3b7nA.pdb", protein
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
 
        load "data/3b7nA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1257,1617,1616,1220,1221,1741,1743,1744,1745,1721,1618,1215,1218,1248,1250,1252,1253,1255,1280,1281,1282,1283,1284,1254,1251,1432,1433,1592,1593,1594,1590,1765,1852,1581,1579,1580,1582,1574,1842,1843,1011,1031,1032,1033,895,878,1445,877,1180,1182,1183,1461,1047,1048,1050,1477,1046,1066,1186,1584,1585,1063,1065,1108,1185,1119,1521,1530,1555,1558,1559,1560,1522,1547,1118,1498,1821,1528,1531,1822,1476,1495,1497,1523,1062,1082,918,1009,1012,1243,1208,1214,1620,1623,1619,1913,1877,1912,1942,1654,1652,1653,1941,1918,1919,1972,1921,1645,1678,1679,1644,548,1649,1688,1691,1694,1714,1715,1718,1719,1702,1934,1964,1933,1935,458,455,457,1707,1708,1709,1706,1703,1695] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [13,20,22,21,1266,1416,389,48,64,395,396,374,375,388,354,355,1676,1681,432,434,1267,1683,1666,1710,1711,420,421,625,623,1289,1290,1291,1293,1295,1297,1327,14] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1427,1696,1697,105,96,102,1420,1695,1701,451,110,111,131,106,1717,1964,112,113,84,1412,1399,1417,79,981,1723,983,1426,1733,968,984,969,970,971,1725,1734,1411,1405,1393] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [890,2296,818,2457,2458,2459,2469,2471,914,916,1010,1245,1319,2305,2437,1274,891] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [946,936,2316,2317,2318,2319,2324,2325,2128,2127,1371,1372,2320,2355,2358,2386,1370,2384,938,2313] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [133,139,156,157,73,140,383,223,136,198,201] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        