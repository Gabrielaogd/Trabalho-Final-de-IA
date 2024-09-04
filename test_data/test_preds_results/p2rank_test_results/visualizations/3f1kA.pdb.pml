
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
        
        load "data/3f1kA.pdb", protein
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
 
        load "data/3f1kA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1553,186,188,178,1540,1541,1543,1548,1552,1512,1513,1514,1515,1518,1521,793,794,795,796,797,799,805,1555,1508,1174,1181,1182,1510,1511,1501,1502,1873,1886,1885,1307,1279,1281,1306,1170,1258,1259,1260,1582,1562,1591,1593,1909,1564,1932,1910,1557,1560,1556,1551,806,809,810,811,812,1929,1916,1187,1188,1913,1914,1915,1923,1255,1280,1257,1195,1194,1232,786,787,171,172,173,177,181,783,1874,1875] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [155,789,792,151,154,321,156,157,320,319,167,168,173,333,334,344,326,329,561,565,566,567,568,548,324,793,796,968,336,337,559,969,335] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [1327,1162,1163,1382,1009,1011,1037,1322,1325,983,1342,1343,1360,1381,1383,1004,1160,981,1006] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1136,1775,1151,1728,1761,752,1135,746,130,131,247,248,87,88,766] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        