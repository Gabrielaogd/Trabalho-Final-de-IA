
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
        
        load "data/2biiA.pdb", protein
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
 
        load "data/2biiA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1658,206,207,225,226,227,1651,1081,1432,1434,1077,1079,1459,598,190,192,1376,1430,1449,203,204,1464,1465,1466,179,181,185,200,1467,212,194,1337,219,1033,1032,1034,1480,611,208,648,732,1649,1650,725,726,727,728,729,26,5,6,1659,2934,2918,2920,2917,2915,1428,1429,1431] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1994,3145,3146,3168,1990,1993,69,3147,3136,3141,3151,56,60,50,767,769,64,68,53,63,3122,3124,668,773,2997,3120,3121] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1918,1676,2873,2877,2878,2879,2880,2881,2882,2883,1674,2845,2951,2957,1873,2942,1850,1859,1860,1876,1880,1677,1872,1675,1861,2938,2944,2950,2906,2930,2876] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1171,1173,1170,1174,1175,1164,1165,1151,1156,1157,2511,2532,854,852,853,554,865,555,875,874] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [659,3163,717,750,658,692,685,3212,693,3239,718,3240] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [115,2603,91,98,2605,2607,2602,2630,2631,97,118,122,2336,2339,2629,2628,2600] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        