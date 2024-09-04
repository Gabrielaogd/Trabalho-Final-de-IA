
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
        
        load "data/3mk0A.pdb", protein
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
 
        load "data/3mk0A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2877,360,361,2555,2590,2887,3473,3474,3475,3476,3477,1226,2564,2192,2562,2563,2565,2566,1187,1212,1214,1215,2588,3455,3450,2589,3441,3448,1307,749,751,765,866,875,779,781,785,1220,1341,1342,1306,1316,3472,3462,3465,3468,3467,738,736] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.322,0.702]
select surf_pocket2, protein and id [1455,1457,1434,1443,998,999,1449,1445,1494,1525,1526,1527,1270,990,1274,1019,1271,996,1022] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.467,0.361,0.902]
select surf_pocket3, protein and id [821,3685,3691,3694,1078,3692,3770,3771,1036,1037,1077,1033,3761,834] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.490,0.278,0.702]
select surf_pocket4, protein and id [2800,3547,3549,3551,579,615,617,578,602,339,2842,2762,2763,2788,2797,2825,2796,341,2732,2738,2740,2764,2765] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.792,0.361,0.902]
select surf_pocket5, protein and id [3532,3533,642,589,594,591,643,376,378,379,381,383,402,403,410,430,369,384,3511,3515] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.659]
select surf_pocket6, protein and id [1556,2413,2112,1132,1558,2396,2397,1121,2435,2436,2437,1117,2424,2431,2105,2110,2114,2124,2113,2115,1543,1094] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.682]
select surf_pocket7, protein and id [1845,1971,1973,1695,1696,1989,1641,1643,1645,1831,1679,1675,1697,1991] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.408]
select surf_pocket8, protein and id [2799,3559,3560,3557,2802,2803,2813,242,238,623,634,259,263] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.361]
select surf_pocket9, protein and id [288,3735,1125,1126,2449,2447,3839,3840,3740,1113,3750,1112,284,3825,3742,3828,3741,2450,2453] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.408,0.278]
select surf_pocket10, protein and id [1521,1524,1523,1275,1276,1069,1253,1274,1040] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.682,0.361]
select surf_pocket11, protein and id [2821,2827,305,306,2790,2794,2778,2784,297,298,2820,2474,2789,2418,2417,2434,2415] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.659,0.278]
select surf_pocket12, protein and id [2962,2964,2968,2969,2974,2975,2963,2980,536,537,538,2938,440,2992,2985,2937] 
set surface_color,  pcol12, surf_pocket12 
   
        
        deselect
        
        orient
        