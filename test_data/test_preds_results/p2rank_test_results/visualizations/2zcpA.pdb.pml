
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
        
        load "data/2zcpA.pdb", protein
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
 
        load "data/2zcpA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1125,1132,1149,1150,1151,1133,910,1152,1153,1155,1180,1181,1185,1307,404,402,403,401,431,432,433,434,1096,1098,1126,1127,1128,1527,1372,1526,938,965,966,967,968,969,970,1395,1396,1397,2075,2077,1366,1373,1403,1363,1341,1359,1365,1361,1306,1339,1337,1304,1958,1422,1432,1458,1459,1460,2076,1486,1488,1485,1452,1503,1505,1506,349,150,162,348,128,346,310,1178,1208,339,340,367,308,1176,337,1179,1174,377,366,369,370,411,185,187,182,221,183,222,2042,2018,177,2222,2223,169] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1077,1078,1079,1081,1083,1350,1381,1830,1831,1861,1862,1863,1080,1082,1322,1324,1325,1326,1345,1346,1351,1352,1105,1348,1349,1104] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1059,1088,1089,1092,1086,1087,960,996,1024,1022,1004,957,983,1006,958,1057,1060,1063,1005,929,931,934,956,933,1097,1095] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [142,143,114,84,86,118,155,412,451,452,156,388] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [792,64,66,298,269,783,785,811,812,814,299,266,267,304] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        