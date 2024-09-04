
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
        
        load "data/2hblA.pdb", protein
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
 
        load "data/2hblA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [915,917,933,1964,1966,1664,1965,1962,1937,1936,1765,1807,1808,1810,1769,1434,1373,1405,1363,916,921,1661,1665,1666,1780,1669,1764,935,932,934,1843,939] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [115,94,100,105,108,110,112,1200,1201,198,199,95,116,119,157,158,1008,1458,1459,1470,1011,1013,2270,1456,174,2291,172,2290,177,2289,180] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2408,2409,2415,2416,2421,2422,2426,2410,2297,2298,2653,2654,2429,2427,2428,2465,2467,2784,995,1000,1001,1002,2733,2732,1005,1007,141,142,2696,2697,2700,2701,2702,2703,2783] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1395,1430,1433,1428,960,962,2437,1396,2397,2398,2407,2269,2411,1420,2413,2410,941,943,959,1007,1008,1460] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1385,1389,1383,1384,1386,1388,1371,1548,1561,1577,1564,1565,1566,1563,1576,1562,2224] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [108,110,112,1200,1201,2762,2761,1026,1008,1459,1470,1011,1013,1019,991] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2375,2376,2335,2387,387,381,2254,390,2257,340,412,413,388,469] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [611,888,637,639,566,1332,2036,889,1095,2037,2045,2072,564,609,617] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        