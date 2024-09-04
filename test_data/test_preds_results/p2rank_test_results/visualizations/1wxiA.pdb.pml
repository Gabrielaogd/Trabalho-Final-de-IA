
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
        
        load "data/1wxiA.pdb", protein
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
 
        load "data/1wxiA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1288,1290,1600,1605,1607,1625,1628,1007,1009,1008,1010,1011,1018,1064,1333,1335,1338,1339,1340,1341,1312,1040,1072,1307,1073,1041,1033,1038,1031,1017,1060,1061,1063,1093,1089,1091,1092,1096,1097,651,1057,1282,1283,1286,1287,1289,1636,1291,1279,1921,1272,1881,1883,1885,1893,1856,1886,1627,1855,1292,1337,1293,1294,1309,1313,1920,1315,1317,1912,1903,1907,1908,1909,1910,1911,1965,1356,1325,1327,1952,1958,1963,1894,1873,2016,2022,1962,1964,402,1217,1254,1443,1606,1662,1664,400,377,395,399,403,407,382,390,383,384,386,393,1442,1476,1588,1589,1595,1596,1599,1560,1568,1212,1218,361,363,1126,358,362,1204,1125,376,675,676,677,678,367,373,375,690,691,635,638,641,647,674] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1353,1362,1363,1137,1133,1135,1131,1132,1159,1130,257,258,293,294,319,290,292,311,312,313,1361,256,1359,1360,1369,1370,1186,1192,1157,321,1179,1155,1156,1158,1178,1161,310,1364] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1423,1430,1465,1425,1232,1234,1231,1236,1233,401] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        