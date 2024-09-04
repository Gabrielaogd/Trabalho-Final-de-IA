
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
        
        load "data/2gepA.pdb", protein
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
 
        load "data/2gepA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3031,3032,1249,3026,3028,3030,3022,1258,3018,3019,3021,1261,1262,281,3043,282,3042,2664,2671,2659,2662,2663,3007,2724,2382,283,1245,1253,1257,1256,1243,1641,1642,1638,1639,1640,1668,1657,1658,1669,927,1604,1613,1616,1617,1274,1615,1320,1322,1079,1080,1081,1073,1072,1242,23,24,527,25,329,2668,2670,7,330,258,2669,2700,2721,2702,2703,2706,2707,2714,2698,274,279,288,289,270,273,290,275,937,957,958,959,936,572,579,576,938,939,925,928,600] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [2342,2343,684,686,2419,2420,2068,73,2323,2417,2418,2313,2316,716,690,694,2019,2021,2069,2044,2421,660] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1952,2629,1930,1931,1934,1945,1946,1947,1948,646,2632,2634,2635,2963,2638,2637,2372,2626,1936,1938,3214,3215,2948,2949,3217,2946,2599,1926,2964] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1266,3284,1286,1287,3702,1282,3285,3314,3315,3121,3168,3185,3282,3691,3697,3699,3700,1306,3685,3704] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [3240,1067,1068,1225,1900,1919,1901,1374,1375,1377] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        