
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
        
        load "data/1bsvA.pdb", protein
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
 
        load "data/1bsvA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [820,821,829,831,833,1019,1045,1046,2188,1074,1018,993,1266,1267,1284,1285,1271,1272,1279,827,808,1262,807,815,94,97,104,501,502,503,507,90,87,474,475,476,810,481,487,483,64,86,486,505,98,102,103,1371,1378,1380,1384,1385,1386,1387,1388,1335,510,512,517,1282,1326,1383,1328,1332,1389,1376,519,994,1617,2153,2187,2189,1011,995,996,1275,1276,1277,1278,1394,1615,1614,1616,2161,2156] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [1617,2153,1599,2145,2152,1276,1277,1278,1394,1393,1395,1957,1958,1615,1614,1956,1616,1390,1389,1415,1376,1557,1563,1423,1562,2140,2150] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [479,483,61,62,64,65,77,86,482,486,313,314,315,79,80,265,266,269,272,273,309,296,250,476,87,658,317,322,307,75,72] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        