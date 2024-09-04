
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
        
        load "data/1g97A.pdb", protein
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
 
        load "data/1g97A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [153,154,78,79,80,68,69,1745,1746,86,73,82,87,1477,1490,1491,1729,734,745,753,160,744,746,49,56,58,60,65,66,51,53,577,596,571,572,533,569,570,552,553,568,567,554,555,735,50,89,1743,1731,1016,1018,1029,1154,1155,1156,1157,1153,1158,1475,1512,1514,1172,1023,1025,1279,1286,1287,1291,1292,1283,1310,1522,1530,576,1510,1294,1026,1005,1162,1027,146,155,161] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [250,1832,1861,1863,772,248,757,276,247,288,2038,2040,278] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2007,2008,2017,2019,2166,2169,2152,2006,2009,2031,2010,2020,2011,1834,1837,1838,1839,1841,197,200,1807,1809,1810,1811,184,186,201,202] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1127,1534,1536,1537,1555,1538,1449,1452,1437,1143,1148,1149,1180,1181,1182,1146,1137,1183,1511,1513,1461,1129] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1774,1777,1724,1726,1796,1797,1720,1721,976,977,1027,1689,1026,990,991,994,1719] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [325,327,328,352,264,296,297,269,271,479,270] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        