
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
        
        load "data/1cetA.pdb", protein
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
 
        load "data/1cetA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [853,854,855,856,857,1617,1692,837,838,840,1028,1032,1277,864,1278,1279,1055,1085,1691,1616,1721,1722,1689,93,95,1272,1280,1281,1308,1593,1284,1288,1062,1621,1586,1273,858,861,2277,2248,862,863,869,878,1269,875,605,607,2276,603,604,2239,1296,1297,1292] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [77,240,560,572,239,246,565,568,569,582,583,689,238,248,687,230,247,479,688,714,712,713,255,280,589,561,562,559,66,67,564,64,76,92,93,95,80,88,84,1689] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1762,1763,1200,1203,1204,1205,1044,1046,1072,1075,1076,1735,1738,1715,1734,1074,1194,1193,1197,1198,1863,1869,1731,1732,1733,1858,1875,1877,1245,1102,1104,1229,1234,1244,1228,1230,1100,1219,1859,1860] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1611,1639,1641,1084,1687,1690,1082,1716,1076,1709,1712,1127] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [877,1267,1270,1999,1268,1063,1037,1038,1249] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        