
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
        
        load "data/1x8xA.pdb", protein
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
 
        load "data/1x8xA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [381,383,358,360,370,371,372,373,396,1837,1847,1848,1841,287,403,290,291,292,293,300,404,278,288,289,1547,1552,1770,1765,1782,1540,1543,1544,1761,1529,1534,1775,1777,1781,398,303,307,308,309,310,1369,658,324,1426,539,565,1566,595,597,1567,1569,1559,1558,1560,1568,1400,1401,1402,1403,361,1832,1833,630,631,659,306,323] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [584,586,1393,1394,1357,1358,997,1058,1060,1061,1017,1019,1055,1056,1035,1327,1321,1323,556,558,559,575,577,701,964,993,1016,994,574] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1852,2029,2031,2032,1800,1798,1813,2062,2058,2070,2074,2025,2064,2068,2069,2095] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1069,1098,1100,1065,1386,1354,1324,1325,1167,1168,1349,1351,1143,1123,1357,1060] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1192,1193,1616,1612,1636,1633,1671,1159,1615,1129,1130,1614,1162,1155,1161,1131,1156,1121,1127,1113,1166] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [63,66,61,75,99,100,101,40,62,102,2213,2189,2186,450,451,449,446,448,480,481] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        