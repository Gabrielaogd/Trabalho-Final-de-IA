
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
        
        load "data/1c1hA.pdb", protein
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
 
        load "data/1c1hA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [71,65,67,68,73,173,58,62,63,64,66,70,900,972,974,2070,2068,911,1013,1015,692,690,1042,756,2082,2088,495,891,894,467,468,2109,2111,54,57,74,79,442,444,685,1504,1853,954,1596,1594,211,210,705,197,207,704,224,934,948,950,952,956,200,202,694,695,1040,1510,1511,960,962,1852,1529,228,230,231,227,2126,2127,2128,366,367,2119,172,341,380,340,2078,2080,1485,1486,1487,1488,1489,1490,1789,1481,2125,2163,1800,1801,1804,1794,1808,184,185,306,307,1788,1817,1818,2112,2116,2075,2089] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [2199,2200,365,1896,1794,1787,1791,1880,1796,1799,1785,1786,2163,2162,367] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        