
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
        
        load "data/1foaA.pdb", protein
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
 
        load "data/1foaA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [618,619,1790,1791,1783,1785,1776,1777,1779,1778,1780,1786,1789,76,77,1774,1822,1824,2516,2532,2533,2566,1825,86,860,869,1738,84,85,861,1333,1871,1133,1332,1334,1737,1739,1870,606,608,647,649,639,643,646,309,612,637,69,315,616,1502,1514,1525,1526,1527,1512,1533,1534,1535,1566,1504,641,852,850,851,853,61,64,68,57,62,845,1319,834,1327,1335,1347,1517,670,672,1758,1795,1819,1826,1832,1754,1830,1820] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.329,0.278,0.702]
select surf_pocket2, protein and id [2728,2370,2372,2828,2829,2831,2832,2543,2557,2524,2827,2830,2602,2760,2762,2779,2787,2789,2792,2796,2754,2755,2768,2737,2377] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.698,0.361,0.902]
select surf_pocket3, protein and id [1626,1628,1276,1275,2062,2096,2766,2780,2784,2786,2788,2777,2783,1291,1293,1292,2586,2595,2598,2588,1612,1613,1625,1561,1580,1584,1586,1056,1644,2537,2550] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.639]
select surf_pocket4, protein and id [1247,2147,2148,1222,1246,2709,1265,1266,2124,2146,2690,2327,2688,2689,2031,2033,2085,2112,2116,2117,2120,2122,2030,2034,2028,2029,2115,2032,1251,1220,1196] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.545]
select surf_pocket5, protein and id [562,563,564,1494,1501,1503,1504,1505,554,1499,1502,1500,1493,1535,593,594,595] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.353,0.278]
select surf_pocket6, protein and id [563,564,1494,1501,631,1499,1493,1485,1486,1478,1481,1490] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.729,0.361]
select surf_pocket7, protein and id [1350,1351,1367,1433,724,1472] 
set surface_color,  pcol7, surf_pocket7 
   
        
        deselect
        
        orient
        