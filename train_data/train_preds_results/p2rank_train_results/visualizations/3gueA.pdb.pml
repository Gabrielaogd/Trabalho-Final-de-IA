
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
        
        load "data/3gueA.pdb", protein
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
 
        load "data/3gueA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2101,1947,1948,2513,1423,1426,1428,1416,1417,1419,1427,1415,555,2653,579,581,592,2636,575,580,569,570,571,572,573,1406,1405,1190,2529,2528,1953,2093,2094,2268,2090,1950,2263,1657,2272,2284,2285,2286,2287,1943,1944,1949,1952,2099,2100,2649,2650,2651,2652,2105,2657,2494,2102,2512,641,642,643,645,1667,1670,2856,554,650,1660,1661,1663,1664,560,583,587,584,585,567,574,565,637,639,646,595,3199,3200,2858,594,2835,2861,2863,2859,2833,1655,1656,1658] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [532,533,794,1707,822,547,549,550,1650,1635,1694,1697,1700,1701,1633,1703,783,786,3017,3016,762,781,782,788,789,792,819,820,821,908,906] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1998,2000,324,2067,2061,2064,2681,2052,2701,293,2070,291,292,331,2477,2478,2479] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        