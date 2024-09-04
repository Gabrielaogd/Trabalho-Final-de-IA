
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
        
        load "data/4ej5A.pdb", protein
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
 
        load "data/4ej5A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1865,1868,1830,1832,1833,1834,1867,1869,3048,3049,3050,2913,2914,2915,3020,3021,3019,1777,1806,1810,3011,1776,618,619,620,3086,1618,1620,1622,3085,3079,1617,1619,1627,1632,1866,2154,2164,2166,2135,2137,1936,2155,1957,1958,1959,1940,1382,1370,1373,1378,1842,1843,1362,1363,1361,1811,1365,1335,1621,1623,1895,1897,1377,1381,1469,3043,2073,2074,2126,3063,3066,3067] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [618,620,3086,3523,3524,3079,612,605,3075,3521,2098,3530,2074,2109,2110,3063] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1475,1478,1477,1945,1949,2383,2381,2366,2367,2368,2369,2370,2371,1943,1978,2337,1984,2330,2339,2365] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1054,2492,1051,1032,1033,1503,1504,2467,2466,1502,1010,1022,1023,1024,1447,1029,1068,2438] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2675,2855,2820,2825,2673,2674,2853,2898,918,970,946,950,1918,1917,915,917,972,2650] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2592,2593,2617,2583,986,987,1244,1246,2616,2584,387,388,988] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        