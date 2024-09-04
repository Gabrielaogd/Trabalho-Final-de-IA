
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
        
        load "data/2q5lA.pdb", protein
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
 
        load "data/2q5lA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2799,2801,3389,3391,2797,2803,2806,3126,3328,2971,3137,2972,3138,3141,2959,3363,3364,3376,3385,3349,3359,3350,3380,3366,2960,3400,3427,3393,2069,3392,3429,2063,2062,3399,3398,3948,2810,3330] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1760,1822,2502,1778,1813,2530,2531,2876,1780,1781,2881,2513,2514,2515,2865,2510,2511,2512,2528,1840,1832,1833,1835,1838,1839,1876,1879,1882,1886,3935,1714,1819,1820,2498,2504,2505,1751,1757,1758,1753,1754,2888,2889,2890,2896,2897,2883,2886,2858,1861,3912,3913,2854,2855,2870] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2903,1749,1750,1732,2897,2900,2894,1553,1554,1737,1552,1726,486,488,485,2766,494,496,1740,2909,2913,2915] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [658,657,2951,638,446,448,466,2925,2983,2962,2963,2964,2953] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [404,3169,402,2968,3170,3172,3180,3173,635,638,447,419,420] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [845,846,847,834,1177,965,966,799,795,844,577,763,761,791,792,793,794,575,760,767,769,770,771] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        