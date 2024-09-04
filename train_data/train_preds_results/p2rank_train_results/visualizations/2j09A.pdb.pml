
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
        
        load "data/2j09A.pdb", protein
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
 
        load "data/2j09A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2481,1938,1939,1946,1948,2803,2804,2806,1940,1942,1943,2776,1944,1945,1087,1089,1947,2884,2507,1675,2476,2479,2480,2482,2475,2505,2506,2742,2743,2744,2458,2460,2464,2778,2740,2749,2752,2780,2781,2784,2786,2727,1553,1915,1916,1918,1919,1586,1884,1097,1551,1582,1641,1642,1581,1625,1626,1627,1956,1950,1954,1958,1670,1671,1674,1701,1913,1914,1920,1921,1927,1703,1645,1650,1891,1893,1894,1651,1652,1662,2514,2807,2808,2839,2842,2841,2843,2844,2840,2892,2895,2535,2510,2503,2815,2817,2517,1596] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1990,1991,1992,1993,1995,1996,1987,1989,979,1009,776,760,771,774,775,759,770,764,763,762,1956,1994,1698,1957,1702,1709,2754,2755,2756,98,967,745,963,742,750,755,758,71,73,78,80,1720,1750,1749,978,980,766,2768,2772,2023,2757,2761] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [291,791,793,290,292,1709,345,387,389,300,286,288,289,280,2732,1718,776,775,759,60,61,63,393,43,46,64,250,590,71,70,391,831,758,392,2698,2757,2761,2699,2700,2763,2764,2765,2750,2748,349,350,314,315,2712] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        