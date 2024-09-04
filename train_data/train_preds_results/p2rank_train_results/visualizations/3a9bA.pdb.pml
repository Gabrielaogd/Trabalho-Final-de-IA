
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
        
        load "data/3a9bA.pdb", protein
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
 
        load "data/3a9bA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [409,410,415,408,2523,2540,2541,2748,413,403,406,407,429,430,428,456,414,1090,1753,1762,1420,2515,2517,2554,2545,2747,2751,2752,2750,2753,1760,1761,390,107,399,402,128,129,477,478,479,476,510,511,124,114,532,505,504,134,164,163,130,2274,2275,2277,2279,2280,2282,1770,1439,1440,1441,1460,1429,2749,2551,2549,2557,675,725,1094,1098,1100,1102,1104,724,1093,1106,1428,1431,1462,1421,674,716,726,774,768,2619,2620,739,742,743,2641,755,738,2615,1131,735,736,737,1161,1455,1457,1152,1456,1458,1459,1461,1451,1454,1151,1153,2260,2276,2278,2281,2658,2258,2257,1449,2638,1160] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [92,97,120,529,554,555,556,528,557,558,559,600,601,82,94,98,99,100] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [2247,2243,1449,1484,1873,1482,1485,1487,1481,1483,1486,1488,1453,1513,1480] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1093,1106,1428,1431,1462,1112,1120,1417,1421] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        