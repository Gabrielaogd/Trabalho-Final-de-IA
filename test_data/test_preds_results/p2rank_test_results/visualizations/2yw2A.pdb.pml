
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
        
        load "data/2yw2A.pdb", protein
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
 
        load "data/2yw2A.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1655,1656,1657,1658,1659,1737,1738,1739,1736,1167,1148,1149,1150,1160,1110,1111,1168,2205,786,1164,1161,1115,1128,1181,1182,1443,1668,1166,1665,1667,1095,1094,1196,2103,2278,1750,2102,2259,1640,1748,2962,542,1142,1144,1147,2204,2206,2225,2203,2224,764,767,1136,1137,2241,2256,2260,75,1480,1483,1484,2196,2197,2129,1445,1446,1449,1707,1495,2279,1633,1637,2111,1488,2114] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.616,0.278,0.702]
select surf_pocket2, protein and id [2260,75,85,2263,2262,531,51,54,59,60,55,58,541,2241,2859,2957,2855,2943,2857,2642,542,2640,2638,2950,2954,2675,1747,1748,2961,2962,2947,2951,2674] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.361]
select surf_pocket3, protein and id [2838,96,305,95,296,304,2828,2829,2851,2738,2739,2742,2776,2778,2779,2825,2819,121,123,2823,2840,2831,2772,2814] 
set surface_color,  pcol3, surf_pocket3 
   
        
        deselect
        
        orient
        