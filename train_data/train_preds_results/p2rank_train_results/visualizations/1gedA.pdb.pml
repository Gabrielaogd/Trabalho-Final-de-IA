
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
        
        load "data/1gedA.pdb", protein
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
 
        load "data/1gedA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2121,2632,2173,2174,2389,2150,2191,2192,2199,2200,632,444,630,2639,2634,2635,2636,2644,2645,2696,2693,2698,725,2674,2675,2692,621,2677,390,2648,2651,2642,2643,2172,2158,2164,1828,1854,1846,1847,1848,1826,1827,1829,1830,1833,1823,1824,1800,1808,1825,1794,1795,1877,1878,1879,2697,2704,781,1158,2710,623,625,1796,1804,2641,2742,2764,1155] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1309,1312,1337,1338,1339,1310,1313,1346,1335,1336,3038,1060,3044,3046,3048,1871,3019,1870,2981,1837,1838,1847,1833,1841,1814,1816,1861,1863,1102,1862,1103,1836,1308,1307,2167,3020,3022] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2189,2183,2208,2205,2209,458,459,460,520,503,504,527,525,547,534,521,2191,2192,632,443,444,639,640] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [2143,1954,1955,2145,2156,82,83,84,87,85,92,1941,1943,1944,1945,1918,1922,1923] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [900,927,1176,1212,1245,1218,1220,1213,1216,1217,934,1138,1140,868,1177,904,905,1135] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2680,662,2667,2670,2678,401,393,394,405,655,663,389,686,425,2217] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        