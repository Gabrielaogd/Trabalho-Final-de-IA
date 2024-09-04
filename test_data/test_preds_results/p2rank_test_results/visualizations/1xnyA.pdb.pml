
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
        
        load "data/1xnyA.pdb", protein
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
 
        load "data/1xnyA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1284,1301,1302,991,1326,1327,734,1126,1127,861,860,892,1101,1103,1299,733,990,717,718,719,973,963,797,799,1245,961,1232,1235,1227,1354,1168,1230] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.310,0.702]
select surf_pocket2, protein and id [1009,1289,1011,1037,1085,1014,1018,1105,1104,1287,1291,1288,1294,1295,1298,1290,1465] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.498,0.361,0.902]
select surf_pocket3, protein and id [2647,2650,2651,1195,1196,1194,2917,3937,3936,3951,2618,2615,2619,2620,2621,2622,2645,1361,2655,1197,1198,2646,2679,2614,1343] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.525,0.278,0.702]
select surf_pocket4, protein and id [1447,1649,1650,1452,1450,1307,1306,1467,1469,1309,1686,1687,1688,1335,1336,1339,1379,1676] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.851,0.361,0.902]
select surf_pocket5, protein and id [3260,3261,3264,3597,3599,3600,3266,3267,3268,3269,3271,3277,3604,3107,3640,3642,3601,3105] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.600]
select surf_pocket6, protein and id [753,1277,1278,260,261,273,275,1423,1438,1439,1577,1578,1579,1580,1581,1583,1441] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.596]
select surf_pocket7, protein and id [2934,3124,2935,3090,2784,2785,2787,2789,3089,2867,2870,2788,2869,2873,2877,2841,2875,2906,2907,2910,2903,2904,2905] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.325]
select surf_pocket8, protein and id [3067,3068,3081,3083,2772,3565,3536,3290,3294,3287,3295,3299,3300,3256,3084,3286] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.478,0.361]
select surf_pocket9, protein and id [2589,1703,2618,2619,2622,1681,1685,1338,1702] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.510,0.278]
select surf_pocket10, protein and id [2779,2785,2787,2776,2771,3078,3076,3077,3085,3086,3089,3274,3090] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.831,0.361]
select surf_pocket11, protein and id [608,613,303,420,590,739,742,607,618,150,173,580,602,605,601,591] 
set surface_color,  pcol11, surf_pocket11 
   
        
        deselect
        
        orient
        