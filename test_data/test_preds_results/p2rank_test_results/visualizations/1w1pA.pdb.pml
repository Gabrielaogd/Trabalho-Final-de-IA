
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
        
        load "data/1w1pA.pdb", protein
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
 
        load "data/1w1pA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1687,1688,1689,2295,2279,2281,2280,2639,2640,2641,2642,2448,766,2277,3222,2648,2652,3225,3189,3204,3203,3214,3215,3216,89,91,92,107,85,98,130,131,237,228,230,231,233,1686,1722,1724,1725,1726,1727,1720,1721,1723,1693,1694,1737,754,756,757,759,2444,2446,2450,2631,2632,2430,2616,2638,2596,2612,2566,2563,2567,2597,2598,2599,2589,1681,1679,3185,1456,1460,1659,1660,1674,1690,1458,1461,1698,396,398,399,3186,3187,3188,3190,3191,3192,3193,90,1111,66,68,1663,1133,1144,1145,752,753,755,758,760,762,745,748,1134,1662,1446,97,1463,1473,1474,1487,1489,1488,1490,1475,1477,2080] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.416,0.278,0.702]
select surf_pocket2, protein and id [766,767,768,769,770,771,772,500,91,92,102,105,108,112,113,783,96,389,392,393,497,743,782,784,498,396,398,3192,90,762,745,748] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.878]
select surf_pocket3, protein and id [1615,35,38,1628,1630,343,345,678,679,34,17,13,18,354,696,1418,1616,1618,1397,1389,677] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.380]
select surf_pocket4, protein and id [423,863,963,964,1229,1207,1209,893,859,1124,1122] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.620,0.361]
select surf_pocket5, protein and id [3058,2833,2816,3012,3018,2794,2810,2811,2812,2813,2814,2815,2817,3014] 
set surface_color,  pcol5, surf_pocket5 
   
        
        deselect
        
        orient
        