
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
        
        load "data/3kgyA.pdb", protein
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
 
        load "data/3kgyA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1335,112,738,911,913,1313,1336,1337,735,901,734,908,680,682,685,895,897,899,501,527,687,1339,1340,1342,1343,1346,1347,1373,1341,121,123,382,383,384,385,403,128,398,167,184,188,192,379,381,451,500,537,420,449,538,765,784,785,766,767,768,769,770,805,808,806,855,858,809,853,268,273,275,846,274,844,271,351,352,353,234,235,752,753,755,756,760,788,960,968,969,790,945,965,915,1117,950,970,974,975,122,124,125,137,114,115,116,676,677,678,675,647,648,436,649,129,130,399,431,433,437,439,443,1489,1801,1802,1800,1740,1741,1476,1478,1479,1480,1820,1821,644,616,609,1758,630,631,669,671,666,1803,1350,1574,1576,1577,1578,1573,1575,1355,1358,1390,1391,989,1596] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [1606,1608,1610,1605,1607,1609,1702,1704,1834,1835,1832,1699,1831,1833] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        