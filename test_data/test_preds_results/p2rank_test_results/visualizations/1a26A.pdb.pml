
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
        
        load "data/1a26A.pdb", protein
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
 
        load "data/1a26A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1882,1883,1885,2562,1878,1884,1969,1971,1973,1642,1635,1637,1638,1881,1968,1940,1970,1972,1639,1618,1949,1744,1876,1745,1748,843,844,845,1648,1681,1966,1967,1988,1990,1656,833,868,869,1709,1736,1749,1752,858,1823,1826,1829,1834,1887,1888,1831,1886,1838,1764,1869,813,808,810,811,834,835,837,812,831,836,860,1765,1892,1893,1905,2559,2560,1942,2561] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2573,2149,2150,2289,1598,2129,1596,1597,2367,2429,2366,2305,2552,2553,2301,2474,2476,1913,2330,2333,2326,2346,2347,2348,1577,2416] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [109,1665,2023,2024,2025,136,138,159,160,2036,110,1673,191,158,1654,1653,1655,1984,187,188,185,1978,105,107] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1987,1988,1989,1990,214,222,224,1656,1657,844,845,1969,809,810] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        