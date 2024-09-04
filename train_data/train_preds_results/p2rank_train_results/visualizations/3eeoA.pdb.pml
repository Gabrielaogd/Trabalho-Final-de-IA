
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
        
        load "data/3eeoA.pdb", protein
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
 
        load "data/3eeoA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1120,1444,2515,1116,1121,1123,1126,1127,1128,1129,1130,2518,2903,789,790,791,797,809,811,799,1101,1109,1110,1114,1115,1113,1265,631,633,1264,780,962,968,1240,1241,1237,1235,796,800,802,803,960,1428,1430,1429,1432,1433,1799,670,1094,1095,1097,668,626,628,629,639,976,1450,1786,1443,1455,1459,1152,1158,1160,1165,1151,1780,2492,2896,2876,2898,2899,2900,2901,2902,2904,645,838,2878,642,2503,2508,2512,2870,2871,2872,812,810,2916,2917,2906,2907,2486,2488,2501,2502,1166,2388,1800,2487,2485] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2524,2381,2384,2389,2390,2481,2485,2527,2408,2410,2482,2478,2486,2501,2502,2521,2388,2385,2556,2557,2405,2406,2572,2573] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        