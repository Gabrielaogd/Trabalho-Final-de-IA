
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
        
        load "data/1jkkA.pdb", protein
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
 
        load "data/1jkkA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1161,1296,1297,1300,1292,207,1295,1178,156,205,151,153,206,1301,1302,1303,1176,1294,774,771,775,777,545,325,516,323,324,544,752,311,1304,618,619,757,1149,796,797,799,150,159,161,162,166,157] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1121,1301,1302,1303,1324,1325,1326,1161,1300,515,1316,1318,325,323,324,475,1137,1138,1120,1455,1150,1447,1448,169,178,182,162,166,193,180,444,445,481,343,342,344,181,474] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1143,1144,1154,1685,1713,1483,1686,840,841,842,846,847,816,814,818,1715,1718,1722,1471,1749,1456,1472,1712,1711] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [1543,1545,1544,2235,2242,2243,2244,2245,1422,1440,1441,1443,1449,1442,1444,1445,1439,1523,1809] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [2126,2129,2130,2145,2131,2146,2147,2120,2109,2138,1057,1610,1578,1577,1579,1583,1584,1054,1581,1049,1050,1051,1078,1588,1589,1591] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        