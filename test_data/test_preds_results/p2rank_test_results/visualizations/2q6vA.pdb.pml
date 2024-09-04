
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
        
        load "data/2q6vA.pdb", protein
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
 
        load "data/2q6vA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [79,81,995,996,1181,1190,1220,1222,78,80,152,77,159,149,132,420,418,141,122,137,143,70,72,71,326,325,327,69,73,429,426,427,428,1219,1002,1223,1212,1000,1004,1007,1237,783,785,2319,1545,1189,153,1546,2320,188,189,2767,2309,2313,2314,2305,2287,2326,2330,2318,2322,2321,2355,131,2055,1717,1718,1719,1721,1722,1725,140,2080,2074,2075,2078,1918,2060,1736,1737,2288,1745,2253,1738,1735,1730,1731,1746,1180,1215,2260,2261] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1533,1534,1535,1536,1537,1525,1540,2740,2745,2746,2812,2297,2298,2299,1402,1522,1524,1519,2885,2887,2897,2728,2733,2300,2488,2490,2719,2722,2721] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [2760,2762,185,187,2770,2774,221,2756,1572,1574,1563,1565,1562,1566,1570,2752,2088,1583,1615,2078,2081,2084,144,145,210,212,209,220,241] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [658,648,655,396,397,398,400,368,636,635,71,326,325,327,429,409,410,412,405,406,322,372] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2318,2321,2352,2353,2354,2355,1558,1550,1552,2320,188,2767,140,2082] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        