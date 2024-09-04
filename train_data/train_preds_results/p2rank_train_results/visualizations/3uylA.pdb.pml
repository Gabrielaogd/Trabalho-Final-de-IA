
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
        
        load "data/3uylA.pdb", protein
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
 
        load "data/3uylA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [103,104,105,106,129,131,97,98,133,134,1401,1403,1408,128,132,1422,1432,1438,1428,323,328,327,1429,1614,1615,1616,1617,85,87,89,86,88,90,91,114,115,116,72,837,838,616,587,606,137,1963,1964,1966,1967,1435,1970,1971,1975,1976,1988,1434,1440,1599,1603,1605,1607,1817,1819,1624,2246,2248,2274,2277,2245,2247,2257,2258,2259,2260,2256,2267,1645,2107,983,986,988,2096,2097,2100,2105,2106,2110,2268,991,590,1586,1804,1805,2114,2115,1590,1595,1596] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [1028,1031,1055,1058,1059,1254,1349,1350,1351,1012,1049,1025,957,872,1051,851,1083,1212,1217,1221,1229,1092,1093,831,829] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [79,80,282,62,666,858,702,635,636,667,404,403,616,604,605,611,73] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [427,428,415,2259,2260,465,466,551,579,547,589,443] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        