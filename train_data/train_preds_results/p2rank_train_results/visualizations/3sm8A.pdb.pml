
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
        
        load "data/3sm8A.pdb", protein
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
 
        load "data/3sm8A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2675,2677,2678,2680,424,2679,2711,448,471,472,425,463,468,1805,2017,2014,1981,470,864,861,862,863,736,737,1957,1983,449,738,753,733,1167,460,860,461,956,1989,1997,865,1149,2465,2475,2476,381,382,2458,2459,2460,406,407,409,411,2701,380,396,397,405,2447,421,1801,1802,1800,1803,2043,2045,2046,1818,1959,415,2663,2667,2668,2670,2692,2693,2704,1638,1641,1642,1644,2485,377,1659,1653,369,371,367,374,1661,1655,318,1637,1633,1636,1639,146,150,151,296,1689,1680,1681,1704,308,307,309,310,314,316,1412,1415,1416,1419,1705,163,169,2700,2703,388,383,347,387,175,160,159] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [2732,225,577,2755,220,222,2756,215,217,575,547,2731,572,627,625,626,570,571,2859,2861,2862,2863,2871,643,210,211,212,637,638,631,636,246,1343,1344,1345,1305,1307,1333,205] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [475,476,478,484,2521,2513,2519,2478,2493,2495,2496,2497,2690,1785,2688,472,1805,2016,2017,2018,2152,470] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [774,2032,2034,2346,773,2340,772,2343,2023,2024,2009,2342,2311,2315] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [218,2775,2776,2777,2780,217,255,256,2805,253,2751,220,2753,2756,2773,2847,2822,2823] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1405,1406,1551,1552,1549,1572,46,48,50,52,1553,82,1381] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        