
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
        
        load "data/1rzuA.pdb", protein
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
 
        load "data/1rzuA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1259,1274,1277,1278,1279,1280,1284,1293,1294,1056,719,721,723,809,1070,718,1057,1059,773,774,1300,1314,1316,1297,137,139,65,1258,1281,1282,1283,733,125,126,129,133,120,123] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [2845,2854,2860,2861,2851,2852,2853,126,129,130,131,133,2858,1868,2871,2862,2864,2869,2870,132,153,150,3496,1258,2836,1248,1245,137,1626,160,1259,2330,2331] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [2772,2111,3327,3329,3328,2214,3322,3350,3353,2759,2083,2109,2082,2086,2049,3418,2050,2052,3393,3419,3379,3381,2076,2077,2079,2075] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [3491,3493,1881,3489,176,1885,81,83,1901,1886,1888,577,151,147,149,150,152,196,198,199,195,200,201,204,3504,3507,171,173,175,1915,1908,1917] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [2868,2905,1917,2903,2906,1920,2877,2694,2263,2266,2715,2714,2687,2690,2750,2870] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [2844,2846,2801,2329,2330,2815,2872,2876,2877,2887,2263,2272,2845,2861,2864] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1766,1772,1437,1438,1744,1490,1489,1491,1475,1477,1548,1463,1481,1488,1467,1762,1763] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [184,211,1021,1039,191,37,265,190,264] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        