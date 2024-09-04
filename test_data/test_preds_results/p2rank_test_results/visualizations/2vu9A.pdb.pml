
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
        
        load "data/2vu9A.pdb", protein
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
 
        load "data/2vu9A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1948,1949,1950,1951,292,342,359,1643,1644,1646,291,300,358,274,308,1952,1955,1956,1980,2009,1914,3441,3446,3436,3447,3448,3452,3455,3430,3431,2008] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [3138,3258,3259,3260,3270,3272,2772,2775,3152,3154,3239,3255,3256,3257,3147,3156,3271,3238,2079,2081,2082,2083,2091,3143,3145,3339,3344,3345,3368,3369] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [1142,1143,1144,1145,1146,2997,3006,3007,3406,1182,1140,1183,1923,1131,2056,2072,2097,2098,2068,1189,2998,1345,1346,1348,1349,1828,2966,618,2980,2981,2983,2973,2976,2979] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1675,1676,1841,1847,1849,1674,333,1857,1665,315,316,1960,1962,616,618,1906,2981,1858,1874,1876,1864,1889] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [14,1749,32,27,1713,1816,1804,1810,1811,1842,1845,79,1854,80,62,63,1696,34,38,1777,1779,1780,1781,1782,1784] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1703,47,490,463,1704,850,795,847,1720,509,511,569,560,506,1717,571] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [2930,3121,3122,3275,3278,3265,3296,3277,3311,3314,3315,3319,2941,2943,3020,3021,3022,3359] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1924,1925,1126,1131,1136,1133,1162,2378,3472,1120] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        