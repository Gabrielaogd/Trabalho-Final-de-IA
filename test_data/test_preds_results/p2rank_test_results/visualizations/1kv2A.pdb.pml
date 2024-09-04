
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
        
        load "data/1kv2A.pdb", protein
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
 
        load "data/1kv2A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1166,1169,264,358,856,224,222,223,851,853,854,644,818,1246,1247,1248,820,1249,565,824,839,837,843,844,847,848,849,1157,1159,1165,860,862,802,356,357,366,801,803,809,810,656,1265,1267,1268,265,220,221,374,530,370,373,566,1258,1259,1263,1264,1146,1266,1250,1254,1252,1253] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [1244,1250,1254,1255,1257,1253,517,518,557,558,1096,1098,1091,1093,1080,1085,529,524,527,528,530,592,635,565,591,643,1243,1043,1240] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1385,1386,1792,1810,1791,1802,1803,1804,1805,1368,1875,1666,1367,1743,1815,1836,2119,1333,1336,2117,2128,2135,1337,1340,1384,1388,1389,2130,1769,1793,2121,1770,1381,1372,1378,1382,1383,1391,1407,1408] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [965,999,2316,939,937,973,629,1213,975,621,1001,2319,963,2269,2272,2275,2271] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1051,2179,2183,2176,2177,2178,1023,2184,2188,1019,1049,1059,1021,1056,1434,1436,1433,1444] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [829,830,652,1233,603,605,606,614,633,589,595,598,599,646,647,649,2608,2609,663] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [865,866,859,867,875,870,947,1175,1537,1538,1539,1541,1542,918,907,880,908] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        