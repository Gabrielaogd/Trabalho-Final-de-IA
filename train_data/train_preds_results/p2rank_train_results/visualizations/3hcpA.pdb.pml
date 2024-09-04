
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
        
        load "data/3hcpA.pdb", protein
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
 
        load "data/3hcpA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2221,89,92,93,94,95,98,99,181,182,216,190,228,401,402,807,1076,809,1104,271,267,269,270,1082,1087,792,793,1084,1110,217,279,1027,473,434,435,461,471,536,101,2247,2259,522,534,1628,1629,1630,1631,1632,2220,1627,1636,1077,1079,1646,1728,1730,1947,2012,2013,1653,1652,1956,1973,1974,2209,2210,2218,1042,2266,2267,1957,2268,462,2269,426,2249,1103] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1057,1718,1071,1704,2705,1058,2713,1115,1117,2824,1096,1125,1069,2797,1126,2734,2735,2796,2708,2710,2731,2795,2829,2736,2701,2725] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1069,2797,1126,248,257,258,259,266,2774,2777,273,285,1697,1698,1070,1071,2762,2763,2769,267] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [1314,1312,2687,2667,2668,2666,2617,2615,2616,2650,2618,1307,2683,2684,2680,1321,1349,1352,1355,2595] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1154,1156,1158,1159,1160,1202,263,244,245,1128,1163,1164,806,808,241,242,203,204,202,791,796,855,856,857,858,842,238,232,233,205] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [2206,2211,2218,2215,1629,1631,2195,2276,2251,2252,1615,1951] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [2846,2848,1218,1232,1233,1234,1231,2836,2838,2837,2840,2841,1146,1148,1194,1178,1188,2816,1177,1179,1187] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2304,2337,427,1954,1956,1962,2057,2338,2349,2055,1959,2056,1953] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [969,965,2635,709,2632,1265,2900,2659] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        