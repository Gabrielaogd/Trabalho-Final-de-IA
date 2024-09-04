
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
        
        load "data/3nyqA.pdb", protein
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
 
        load "data/3nyqA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1604,1828,1829,1830,1832,1833,2771,2772,2786,1605,1625,1468,1827,2001,2016,2019,1996,2005,2008,2021,2024,2025,2027,2585,2018,2020,2010,2012,2799,2785,2787,2788,2794,2782,3020,1619,1658,2780,2802,2803,2805,2807,1834,1835,1836,1837,1838,1839,1842,2692,2695,1991,1992,2693,2696,2171,2158,2156,2157,2599,2600,2704,2707,2768,2769,2751,2754,2755,1286,1285,1291,1295,1298,1302,1308,2022,2028,2033,1296,1255,1256,1261,1246,1249,1254,1627,1461,1465,2066,2042,1287,1288,1289,1290,1278,1280,2793,2796,2797,504,3254,3256,3252,3257,1259,1260,958,962,964,969,948,3265,3266,554,555,3247,3248,518,1004,485,1273,1276,949,1279,1258,361,362,497,526,587,503,511,510,516] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [2504,979,984,986,967,2807,971,972,974,2805,2806,2027,2570,2584,2585,2574,2502,2503,2505,2506,2752,2754,980,2755,2589,2590,963,1014,1013,2438,2439,2043,2486,2509] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1610,1856,1837,1838,1841,1842,2767,3016,3022,3023,3008,3015,3021,3024,2783] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        