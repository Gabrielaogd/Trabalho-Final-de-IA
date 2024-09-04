
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
        
        load "data/1z2pX.pdb", protein
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
 
        load "data/1z2pX.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2291,2305,1100,1151,1152,1154,1155,1678,2290,1675,1172,733,2289,1405,2283,2288,2280,1072,1323,2282,1669,1667,1668,1534,1901,1665,1695,1056,1170,1653,1550,1055,1070,1071,1371,1372,1543,2197,1341,1343,1549,1539,1540,1541,2198,1350,1328,1347,1437,2326,2332,2333,2336,2337,2303,2304,2306,2161,2162,2329,1420,1421,1404,1526,1527,1902,1511,2178,2179,432,433,1107,1110,107,109,431,1106,102,132,133,105,446,448,451,100,1111,1112,1113,1114,1117,1118] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1792,1816,1817,1818,1789,1790,1566,1376,1842,1843,1374,1377,1378,1380,1385] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [489,490,493,494,484,485,517,488,65,66,68,328,339,495,450,83,80] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        