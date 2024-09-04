
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
        
        load "data/2dtxA.pdb", protein
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
 
        load "data/2dtxA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1383,1384,1385,1399,1400,1407,1397,1367,129,120,122,123,124,296,298,607,610,611,613,1024,1167,1135,1166,617,619,620,616,136,133,137,276,286,288,103,104,279,408,270,402,105,115,281,287,391,627,792,793,401,415,414,395,400,1036,1037,1137,636,637,1050,1053,1091,1092,1093,1097,1043,1347,1352,1353,1354,1356,1361,1618,1349,1033,1029,1078,1079,1081,1082,1888,1889,1890,1073,1074,650,652,653,654,1432,1431,1585,1406,1362,1577,1579,1580,1581,1582,1584,1574,1576,1605,1606,1461,1462,1463] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1370,1863,1865,1663,1664,1699,1861,1867,1652,1698,1700,1631,1632,1869,1875,1876,1877,1879,1633,1634,1617,1851,1874,1647] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1857,1858,1837,1056,1057,1224,1225,1343,1834,1838,1829,1830,1826,1828,1058,1195,1196,1197] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        