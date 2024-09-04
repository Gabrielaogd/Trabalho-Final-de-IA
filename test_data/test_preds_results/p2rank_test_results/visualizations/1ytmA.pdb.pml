
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
        
        load "data/1ytmA.pdb", protein
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
 
        load "data/1ytmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2169,2171,2172,2173,2514,2187,1915,1908,1914,2022,1909,1913,1884,1597,426,427,1554,1746,2020,1921,2268,2242,2168,2203,2184,1589,2021,2019,2151,2155,2157,1553,1887,1888,1891,1920,1892,1896,1897,1928,1929,2489,1922,3414,3416,1930,1880,1883,1885,1886,1889,2978,2976,2967,3330,3392,3331,3333,2961,3390] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [3053,631,3058,3981,626,3071,3070,2987,2953,3104,3108,646,647,648,2954,630,633,634,635,636,452,1877,1878,3103,571,3952] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [2011,2013,2146,2147,2164,2540,2266,2585,2583,1991,1992,2260,2584,2594,1912,1942,1938,1915,1936] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [2876,2850,2875,2877,2890,2844,2879,2852,3604,2878,2880,3920,3928,2892,3607,3892,3894,3592,3602,3895,3932,3933,3934,3935] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [1128,901,904,2641,1127,2637,2642,2606,2610,2626,2636,903,2635,2618,1136,1137,2135,1129,2564,2566,2555,2561,1132] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [166,1133,154,159,145,1143,149,141,157,1093,1134,1135,1136,1092,2566,2567] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [845,847,215,1030,259,1013,214,826,827,291] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        