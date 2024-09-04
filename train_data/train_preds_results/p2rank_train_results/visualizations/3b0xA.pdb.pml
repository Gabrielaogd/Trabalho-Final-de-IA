
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
        
        load "data/3b0xA.pdb", protein
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
 
        load "data/3b0xA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3711,3712,3967,3976,3977,4156,3944,3945,3946,3947,4204,4205,3219,4155,2928,2929,4170,4171,2953,2951,2956,4166,4167,4168,4169,2726,3968,3733,3674,3220,3438,3440,3427,3434,3432,3435,3744,3468] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.302,0.278,0.702]
select surf_pocket2, protein and id [33,2013,1453,1455,1459,1485,1452,2019,2027,2031,2032,2036,2039,2041,2045,2018,2007,2017,1460,1231,1506,1507,1538,1541,1558,1557,2022,1542,1897,1899,1913,1914,1531,1532,1898,1757,1820,1819,1884,1916,34,35,316,1759] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.631,0.361,0.902]
select surf_pocket3, protein and id [4473,4475,4476,4478,4520,4518,4519,4515,4525,4526,4506,4093,3863,4361,4111,4100,4106,4108,3886,3859,3861] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.678,0.278,0.702]
select surf_pocket4, protein and id [1498,4274,1469,1471,1496,2429,4296,2430,2422,2423,2602,2606,4247,4270,4271,4273,4297,4295,2609,4249,4252] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.682]
select surf_pocket5, protein and id [4222,4203,4195,4180,4205,3954,3956,4235,3958,3947,4204,1263,1265,1267,3959,3955,3957] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.341]
select surf_pocket6, protein and id [1753,1759,1760,1763,1766,1767,94,96,315,1770,282,283,65,60,93,59,63,58,35,314,316,279,312,313,280,1757,1819,31] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.522,0.361]
select surf_pocket7, protein and id [1181,1187,1209,1838,1180,1186,1190,1757,1820,1884,778,1756,1758,1759,1760,796,797,1164] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.596,0.278]
select surf_pocket8, protein and id [1505,1515,1507,1508,4026,4008,1516,4306,4017,4018] 
set surface_color,  pcol8, surf_pocket8 
   
        
        deselect
        
        orient
        