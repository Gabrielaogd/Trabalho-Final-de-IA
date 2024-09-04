
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
        
        load "data/3rmeA.pdb", protein
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
 
        load "data/3rmeA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1559,1561,1560,1558,642,625,639,640,641,2719,2721,2754,2002,2755,2228,2229,2208,2209,2210,2211,2193,1550,1552,2007,1530,1545,2004,621,626,627,628,630,631,633,635,974,1011,1531,1532,1534,986,1336,1339,1340,1341,1364,1366,982,984,1365,91,92,93,307,309,311,71,86,87,88,89,90,400,392,85,2720,2723,2705,53,1323,2722,2724,2725,952,975,2746,1614,1608,1612,2022,2021,2227,2215,1557,1563,1569,1342,1796,1345,1349,1353,1762,1357,1350,1781,1761,1784] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1769,1771,1735,1746,1734,1736,1638,1639,1640,1641,1646,2113,2115,1637,2110,1737,1578,1579] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2327,2320,2525,2526,2540,2362,2543,2257,2259,2295,2834,2832,2833,2815] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [2311,2276,2303,2304,2309,2302,2335,2338,2176,2241,2158,2159,2238,2164,2490,2470] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1785,1787,1826,1828,1830,1861,1863,1905,1823,1855,1856,1849,1897] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [248,544,234,2911,2969,2965,252,254,257,554,555,2942] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [519,889,898,912,576,515,517,518,888,887,890,891,862,1269,1270,1263,1271,1272] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1351,1383,1786,1787,1830,1861,1863] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        