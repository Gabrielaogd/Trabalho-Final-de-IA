
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
        
        load "data/2qb7A.pdb", protein
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
 
        load "data/2qb7A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2117,3028,3031,3032,3029,3035,1163,1165,3036,3039,3040,1161,3041,3043,1170,264,1587,1586,269,261,1154,1155,1303,233,237,245,2115,2121,2136,2137,2116,1020,1026,1030,1015,236,996,1160,1190,1191,1169,1007,1008,1011,992,995,987,2666,3021,3023,2999,3024,2662,3022,3052,1646,1647,1648,1576,1582,1600,1601,1974,1946,1947,1645,1309,1584,1644,1579,1911,2642,2598,2600,2601,1635,1636,1637,2599,2093,2094,2096,2251,2253,2254,2564,2083,631,654,655,2087,2088,2255,2561,2258,2569,2576,2577,2578,2562,1971,1972,1973,2268,1982,2579,2580,2581,2582,2593,2597,1980,1981,3027,3064,3065,3066,3072,3038,3015,1192,3102,3101,1173,2134,2141] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [479,494,368,369,520,522,370,410,501,495,498,503,1423,1424,400,1115,1117,186,187,946,202,1116,188,1257,1379,1245,961,962,963,1247,1250,1114] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [244,2104,2106,2122,2124,2125,240,2074,1039,1040,556,567,574,575,814,2500,2502,603,2077,1041,241,2126] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1546,1547,1873,1863,1869,1864,1770,1772,1894,1895,1897,1899,1900,1896,1898,713,714,715,1518,711,1516,1521,1522] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [1572,1608,1547,1873,1872,1772,1716,1749,1752,1614,1615,1605,1850] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2710,2711,2694,2949,2434] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        