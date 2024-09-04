
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
        
        load "data/1mehA.pdb", protein
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
 
        load "data/1mehA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1518,1519,1521,1850,1511,1513,1510,1118,1119,1593,1586,1587,1591,1854,1857,1501,1508,1114,1115,1603,1605,1522,1526,1527,1530,1532,1533,1535,2235,2327,2328,2329,2247,2248,1562,1572,2005,2008,1847,1841,1844,1858,438,1344,1489,1843,1845,1105,1106,1107,1110,1111,452,454,2238,2242,2243,2012,2016,2020,453,442] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1798,1800,1797,1751,1752,1753,1754,1975,1801,1802,2588,2616,2589,2590,273,308,309,328,274,379,1961,1963,1712,1721,1722,2612,2613,348,349,335] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2511,235,404,2475,2477,253,247,2452,2454,2456,2485,2459,558,2449,811,812,813,814,221,562] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1107,1103,2241,2242,2245,2283,619,2306,2309,445,616,618,617,620,621,624,1104,919,920,925,934,935,937] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1515,1517,1512,1513,1853,85,97,84,1631,1624,1627,93,83,1623,86,90] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [127,133,134,137,138,1893,1894,1895,2523,2524,140] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        