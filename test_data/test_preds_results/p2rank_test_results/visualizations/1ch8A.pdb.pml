
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
        
        load "data/1ch8A.pdb", protein
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
 
        load "data/1ch8A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [971,1003,966,969,972,977,871,1006,1007,865,870,959,903,1825,1831,960,1826,925,927,1040,1042,889,892,1016,867,924,956,964,2092,2093,2095,2094,290,978,2294,2302,2290,2297,1843,1844,1849,1852,1855,1860,1847,1841,1780,1853,291,294,1002,1009,1819,1763,1764,73,1729,1730,1734,1737,85,94,117,296,300,303,2282,95] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [89,90,91,92,93,2540,2541,2542,2268,2338,2251,2252,2289,105,2539,99,106,107,118,128,3186,317,320,3202,373,126,3201,305,314,318,319,122,2256,2257,2260,2273,303,308,310,94,2558,3198,3199,3203,3204,2565,3196,3197,2557,2534] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1858,1862,1867,1865,1028,1030,264,1870,1059,1871,1873,1899,1901,1918,1919,1917,251,530,532,1922,1779,1026,1066,1025,1057] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [562,849,850,574,575,284,286,576,982,989,801,814,821,991,602,569] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [403,990,991,405,2288,2293,602,603,604,600,284,286,579,576,401,612,578] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [1872,1874,1887,1788,1871,1873,1894,1896,1897,1898,1920,1895,1796,1798,2465,2469] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1321,1049,1090,1091,1281,1291,1293,1320,1040,1041,1042,893,862] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        