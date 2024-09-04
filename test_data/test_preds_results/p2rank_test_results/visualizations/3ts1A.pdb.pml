
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
        
        load "data/3ts1A.pdb", protein
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
 
        load "data/3ts1A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1467,1472,1478,1481,1504,1505,1506,1507,391,1482,1693,275,288,390,276,277,278,279,286,1700,384,557,1296,295,296,297,298,291,1328,1329,1330,1327,930,266,531,1354,589,1497,1498,601,1692,587,311,347,615,309,310,312,616,369,371,294,1812,339,348,349,359,360,361,362] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [550,576,1320,578,939,974,976,569,971,1321,991,1027,1028,1026,968,1001,1004,987,1006,1250,1252,1029,1031,1282,1284,1032,577,1256,1259] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [1769,1931,1933,1966,1967,1762,1713,1714,1939,1940,1937,1972,1978,2011,1982,1755,1756,1757,1759,1750,2049,2048,1727] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1285,1311,1312,1138,1068,1094,1069,1070,1250,1252,1031,1040,1276,1278,1251,1113,1137,1093] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [574,561,562,302,673,655,307,309,310,312,616,645,646,297,560,573,579,580] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [1153,1161,1165,1166,1170,1150,1494,1522,1174,1175,1523,1158,1546,1547,1160,1488,1493,1508,1512,1514,1516,1492] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        