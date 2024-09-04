
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
        
        load "data/3b4yA.pdb", protein
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
 
        load "data/3b4yA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [547,550,564,797,269,563,837,794,599,273,322,813,814,815,816,1965,1969,283,264,59,1902,1903,84,1883,1904,540,541,544,1721,802,804,805,806,807,964,1963,1338,1339,1457,1462,1973,1971,1482,1332,1333,1334,1335,1449,1452,1330,1331,1446,1336,1340,1341,1956,1957,1955,1480,1463,1722,1738,1739,933,935,931,932,1967,1342,1343,937,1363,1364,1926,1930,1938] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [677,678,537,395,405,424,414,422,673,675,676,761,724,668,669,762,699,401,402,439,434,435,726,665,666,686,690,454,525,453,528,529,530,531,521,527,523,522] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1719,1448,2361,1706,1314,1435,1316,2341,2342,2343,2344,2345,2346,1449,543,773,252] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [37,38,2489,2491,2492,2493,2494,30,31,218,2457,2490,208,217,2466,209,189,43,190,45] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [2412,2413,2443,1810,1841,2395,2398,2452,2425,1773,2394,1757,2387] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [2286,2287,2315,2275,1471,1472,1473,2174,2138,2158,1483,1484,1487] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1516,1590,1591,1593,1582,1583,1584,1439,1441,1552,1553,1695,2327,2326,2319,2320,1696,2306,2318] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        