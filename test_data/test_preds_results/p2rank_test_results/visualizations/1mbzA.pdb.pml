
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
        
        load "data/1mbzA.pdb", protein
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
 
        load "data/1mbzA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2312,2313,2317,2547,2315,2548,2549,3249,3246,2316,2748,2517,2519,2491,2492,2493,2289,2513,2518,2702,2696,2508,2510,2512,1758,2481,2483,2484,2482,1754,1757,2496,2488,2495,3236,3240,3237,1739,1742,1748,3082,3229,3218,3224,2266,2278,2279,2281,2265,2697,2730,2559,2560,2679,2678,2680,2699,2743,2760,2784,2781,2782,2346,3254,3252,2489,3250,2348,2379,2380,2349,3253,3255,1886,1719,1733,1723,2369,1938,1885,1729,1732,1934,1936,2487,2861,2844,2476,1762,1763,2479,1716,1722,1728] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [966,2708,2704,2705,2894,2732,2719,2745,2747,2756,2892,2755,2720,971,2738,2740,2749,973,2753] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1211,2721,2723,1203,1220,1224,1226,1230,2258,2257,1281,2240] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [710,714,424,429,716,450,449,677,705,707,679,680,884,886,923,747,703,704] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        