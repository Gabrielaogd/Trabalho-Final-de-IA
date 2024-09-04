
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
        
        load "data/3in1A.pdb", protein
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
 
        load "data/3in1A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1943,1938,1939,1940,1941,1942,821,1948,1951,1930,1950,2187,1875,2188,2164,2167,1500,1730,1732,1733,1734,1952,1766,2144,1874,1527,1302,1304,1305,729,728,833,834,835,1330,889,836,1926,2208,103,104,2210,817,819,99,100,739,740,737,738,1502,1528,1931,1932,1742,1743,1744,1745,1746,1747,1933,1910,801,820,816,818,1960,325,326,1962,1949,1955,2162,2214,2218,2219,2224,2211,2231,2141,286,295,73,89,90,291,294,280,281,87,88,879,713,839,712,282,105,304,1289,1961,1287,1288,1066,1953,1977,305,1092,1093] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [1298,1301,1082,1490,1493,1494,1477,1655,1657,1558,1396,1084,1523,1529,1530,1524,1284,1285,1071,1073,1476,1074] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        