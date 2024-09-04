
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
        
        load "data/3d4pA.pdb", protein
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
 
        load "data/3d4pA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [895,896,897,885,891,890,610,611,606,85,86,88,93,589,597,600,602,1078,97,1789,99,881,882,884,587,590,1714,1752,1750,1747,1102,1133,1791,92,1746,1112,1327,1328,1646,1674,1678,1679,1680,1683,1329,1330,1338,1339,1653,898,903,618,1318,651,1322,1326,1321] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1093,1118,1120,1951,1153,1154,1155,1934,1952,1279,1286,1287,1288,1289,1274,1939,1946,1933,1936,1123,1099,1104,1124,1781,1806,1829,1249,1251,1252,1830,1801,1802,1803,1241,1095,1807,1097,1828,1945,1827] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [589,596,597,598,599,600,601,602,73,260,268,731,764,766,502,503,267,269,84,85,78,70,255,259,261,262,266,79,252] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1778,1779,1105,1133,1706,1751,1754,1766,1770,1773,1737,1736,1704,1130] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [997,999,715,714,927,2378,2379,2380,984,985,924,949,951,2381] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1588,1623,1591,1595,1385,1387,1478,2286,1370,2254,1351,1625,2288,1368,1620] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [474,41,222,517,220,221,542,534] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        