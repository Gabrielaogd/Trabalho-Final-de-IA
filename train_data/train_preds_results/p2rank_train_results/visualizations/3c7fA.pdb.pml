
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
        
        load "data/3c7fA.pdb", protein
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
 
        load "data/3c7fA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1189,1207,1216,754,756,930,932,933,1183,1185,1186,1188,1655,2168,1664,1662,1663,1654,433,431,749,751,748,173,174,2149,2150,2152,434] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [593,259,261,1007,1016,1014,240,241,239,520,238,524,2639,576,591,2731,575,2737,2738,2707,2649,2654,2643,2870,2871,2714,1008,2709,2694,2703,2708,2687,2690,1000,2879,2873,551] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [144,306,317,597,598,490,491,492,603,148,583,145,147,149,596,2903,2904,599,2830,2886,2887,2824,2828,602,2811,2816,2819,2807,316,318,470,472] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [1221,1229,1233,775,1676,1680,1683,1685,1686,1243,1681,1782,2190,1691,2185,766,186,188,192,779,2186,2189,2169,2174,2182] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1686,1243,1692,1695,1701,1233,1238,785,1248,1254,789,794,792,2189,2197,192,779,200,205,1251,1252,1245] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [1653,1655,1188,1347,1429,1430,1346,1387,1388,1364,1343,1821,1819,1828,1829] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [2324,2403,2422,2145,2150,2151,2152,2142,432,434,2323,2400,2401,2391,2394,2139,2140,413] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [90,75,76,2766,2624,2621,3016,3017,2611,2617,74,3466,3463,3465] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [125,2337,40,2365,326,328,2377,132,133,2807,141] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2131,2132,2134,2137,2140,2352,2387,2322,2323,2383,2388,2391,2381,2386] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        