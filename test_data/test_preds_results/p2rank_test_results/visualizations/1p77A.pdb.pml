
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
        
        load "data/1p77A.pdb", protein
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
 
        load "data/1p77A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1596,1607,1608,1609,1614,1459,1465,1468,1473,1478,1472,1164,800,801,802,506,508,803,1009,1010,1013,473,474,481,507,505,480,514,477,1600,1803,1804,1781,1806,1809,1811,1830,1832,1831,1833,457,464,504,509,663,103,475,100,1617,1619,1812,98,105,110,115,124,108,109,48,996,1001,1002,1003,1005,1198,1199,1006,1007,1008,1012,517,788,1154,1467,1160,1163,1172] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [1774,1769,1777,1765,1766,1770,1775,1760,1776,1618,1625,1636,1637,2053,2055,1763,1643,1648,1653,1685,1686,1786,2044,2045,2023,2024,2025,2054,1989,1620] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1454,1455,1466,1477,1478,1699,1673,1676,1669,1670,1467,1351,1160,1163,1490,988,990,1485,1479,1480] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [848,1793,1988,875,885,1989,2023,2024,2025,1769,1773,1777,1768,1770,1760] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [620,815,779,1850,1879,1847,1885,1877,1882,1887] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        