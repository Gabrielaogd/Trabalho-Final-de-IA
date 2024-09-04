
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
        
        load "data/1xozA.pdb", protein
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
 
        load "data/1xozA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1869,1521,1533,1538,1871,1867,1879,1873,1874,2331,1875,1886,1898,1959,2330,2328,1885,1958,1537,2329,1539,2045,2047,2048,2200,2326,2199,1022,1024,1201,1028,1031,1532,2297,2307,2308,2309,2301,2306,2277,2278,1023,2208,2196,2300,972,973,1870,641,643,691,694,727,718,722,1887,1890,1987,1913,998,999,653,654,2036,2044,2046,1192,2015,1989,1991,2014,2016,2017,2018,2021,1992,1013,1018,1019,2075,721,2327,2295,2296,2325,1541,1545] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [681,682,237,239,1977,2008,229,230,721,636,659,660,661,662,663,667,688,685,669,271,684,605,607,608,631,2009,640,642,1985,1986,1987] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1221,1220,989,985,1004,601,2097,1017,1049,1059,1081,1095,1106,1079,1092,1097,1113,1112,1005,1006] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [366,329,469,405,462,465,467,447,461,114,406,367] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [2076,2108,2207,2106,2107,2183,2184,1036,1037,1075,2161,2165] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1826,2390,1627,1628,2424,2422] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        