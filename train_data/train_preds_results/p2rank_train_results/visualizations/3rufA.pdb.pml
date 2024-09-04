
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
        
        load "data/3rufA.pdb", protein
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
 
        load "data/3rufA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1514,1533,1534,1539,1547,1540,1544,1855,1593,1647,1652,1653,1541,820,835,1644,1648,1649,1629,1641,1643,1676,1630,1678,813,814,815,816,817,822,826,828,1119,1513,1106,1294,1113,1120,1121,1124,1293,2348,2349,2350,1654,2123,2124,1687,2327,2328,2329,1786,1787,1788,1789,1765,1835,1836,2383,1821,2354,2355,1833,1857,1117,230,232,1518,1516,1102,1322,1323,803,218,221,223,1577,1590,233,197,210,214,225,211,789,788,795,798,799,195,640,406,407,408,843,844,405,1601,1594,1598,401,451,375,376,370,377,802,812,801,924,382,383,384,639] 
set surface_color,  pcol1, surf_pocket1 
   
        
        deselect
        
        orient
        