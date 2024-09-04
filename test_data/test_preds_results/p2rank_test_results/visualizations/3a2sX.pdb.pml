
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
        
        load "data/3a2sX.pdb", protein
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
 
        load "data/3a2sX.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1493,1597,1486,1489,1612,1928,1930,1927,1594,1931,1932,1929,1595,1596,1598,1849,1891,2171,1499,1502,1504,1599,1501,1864,1865,1866,1517,1821,1818,1639,1823,1824,1825,2218,2219,2220,2221,2222,2223,1933,1934,2147,2163,1925,2162,2199,1946,1949,1816,1817,1935,1942] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [706,306,462,53,575,479,568,954,291,289,734,736,737,705,732,571,952,795,71,280,812,813,814,2581,2579,2580,762] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [788,790,791,2301,2560,2021,2371,2320,2321,2581,771,1760,1762,1721,1722,759,2000,2058,2060,2020,2059,1756,1757,1758,1759,1761,2074,2076] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [785,891,938,912,885,893,910,911,849,851,852,854,850,853,820,939,782,795,762,754,755,783,568,734,736,737,935,934,732] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [743,742,745,995,1015,1017,1074,1073,1076,1014,1078,1313,1314,1084,671,1016,717,719,1327,1329,1403,1315,746] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [422,623,625,419,421,594,596,655,671,654,444,579] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1638,1533,1534,1535,1447,1282,1283,1640,1431,712,1305,1430,945,927] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        