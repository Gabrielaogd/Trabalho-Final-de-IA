
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
        
        load "data/3kbnA.pdb", protein
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
 
        load "data/3kbnA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2056,2313,166,168,2311,2312,1488,181,1456,2031,2036,129,131,160,161,158,159,190,212,171,2022,136,132,433,435,436,457,458,459,454,456,448,134,736,751,753,754,755,761,449,1754,1755,1439,1095,139,1440,2292,2293,1098,1100,1101,1102,1103,1084,709,720,721,725,1121,1494,1495,1496,1486] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1087,1089,1090,1091,1286,725,1430,1435,1093,1105,1094,1531,1106,1132,1252,1542,1251,743,830,832] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2564,2674,2633,2975,2977,2554,2555,2152,2153,2155,2158,2160,2184,1806,1832,1834,2154,2159,2979,2982,2984,2942,2156,2157,2672,2673,2943,2945] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1087,1090,1091,722,725,727,1082,1074,1076,726,1094,743,833,1309,1414] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1565,1836,1838,1860,1566,1828,1556,1577,1795,1796,1797,1798,1835,1802,1827,1763,1563] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [439,441,985,987,444,953,949,440,473,475,540,541,502,495,499,485,472,451,947,951,918,952,491,493,494,920,975,974,976,978,982,972,981] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        