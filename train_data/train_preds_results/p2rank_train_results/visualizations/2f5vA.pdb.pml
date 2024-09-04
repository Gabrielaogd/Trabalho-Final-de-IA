
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
        
        load "data/2f5vA.pdb", protein
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
 
        load "data/2f5vA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4002,866,862,861,4013,4017,4001,965,3241,3242,3243,3255,3257,3983,3999,4011,3991,3997,3998,4010,4012,3426,3428,3989,496,497,3253,3254,922,872,873,2189,2190,2195,2196,2197,2198,2199,2200,4270,2203,2207,2208,912,878,875,887,889,258,260,261,2219,2220,2221,2222,2224,2218,2247,3589,1899,3599,3620,915,919,920,921,943,945,927,102,103,923,924,109,4280,4272,4275,4279,4016,94,93,252,253,251,247,237,238,104,108,83,84,254,1887,81,1896,964,947,950,956,960,4345,4361,4362,4354,973,3206,977,976,4348,3959,3402,3403,3404,2515,2517,2519,2502,3957,3264,3265] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.278,0.702]
select surf_pocket2, protein and id [1331,3071,3067,3069,3070,1329,3060,1372,3063,3064,3051,3031,3042,3087,1617,1645,1628,1622,1623,1624,1663,1666,3228,3229,3274,439,436,437,438,3275,3276,409,432,416,417,418,1667,413,440,446,444,362,3309,3310,3338,3339,3340,3345] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.576,0.361,0.902]
select surf_pocket3, protein and id [1454,2815,2812,2826,2608,2609,1396,1420,2587,1394,1399,1423,2867,2811,2824] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.616,0.278,0.702]
select surf_pocket4, protein and id [3946,3947,3948,3949,3950,3951,3767,3775,3742,3740,3743,3744,3945,3955,3974,3701,3703,3704,3698,2490,2494] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.792]
select surf_pocket5, protein and id [1075,1100,4076,4078,1063,1069,1072,1074,4060,4066,4119,4120,4121,4118,4305,4306] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.447]
select surf_pocket6, protein and id [539,545,3644,3645,543,548,547,531,532,874,890,2224,3589,3590,3594,3586] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.361]
select surf_pocket7, protein and id [1537,1382,1384,1391,1414,1415,1422,1520,1529,1335,1392,1300,1333,1336,1541] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.447,0.278]
select surf_pocket8, protein and id [2416,3508,3509,3510,2387,2378,2341,2309,2312,2344,2346,2347,2342,2443,3484,2386,2429,2352,2353,2356,2358] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.792,0.361]
select surf_pocket9, protein and id [1788,1797,1820,1821,1822,181,182,1704,1709,1719,1724,1726,147,151,149,1714,1716,1759,1760,154] 
set surface_color,  pcol9, surf_pocket9 
   
        
        deselect
        
        orient
        