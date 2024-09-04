
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
        
        load "data/2zgzA.pdb", protein
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
 
        load "data/2zgzA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1366,1385,1386,809,810,1183,1184,1185,63,66,67,68,69,1378,591,550,551,556,557,832,2195,1354,1355,1356,2194,1402,2198,2201,1367,1369,1370,1373,1555,73,74,1379,518,1531,825,561,562,532,76,80,235,75,60,82,499,83,99,100,2199,2416,2417,2421,49,50,2419,2420,2449,2414,2410,2442,2446,1725,1726,1727,1728,1758,1760,1751,1678,1679,1694,1695,1677,1612,1675,513,503,2216,2217,508,510,511,512,1559,1561,1562,514,1583,1585,1590,1586,1610,1556,2225,1584,1752,2227] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [555,273,525,574,575,577,608,570,573,274,66,553,554,518,524,526,544,499,246,249,623,624,235,239,503] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [678,704,705,706,231,470,214,224,468,374,466,353,485,348] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1175,1176,1198,846,845,857,858,910,1199,1479,1477,1458,1461,1457,1469,890,1470,1472,1200,1205,2504] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        