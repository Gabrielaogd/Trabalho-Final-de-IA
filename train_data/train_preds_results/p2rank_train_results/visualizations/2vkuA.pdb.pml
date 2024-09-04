
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
        
        load "data/2vkuA.pdb", protein
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
 
        load "data/2vkuA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2011,2019,2499,2500,2501,3411,2492,511,512,543,545,517,518,571,540,541,520,1989,1987,2012,2018,2017,1979,1981,1984,1985,1988,699,700,701,639,603,605,606,3041,3098,3095,3105,3076,709,710,711,515,670,669,704,705,3099,3044,2021,3136,3167,2040,2041,2042,2450,3046,3108,3086,3100,3107,3094,3110,3048,2502,2507,2510,2516,2509,2513,542,544,546,3034,2525,2522,2524,435,2542,3077,3422,565,572,563,570,575,579,539,577,580,3402,3409,3410,3412,159,127,3414,3415,125,158,3387,3390,3386,1150,1951,1960,697,1151,737,772,695,696,734,1126,1990,1991,3128,3130,1992,2025,3161,3135,643,1955,641,610,642,628,636,640] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [1949,1957,1958,1964,697,698,1924,1962,1963,1868,659,729,696,734,728,724,725,730,760,726,643,1919,1922,1923,1925,1953,1955,641,644,645,646,642,1857,631,632,634,637,633,700,1773,1740,1741,1764,1866,1870,1793] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2065,2066,3374,3371,167,168,3391,2472,2471,2465,2468,2469,2476,2478,2099,2750,2751,2752,2123,3325,3347,2124,2122,2098,2823,2838,2483,2721,165,2720,3357,3367,3370,3360,3389] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3042,3115,3045,3047,3091,3089,3142,2393,2425,3144,2417,2423,2449,2978,2948,2982,2959,3052,2980,3012,3021,3019,3057,2426,2952] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [803,806,853,825,826,827,1141,1136,1161,1164,1154,1155,1742,1168,1728,1719,836,1147,759,1139,802,834,801] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1067,1068,1069,1267,1070,1071,1074,1303,1304,1306,1038,1041,1266,1269,1301,1302,1099,2001,1305,1032,3459] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2007,1331,3437,3434,1033,1069,2031,2001] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1014,1039,1043,1044,1047,936,1049,1051,1077,1004,1011,964,966,997,1007,1009,932] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        