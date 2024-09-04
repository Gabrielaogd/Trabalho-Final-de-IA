
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
        
        load "data/3aptA.pdb", protein
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
 
        load "data/3aptA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1169,1185,1181,1183,1184,1213,1215,1346,1344,1342,1016,1020,1025,851,852,1232,1008,1009,1010,1011,1012,1014,855,856,864,865,857,859,863,407,410,842,843,840,844,848,636,850,858,2151,2152,1407,1410,1420,1419,1423,1166,152,151,830,404,619,621,406,1212,1214,1229,1233,1238,1234,1307,1308,1309,1310,1311,1312,1175,1216,1283,1313,1317,1279,1306,866,1425,1427,1747,1780,1782,1789,405,174,2149,1435,1426,171,173] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2164,161,163,283,284,285,2160,2172,2189,282,316,317,318,319,2215,310,140,2159,2208,2210,142,2211,2212,2216,2217,2252,2290,2292,2293,312,313,305,307,2243,2193] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        