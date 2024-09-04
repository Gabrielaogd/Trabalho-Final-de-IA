
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
        
        load "data/1bx4A.pdb", protein
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
 
        load "data/1bx4A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2327,2338,2339,2340,2341,2342,2343,2320,2325,2328,2332,2582,2550,2553,2554,2551,2581,1541,1543,1751,1775,1776,277,278,1556,1557,1529,1530,1531,1740,1741,1742,1744,2344,2365,2375,2362,2363,2364,2552,2524,2522,2330,2315,2321,2322,2323,1018,275,256,262,274,263,257,268,1766,2300,2109,2273,2274,2261,2090,2101,2102,2103,2104,2105,2089,2091,2137,2231,2232,2525,2528,2530,2233,2241,2245,2106,2244,2248,1748,1759,1743,2069,498,499,1320,1321,1323,1325,2351,1324,1310,523,2352,2333,959,1035,1033,1034,2316,1019,2606,2609,2611,2612,969,983,130,131,100,116,490,115,117,114,484,475,2614,477,2613,522,492,494,500,79,82,83,505,458,1318,1319,1322,1568,1064,282,294,1048] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [574,2639,2637,569,817,819,810,816,828,830,2643,2650,2653,2654,2655,2632,605,606,632,544,546,2619,820,791,601,481,484,485,472,2615,2626,2628,478,792,793,794,795,2620,2629] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1720,2424,2058,2468,2470,2450,1718,1709,2034,2024,1497,2026,2028,2445] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        