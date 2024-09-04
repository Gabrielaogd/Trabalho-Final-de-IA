
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
        
        load "data/3agcA.pdb", protein
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
 
        load "data/3agcA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1883,1919,1920,1952,1917,1918,1950,1951,1953,1942,1945,729,1881,1879,2156,1891,1338,1880,1882,1305,1309,1334,1336,1337,1340,1311,1316,1289,947,1847,1878,1877,793,959,1857,1842,1844,1873,1308,811,825,826,910,827,842,843,810,1339,911,1346,1315,1277,1262,1263,713,714,797,809,941,942,790,2157,1926,2122,1960,1959,1961,1949,2123,1995,577,686,597,599,1996,1997,687,565,566,567,576,448,450,700,376,1330,1332,1846,1331] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [870,1449,1450,1451,97,101,91,92,849,850,676,679,852,81,851,661,663,866,95,123,888,868,1476] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [220,221,457,458,459,460,31,353,299,355,300,27,28,29,32,36,39,48,446,364] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1864,1825,1826,1827,750,739,742,746,539,541,1892,1856,1854,540,2150,2136,2145,2159] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [307,308,309,2114,2139,2141,540,2136,2143,2145,2146,485,317,464,467,302,292,287,480,484] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [773,1065,1076,1737,770,772,1734,763,778,1682,1683,1715,1723,1724,1730,1655,755,1733,1751,762,759,765] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        