
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
        
        load "data/1c3jA.pdb", protein
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
 
        load "data/1c3jA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [959,2013,2011,1962,1162,1165,1188,2014,2018,2021,727,729,1397,1398,1400,718,958,719,720,721,755,726,165,167,137,138,527,166,1804,1805,512,518,524,513,201,1367,1368,1369,1370,1361,2029,2030,1365,1371,1372,1373,1375,1586,1583,1827,2061,2062,1828,2026,1860,2022,2068,1379,1380,1378,1584,1350,1356,1859,139,1595,1803,1786,1783,1778,2012,1430,1961,1902] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [970,1133,1178,2598,2599,2051,2052,2573,2567,2077,2216,2218,2221,2566,2004,2005,2006,2038,1132,2211,2206,2207,2208,2574,1150,1151] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1833,1834,1249,1251,1256,1275,1253,1829,1198,1199,2082,1271,1258,1237,1801,1807,1810,1822,1809,1196,1225,1240,1197,190,192,1206] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1183,2634,2635,1159,235,260,202] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        