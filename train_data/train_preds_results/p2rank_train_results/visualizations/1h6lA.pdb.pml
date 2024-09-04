
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
        
        load "data/1h6lA.pdb", protein
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
 
        load "data/1h6lA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2222,1841,1443,1807,1811,1813,1817,1843,1839,565,582,1024,1028,554,563,564,205,209,2211,2221,2223,204,1011,1424,1427,1430,1801,1798,1436,1439,1440,549,550,1419,1420,1421,1422,1423,1794,1795,2205,1793,214,217,218,221,222,566,570,569,593,1459,591,2674,2703,2704,2671,2673,2660,580,581,197,1816,2227,2232,2237,2239,1837,2658] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2203,177,179,365,1001,1002,1162,1792,1405,1541,1775,1776,721,178,2184,2202,1931,1932,1933,2369,2185,2186,2187,2188] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [152,153,154,148,353,146,397,384,483,460,458,414,415,128,137,457,142] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [385,534,802,801,510,511,512,513,489,860,492,389] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [1362,1370,1377,1380,1381,1383,1606,1384,1388,1604,1533,1582,1583,1584,1585,1653] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1957,2102,2103,2104,1945,1729,59,60,2084,57,1760,1942,1725,1739,1740] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [893,783,878,879,898,904,906,907,933,750,751,782,781,780,712,802,801,510,511,513] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [284,2252,2254,2255,2256,2257,285,2251,2253,2625,2654,2628,2266,2269,2299,2668] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        