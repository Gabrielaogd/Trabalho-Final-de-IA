
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
        
        load "data/2wn7A.pdb", protein
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
 
        load "data/2wn7A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1887,1888,1889,1890,1891,1892,1921,1918,1852,1853,1856,1858,1928,2868,2898,2899,2900,2860,2859,2237,2585,2547,2569,2291,2292,2294,2565,1957,2689,2589,2590] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2603,1624,2887,2642,2643,2615,2613,2614,2625,2626,2230,2240,2245,2664,2665,2666,2219,2221,2220,2592,2593,2594,2598,2602,2896,2587,2588,2589,2591,2237,2898,2899,2874,2876,2878,2644] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [272,303,346,3043,275,277,279,345,417,344,431,416,246,264,265,271,383,385,387,3055,3057,384,341,342,343,381,382,414,389,393] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [3018,3019,3021,3106,3107,3025,3002,3020,2730,3119,967,3122,293,294,296,986,989,697,292,304,333,334,2732] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [295,296,297,665,1012,1013,666,650,696,697,985,260,261,267,1006,997,695] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1600,1602,1598,1599,472,1332,1333,1578,286,322,310,311,313,471,505,506,508,1331,1328,1344,1609] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1308,1244,1246,1307,1245,35,38,558,554,1228,602,1042,1041,1230,570,1229] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        