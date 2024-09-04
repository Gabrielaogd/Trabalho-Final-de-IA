
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
        
        load "data/2wboA.pdb", protein
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
 
        load "data/2wboA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [907,1591,1577,1588,1590,1062,1068,1056,1057,1067,1013,1051,1041,1043,904,964,979,913,916,648,649,998,995,997,658,1630,656,654,1628,1631,1623,1633,1141,1143,1145,1160,1161,2294,1575,1576,1578,1116,1117,1142,1144,1045,1104,1111,1118,1159,2292,2457,1264,1265,974,975,1061,2438,2303,1343,2298,2455,1957,1049,1947,1934] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1183,1753,1756,1728,1729,1730,1727,1178,1197,1198,1752,1793,2558,2561,2626,2627,2628,2554,2555,2557,883,885,1185,1737,1700,1206,1208,1209] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1365,1366,2265,509,510,1367,1368,1369,1372,1373,1375,1387,2122,2120,2121,1891,1888,1389,1881,2266,2267,483,15,16,508,2140,2138,478,1377,1383] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1938,1939,1946,1130,1131,1133,2110,2109,2111,2074,1350,1108,1128,2130,1104,1106,1113,1118,1119,1105,1107,1109,1122] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1233,1898,2257,1214,1193,1195,1905,1904,2256,1894,1896,1902,1216,1218,1219,1837,1914,1838,1918,1196,1916] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [745,747,772,129,746,564,575,128,715,737,738] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [951,752,952,694,229,230,695,727,762,753,723,224,688,689,690,691,693,216] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        