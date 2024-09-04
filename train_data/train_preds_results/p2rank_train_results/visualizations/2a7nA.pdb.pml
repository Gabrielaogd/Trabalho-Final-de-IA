
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
        
        load "data/2a7nA.pdb", protein
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
 
        load "data/2a7nA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2009,2010,2011,1027,1242,1026,1637,2027,2004,2005,2012,2013,2026,2014,2015,2388,2225,2226,1260,1261,1262,1263,1267,2039,281,282,280,196,201,202,203,655,1363,1365,2028,206,1288,1318,633,641,643,644,1008,842,854,1024,2377,2378,2376,2380,2247,2248,647,648,654,211,680,2409,2385,1021,1636,1041,1043,1458,1459,1635,1611,1613,1624,1381,1383,1430,1614,1431,1592,1607,1591,1042,1595,1453,1454,1455,1457,1842,1843,2216,2217,2218,2219,2220,2224] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1687,1688,1683,1685,1686,1684,1889,1890,1891,1669,1670,1671,1676,1682,1708,1711,1214,1225,1226,1228,1663,1660,1227,1847,1833,1855,1665] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [221,78,79,216,317,318,2226,316,280,281,282,283,50,2247,2248,2245] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        