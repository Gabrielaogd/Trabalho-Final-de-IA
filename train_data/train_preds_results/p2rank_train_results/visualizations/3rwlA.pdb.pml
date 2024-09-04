
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
        
        load "data/3rwlA.pdb", protein
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
 
        load "data/3rwlA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [614,2330,714,715,716,2352,2354,2551,2552,2835,2836,2795,2796,2797,2857,2806,504,2833,1946,3183,620,622,1412,3185,3186,603,604,607,721,613,2374,582,601,602,648,581,1944,1971,1951,1974,1976,1977,1978,1979,2329,2331,2322,2272,2323,2802,2018,2791,3193,1949,1926,1922,1932,706,708,1924,2864,2845,2854,2859,2863,820,822,1920,1948,1923,697,694,713,776,1928,1952,1212,1950,1953,1984,2869,2901,2896,2858,869,2866,2867] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [3141,2056,174,2087,2088,2295,2296,2298,2086,2293,2664,3217,2308,3219,2299,170,172,173,188,2564,189,2668,2669,200,2309,3201,3202,2562,2592,2290,2591] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [1405,1402,1510,662,1913,1550,681,678,679,697,686,694,695,696,1945,1893,1911,1917,1918,1921,1923,1412] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        