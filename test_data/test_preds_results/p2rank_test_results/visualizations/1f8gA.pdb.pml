
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
        
        load "data/1f8gA.pdb", protein
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
 
        load "data/1f8gA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1921,1936,1937,2162,1935,1934,1926,1930,1933,1701,1692,1694,1684,1697,2131,2132,2133,2344,2318,2333,2340,2346,2153,2155,2156,2332,1337,1923,1322,1326,1327,1330,1316,1470,1471,1486,1487,1341,1922,1057,2135,1031,1036,1032,1024,718,1009,2352,2353,2338,2336,2337,717,728,539,540,538,1006,1695,122,530,714,716,2430,715,712,537,533,536,1026,1027,1336,1982,1983,1705,1929,1998,1999,1460,1465,1478,1477,1797] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [2480,2483,2484,2485,2486,2488,2496,2583,2516,2517,2519,894,895,896,897,905,2672,2647,2649,2648,919,925,871,872,873,685,875,877,879,863,686,2582,2584,2580,883,2616,2655,2700,2701,2587,2600,2586,2462,508,510,2458,999,1001,1000,703,705,706,689,690,974,977,986,2449,2451,2450,2473,2479,987,990,993,994,959,961,950,962,1007] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [2013,2014,2032,1803,1800,1802,1832,1995,1823,1858,2008] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        