
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
        
        load "data/1jbwA.pdb", protein
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
 
        load "data/1jbwA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [388,389,392,410,2023,401,402,372,383,374,376,381,382,1286,555,560,561,3051,3052,3062,400,1328,1327,1361,1326,552,554,1138,1139,551,399,1150,1152,1159,3064,2007,2051,2052,1278,1529,2038,1532,1536,2440,2441,2442,2443,2444,2455,3046,2437,2447,2457,385,386,1318,2454,2456,2465,1317,1314,3044,2012,2013,2014,2010,2008,2009,2011,384,2480,2476,2482,1289,2041,2042,2479,1535,2484,2502,2309,2294,2311,2313,2295,678,2332,2333,2438,578,2320,2335,3053,586,2321,2312,547,558,623,624,625,626,653,654,674,695,696,627] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [935,942,974,925,936,937,940,941,126,932,933,934,119,87,924,927,926,132,140,143,144,146,151,1195,953,955,158,156,3061,3063,3064,124,553,554,636,944,1150,1148,1149,1151,943,1189,1155,1183,1178,1190,176,559,1156,1158,3058,89,90,91,92,93,88,562,565,569,571,572,606,570,3084,3057,3116] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1361,1326,1405,1402,400,1152,1159,1160,1161,1162,1423,398,399,1150,372,369,370,371,373,374,376,378,367,368,1274,1297,1443,1272,1317,1314] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        