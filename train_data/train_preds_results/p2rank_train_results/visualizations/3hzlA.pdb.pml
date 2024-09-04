
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
        
        load "data/3hzlA.pdb", protein
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
 
        load "data/3hzlA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1734,1736,1753,2515,2530,2532,2769,2771,2509,2525,1592,1598,1599,1731,1733,1735,2174,2177,2178,2180,2773,2533,2586,2758,2759,2523,1583,1581,1597,1633,1634,2743,2587,2602,2741,2763,2764,2765,2766,2767,2797,402,2768,2770,803,804,810,473,1754,2147,2014,2011,2012,1897,799,800,801,2151,2153,2154,2157,401,1874,805,809,1895,399,1717,1718,2195,2537,2544,2560,797,798,2557,2575,2559,2590,2591,449,298,321,324,325,328,295,1602,301,302,315,1600,263,265,251,253,1373,250,327,340,366,367,2504,2505,2492,88,89,332,333,2778,2779,2785,96,90,2815,80,94,1578,1579,1582,1574,1577,72,79,242,243,244,285,284,1580,69,231,245,1374,1377,2015,2029,2030,2031,1764,1765,1766,1767,2016,1873,2013,2782,363,365,370,373,374,377,2789] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1881,1039,1883,1038,2409,2410,2423,2424,1808,1809,2422,1860,1846,1853,1856,2033,2034,2036,2116,2117] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [691,693,1173,1174,1175,1176,385,387,389,390,392,383,674,543,542,511,409,411,519,412,388] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [2993,2961,2962,2967,2968,2996,2629,2642,3003,2656,2631,2891,2919,2916,2617,2623,2626,2964,2966] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2326,2356,2358,2401,2402,1985,1986,2331,1923,1089,1090,2329,2392,2352,2353] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        