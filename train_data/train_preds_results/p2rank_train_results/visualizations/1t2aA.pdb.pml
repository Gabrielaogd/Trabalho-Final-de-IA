
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
        
        load "data/1t2aA.pdb", protein
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
 
        load "data/1t2aA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [635,636,637,1485,1484,1483,648,1163,1165,951,1188,1189,620,622,252,253,621,728,249,618,623,250,251,729,615,756,438,444,445,446,433,440,437,439,1456,1404,652,654,976,979,977,978,950,955,962,963,948,653,78,82,87,70,74,75,323,609,55,56,58,610,52,72,300,303,233,239,245,431,236,86,1408,1405,91,92,93,94,1413,1382,1385,935,936,1403,1711,970,1712,2388,1402,1388,1397,1398,1381,1477,1471,1487,1488,1491,1492,645,647,1475,646,2355,2356,2354,1460,1423,1493,1518,1661,1520,2333,2328,2329,2331,1662,2327,1666,1709,1731,1694,2380,2381,1990,1989,1668,1669,1670] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1074,1110,1111,1224,1225,1239,1238,1906,1909,1081,1262] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1570,1551,1621,1641,1572,1620,1542,1466,1467,1513,1515,1543,1517] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        