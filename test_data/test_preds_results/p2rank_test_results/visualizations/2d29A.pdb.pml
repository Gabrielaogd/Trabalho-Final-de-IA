
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
        
        load "data/2d29A.pdb", protein
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
 
        load "data/2d29A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1180,1181,1182,1184,1179,1183,1185,1622,2771,1566,2797,1002,2794,2812,2813,2816,2822,957,995,996,998,962,963,965,950,1194,994,997,1000,1912,2800,2803,2804,2808,2810,2805,2772,2767,2768,2774,1930,2770,673,674,1200,1621,1195,944,730,935,942,1865,1864] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2356,2357,747,771,773,437,2354,745,768,769,774,775,778,780,2402,2403,2352,547,1902,1897,1899,1901,439,518,719,723,1877,440,1852,1843,1875,1876,721,781,1844] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1000,2844,2877,2872,996,1015,1802,1804,2813,1835,1839,1890,2876,1872,2410,1864,1836,1838,1848] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [412,578,406,394,133,134,136,106,130,395,504,108,109,405,404,493,505] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [564,565,563,54,147,148,566,145,146,599,635,190,191,589,592,593,594,595,596,617,618,619,621,623,1964,1965,1966,1992,620,622,2273,2272,2274] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [623,616,622,632,634,2001,2003,233,628,217,216,2712,2674,2701,2675,2676,2714] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [2723,2725,2727,2544,2726,2728,2735,2628,2569,2570,2687,2688] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        